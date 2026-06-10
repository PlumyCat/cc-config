---
name: team-memory-setup
description: Configure a project with Obsidian memory, Linear story tracking, DOX contracts, and squad worker coordination.
---
# Team Memory Setup

Use this skill when a project should get the standard Obsidian + Linear + DOX + squad operating workflow.

## Command

```bash
/Users/ericfer/projects/cc-config/scripts/setup-team-memory.sh $ARGUMENTS
```

## What It Does

- Creates a dedicated Obsidian memory repository under `~/projects/memories/<vault-name>`.
- Adds baseline Obsidian plugin activation files for Local REST API, Git, Dataview, Templater, Calendar, and Thino.
- Creates a minimal memory structure for stories, decisions, sources, and logs.
- Injects an idempotent `Team Memory Workflow` block into the target project's `AGENTS.md`, falling back to `CLAUDE.md` when needed.
- Records that the assistant should use DOX before edits, Linear for story tracking, and `squad-*` skills for worker coordination.

## Linear Use

When the target story or Linear team is known, use the Linear connector to:

- create or update the story;
- link the repository and memory vault when useful;
- comment with progress, blockers, verification, and final outcome;
- keep durable implementation context in Obsidian instead of overloading Linear comments.

If the Linear team or story identifier is unknown, ask for it before creating or updating Linear issues.

## Obsidian Manual Step

After the script runs, open the created folder as an Obsidian vault. Install and enable the community plugins listed in `.obsidian/community-plugins.json`.

## Verification

```bash
test -d ~/projects/memories/<vault-name>/.git
grep -n "team-memory-config:start" <project-path>/AGENTS.md <project-path>/CLAUDE.md 2>/dev/null
```
