#!/usr/bin/env node
import { Server } from "@modelcontextprotocol/sdk/server/index.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import {
  CallToolRequestSchema,
  ListToolsRequestSchema,
} from "@modelcontextprotocol/sdk/types.js";
import { YoutubeTranscript } from "youtube-transcript";
import { pipeline } from "@huggingface/transformers";
import pkg from "wavefile";
const { WaveFile } = pkg;
import YTDlpWrap from "yt-dlp-wrap";
import { exec } from "child_process";
import { promisify } from "util";
import fs from "fs/promises";
import path from "path";
import os from "os";

const execAsync = promisify(exec);

// Whisper pipeline (lazy loaded)
let whisperPipeline = null;

const server = new Server(
  { name: "youtube-transcript", version: "1.1.0" },
  { capabilities: { tools: {} } }
);

// Extract video ID from various YouTube URL formats
function extractVideoId(url) {
  const patterns = [
    /(?:youtube\.com\/watch\?v=|youtu\.be\/|youtube\.com\/embed\/)([^&\n?#]+)/,
    /^([a-zA-Z0-9_-]{11})$/,
  ];
  for (const pattern of patterns) {
    const match = url.match(pattern);
    if (match) return match[1];
  }
  throw new Error(`Invalid YouTube URL: ${url}`);
}

// Format timestamp
function formatTimestamp(ms) {
  const minutes = Math.floor(ms / 60000);
  const seconds = Math.floor((ms % 60000) / 1000);
  return `[${minutes}:${seconds.toString().padStart(2, "0")}]`;
}

// Try to get transcript from YouTube
async function getYouTubeTranscript(videoId, lang) {
  const options = lang ? { lang } : {};
  const transcript = await YoutubeTranscript.fetchTranscript(videoId, options);

  return transcript.map((segment) => ({
    text: segment.text,
    timestamp: formatTimestamp(segment.offset),
    offset: segment.offset,
    duration: segment.duration,
  }));
}

// Initialize Whisper pipeline
async function getWhisperPipeline() {
  if (!whisperPipeline) {
    console.error("Loading Whisper model (first time may take a moment)...");
    whisperPipeline = await pipeline(
      "automatic-speech-recognition",
      "Xenova/whisper-small",
      { dtype: "q8" }
    );
  }
  return whisperPipeline;
}

// Download audio from YouTube using yt-dlp
async function downloadAudio(videoId) {
  const tmpDir = os.tmpdir();
  const outputPath = path.join(tmpDir, `${videoId}.wav`);
  const homeDir = os.homedir();

  // Try multiple yt-dlp paths (pip install location first, then system)
  const ytdlpPaths = [
    path.join(homeDir, ".local/bin/yt-dlp"),
    "yt-dlp",
  ];

  let ytdlp = null;
  for (const p of ytdlpPaths) {
    try {
      await execAsync(`${p} --version`);
      ytdlp = p;
      break;
    } catch {
      continue;
    }
  }

  if (!ytdlp) {
    throw new Error("yt-dlp not installed. Install with: pip install yt-dlp");
  }

  // Download and convert to WAV 16kHz mono
  const url = `https://www.youtube.com/watch?v=${videoId}`;
  const tempFile = path.join(tmpDir, `${videoId}_temp`);
  const cookiesFile = path.join(path.dirname(new URL(import.meta.url).pathname), "cookies.txt");

  // Use cookies file for auth (exported from Chrome)
  const ytdlpOpts = [
    `-x --audio-format wav`,
    `-o "${tempFile}.%(ext)s"`,
    `--cookies "${cookiesFile}"`,
  ].join(" ");

  // Add deno to PATH for JS challenge solving
  const env = { ...process.env, PATH: `${homeDir}/.deno/bin:${process.env.PATH}` };

  await execAsync(
    `${ytdlp} ${ytdlpOpts} "${url}" && ` +
    `ffmpeg -y -i "${tempFile}.wav" -ar 16000 -ac 1 "${outputPath}" 2>/dev/null && ` +
    `rm -f "${tempFile}.wav"`,
    { timeout: 300000, env }
  );

  return outputPath;
}

// Transcribe audio with Whisper
async function transcribeWithWhisper(audioPath) {
  const transcriber = await getWhisperPipeline();

  // Read and prepare audio
  const audioBuffer = await fs.readFile(audioPath);
  const wav = new WaveFile(audioBuffer);
  wav.toBitDepth("32f");
  wav.toSampleRate(16000);

  let audioData = wav.getSamples();
  if (Array.isArray(audioData)) {
    audioData = audioData[0]; // Use first channel
  }

  // Transcribe
  const result = await transcriber(audioData, {
    chunk_length_s: 30,
    stride_length_s: 5,
    return_timestamps: true,
  });

  // Clean up temp file
  await fs.unlink(audioPath).catch(() => {});

  // Format output
  if (result.chunks) {
    return result.chunks.map((chunk) => ({
      text: chunk.text,
      timestamp: formatTimestamp(chunk.timestamp[0] * 1000),
      offset: chunk.timestamp[0] * 1000,
      duration: (chunk.timestamp[1] - chunk.timestamp[0]) * 1000,
    }));
  }

  return [{ text: result.text, timestamp: "[0:00]", offset: 0, duration: 0 }];
}

// List available tools
server.setRequestHandler(ListToolsRequestSchema, async () => ({
  tools: [
    {
      name: "get_transcript",
      description:
        "Extract transcript from a YouTube video. First tries YouTube captions, " +
        "then falls back to Whisper AI transcription if unavailable.",
      inputSchema: {
        type: "object",
        properties: {
          url: {
            type: "string",
            description: "YouTube video URL or video ID",
          },
          lang: {
            type: "string",
            description: "Language code (e.g., 'en', 'fr'). Default: auto-detect",
          },
          force_whisper: {
            type: "boolean",
            description: "Force Whisper transcription even if captions exist",
          },
        },
        required: ["url"],
      },
    },
  ],
}));

// Handle tool calls
server.setRequestHandler(CallToolRequestSchema, async (request) => {
  if (request.params.name !== "get_transcript") {
    throw new Error(`Unknown tool: ${request.params.name}`);
  }

  const { url, lang, force_whisper } = request.params.arguments;

  try {
    const videoId = extractVideoId(url);
    let segments = [];
    let source = "youtube_captions";

    // Try YouTube transcript first (unless force_whisper)
    if (!force_whisper) {
      try {
        segments = await getYouTubeTranscript(videoId, lang);
        console.error(`Got ${segments.length} segments from YouTube captions`);
      } catch (ytError) {
        console.error(`YouTube captions unavailable: ${ytError.message}`);
      }
    }

    // Fallback to Whisper if no transcript
    if (segments.length === 0) {
      console.error("Using Whisper fallback...");
      source = "whisper_ai";

      const audioPath = await downloadAudio(videoId);
      segments = await transcribeWithWhisper(audioPath);
      console.error(`Whisper transcribed ${segments.length} segments`);
    }

    // Format output
    const formattedText = segments
      .map((s) => `${s.timestamp} ${s.text}`)
      .join("\n");

    const totalDuration = segments.reduce((sum, s) => sum + (s.duration || 0), 0);

    const summary =
      `Video ID: ${videoId}\n` +
      `Source: ${source}\n` +
      `Segments: ${segments.length}\n` +
      `Duration: ~${Math.round(totalDuration / 1000)}s\n\n` +
      formattedText;

    return {
      content: [{ type: "text", text: summary }],
    };
  } catch (error) {
    return {
      content: [{ type: "text", text: `Error: ${error.message}` }],
      isError: true,
    };
  }
});

// Start server
const transport = new StdioServerTransport();
await server.connect(transport);
