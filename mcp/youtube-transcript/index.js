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
import { exec, execFile } from "child_process";
import { promisify } from "util";
import fs from "fs/promises";
import path from "path";
import os from "os";

const execAsync = promisify(exec);
const execFileAsync = promisify(execFile);

// Simple rate limiter (token bucket algorithm)
class RateLimiter {
  constructor(maxRequests = 5, windowMs = 60000) {
    this.maxRequests = maxRequests;
    this.windowMs = windowMs;
    this.requests = [];
  }

  canMakeRequest() {
    const now = Date.now();
    // Remove expired requests
    this.requests = this.requests.filter(t => now - t < this.windowMs);
    return this.requests.length < this.maxRequests;
  }

  recordRequest() {
    this.requests.push(Date.now());
  }

  getWaitTime() {
    if (this.canMakeRequest()) return 0;
    const oldest = this.requests[0];
    return Math.max(0, this.windowMs - (Date.now() - oldest));
  }
}

// Rate limiter: 5 requests per minute
const rateLimiter = new RateLimiter(5, 60000);

// Transcript cache (videoId -> { transcript, timestamp })
const transcriptCache = new Map();
const CACHE_TTL_MS = 3600000; // 1 hour

function getCachedTranscript(videoId) {
  const cached = transcriptCache.get(videoId);
  if (cached && Date.now() - cached.timestamp < CACHE_TTL_MS) {
    console.error(`Cache hit for ${videoId}`);
    return cached.data;
  }
  return null;
}

function setCachedTranscript(videoId, data) {
  transcriptCache.set(videoId, { data, timestamp: Date.now() });
  // Limit cache size to 100 entries
  if (transcriptCache.size > 100) {
    const oldest = transcriptCache.keys().next().value;
    transcriptCache.delete(oldest);
  }
}

// ISO 639-1 language codes whitelist
const VALID_LANG_CODES = new Set([
  'en', 'fr', 'es', 'de', 'it', 'pt', 'nl', 'ru', 'zh', 'ja', 'ko', 'ar',
  'hi', 'pl', 'tr', 'vi', 'th', 'id', 'cs', 'sv', 'da', 'fi', 'no', 'hu',
  'el', 'he', 'ro', 'uk', 'bg', 'hr', 'sk', 'sl', 'lt', 'lv', 'et', 'ms'
]);

// Validate language code
function validateLang(lang) {
  if (!lang) return null;
  const normalized = lang.toLowerCase().trim();
  if (VALID_LANG_CODES.has(normalized)) {
    return normalized;
  }
  console.error(`Invalid language code: ${lang}, using auto-detect`);
  return null;
}

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
  const validLang = validateLang(lang);
  const options = validLang ? { lang: validLang } : {};
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
  const homeDir = os.homedir();

  // Create secure temporary directory with unique name
  const secureDir = await fs.mkdtemp(path.join(os.tmpdir(), 'yt-trans-'));
  const outputPath = path.join(secureDir, `${videoId}.wav`);
  const tempFile = path.join(secureDir, `${videoId}_temp`);

  // Set restrictive permissions on temp directory
  await fs.chmod(secureDir, 0o700);

  // Try multiple yt-dlp paths (pip install location first, then system)
  const ytdlpPaths = [
    path.join(homeDir, ".local/bin/yt-dlp"),
    "/usr/local/bin/yt-dlp",
    "/usr/bin/yt-dlp",
  ];

  let ytdlp = null;
  for (const p of ytdlpPaths) {
    try {
      await execFileAsync(p, ["--version"]);
      ytdlp = p;
      break;
    } catch {
      continue;
    }
  }

  if (!ytdlp) {
    // Cleanup on error
    await fs.rm(secureDir, { recursive: true, force: true }).catch(() => {});
    throw new Error("yt-dlp not installed. Install with: pip install yt-dlp");
  }

  // Build URL safely
  const url = new URL("https://www.youtube.com/watch");
  url.searchParams.set("v", videoId);

  const cookiesFile = path.join(path.dirname(new URL(import.meta.url).pathname), "cookies.txt");

  // Add deno to PATH for JS challenge solving
  const env = { ...process.env, PATH: `${homeDir}/.deno/bin:${process.env.PATH}` };

  try {
    // Use execFile for yt-dlp (safer than shell execution)
    const ytdlpArgs = [
      "-x", "--audio-format", "wav",
      "-o", `${tempFile}.%(ext)s`,
      "--cookies", cookiesFile,
      url.toString()
    ];

    await execFileAsync(ytdlp, ytdlpArgs, { timeout: 300000, env });

    // Use execFile for ffmpeg conversion
    await execFileAsync("ffmpeg", [
      "-y", "-i", `${tempFile}.wav`,
      "-ar", "16000", "-ac", "1",
      outputPath
    ], { timeout: 60000, env });

    // Cleanup temp file
    await fs.unlink(`${tempFile}.wav`).catch(() => {});

    return outputPath;
  } catch (error) {
    // Guaranteed cleanup on error
    await fs.rm(secureDir, { recursive: true, force: true }).catch(() => {});
    throw error;
  }
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

  // Clean up temp file and its parent directory
  const parentDir = path.dirname(audioPath);
  await fs.unlink(audioPath).catch(() => {});
  // Remove the secure temp directory if it matches our pattern
  if (parentDir.includes('yt-trans-')) {
    await fs.rm(parentDir, { recursive: true, force: true }).catch(() => {});
  }

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

    // Check cache first (unless force_whisper)
    if (!force_whisper) {
      const cached = getCachedTranscript(videoId);
      if (cached) {
        return {
          content: [{ type: "text", text: cached + "\n\n(from cache)" }],
        };
      }
    }

    // Check rate limiter
    if (!rateLimiter.canMakeRequest()) {
      const waitTime = Math.ceil(rateLimiter.getWaitTime() / 1000);
      return {
        content: [{ type: "text", text: `Rate limit exceeded. Please wait ${waitTime} seconds before trying again.` }],
        isError: true,
      };
    }
    rateLimiter.recordRequest();

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

    // Cache the result
    setCachedTranscript(videoId, summary);

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
