#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'USAGE'
Usage: setup-team-memory.sh <project-path> [vault-name]

Creates a dedicated Obsidian memory repo under ~/projects/memories and injects
a DOX/Linear/squad operating block into the target project's AGENTS.md or CLAUDE.md.

Environment:
  MEMORY_ROOT  Override memory root (default: ~/projects/memories)
USAGE
}

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ] || [ $# -lt 1 ]; then
  usage
  exit 0
fi

project_path="$1"
vault_name="${2:-$(basename "$project_path")-memory}"
memory_root="${MEMORY_ROOT:-$HOME/projects/memories}"
vault_path="$memory_root/$vault_name"

if [ ! -d "$project_path" ]; then
  echo "Project path does not exist: $project_path" >&2
  exit 1
fi

mkdir -p "$vault_path"/{wiki/{stories,decisions,sources,logs},_attachments,.obsidian/snippets}

cat > "$vault_path/.obsidian/community-plugins.json" <<'JSON'
[
  "obsidian-local-rest-api",
  "obsidian-git",
  "dataview",
  "templater-obsidian",
  "calendar",
  "thino"
]
JSON

cat > "$vault_path/.obsidian/core-plugins.json" <<'JSON'
[
  "file-explorer",
  "global-search",
  "switcher",
  "graph",
  "backlink",
  "canvas",
  "outgoing-link",
  "tag-pane",
  "page-preview",
  "daily-notes",
  "templates",
  "command-palette"
]
JSON

cat > "$vault_path/README.md" <<EOF
# $vault_name

Dedicated Obsidian memory vault for:

- Project: $project_path
- Stories: wiki/stories
- Decisions: wiki/decisions
- Sources: wiki/sources
- Logs: wiki/logs

Open this folder as an Obsidian vault, install the listed community plugins, then enable them.
EOF

cat > "$vault_path/wiki/index.md" <<EOF
# Memory Index

## Project

- Repository: \`$project_path\`

## Entry Points

- [[stories]]
- [[decisions]]
- [[sources]]
- [[logs]]
EOF

cat > "$vault_path/.gitignore" <<'EOF'
.obsidian/workspace*.json
.obsidian/plugins/*/data.json
.DS_Store
EOF

agent_file="$project_path/AGENTS.md"
if [ ! -f "$agent_file" ] && [ -f "$project_path/CLAUDE.md" ]; then
  agent_file="$project_path/CLAUDE.md"
fi
touch "$agent_file"

start_marker="<!-- team-memory-config:start -->"
end_marker="<!-- team-memory-config:end -->"

if grep -q "$start_marker" "$agent_file"; then
  tmp_file="$(mktemp)"
  awk -v start="$start_marker" -v end="$end_marker" '
    $0 == start {skip=1; next}
    $0 == end {skip=0; next}
    skip != 1 {print}
  ' "$agent_file" > "$tmp_file"
  mv "$tmp_file" "$agent_file"
fi

cat >> "$agent_file" <<EOF

$start_marker
## Team Memory Workflow

- Use Linear as the delivery source of truth for stories, priorities, acceptance criteria, and status.
- Link durable implementation notes back to the active Linear story when the story identifier is known.
- Use the Obsidian memory vault at \`$vault_path\` for durable project memory, including story summaries, decisions, source notes, and session logs.
- Follow DOX before editing: read the closest applicable \`AGENTS.md\` or \`CLAUDE.md\`, then update the local contract when stable responsibilities, workflows, or verification rules change.
- Act as a team lead for broad work: split the story, create or update work tickets, and use \`squad-ticket\`, \`squad-spawn\`, \`squad-status\`, \`squad-capture\`, \`squad-waiting\`, \`squad-respond\`, and \`squad-done\` to coordinate workers.
- Close the loop by updating Linear, recording durable context in Obsidian, and keeping DOX concise and current.
$end_marker
EOF

if [ ! -d "$vault_path/.git" ]; then
  git -C "$vault_path" init -b main >/dev/null
fi

git -C "$vault_path" add README.md wiki/index.md .gitignore .obsidian/community-plugins.json .obsidian/core-plugins.json
if ! git -C "$vault_path" rev-parse --verify HEAD >/dev/null 2>&1; then
  git -C "$vault_path" commit -m "chore: initialize project memory vault" >/dev/null || true
fi

cat <<EOF
Team memory configured.

Project file updated: $agent_file
Obsidian vault:       $vault_path

Next manual step:
Open the vault in Obsidian, install the community plugins listed in
.obsidian/community-plugins.json, and enable them.
EOF
