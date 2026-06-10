# Video Brief: Obsidian + Linear + DOX

## Goal

Create a short explanatory video showing how an AI coding assistant can act as a project lead by combining three habits:

- Obsidian as the project memory and knowledge vault.
- Linear as the source of stories, priorities, and delivery tracking.
- DOX as the local operating contract inside each repository.

The video must stay generic. Do not mention private repository names, personal paths, customer names, internal tickets, private scripts, or hidden implementation details.

## Audience

Developers, technical leads, and product-minded builders who already use AI coding assistants and want a repeatable way to keep context, tasks, and project rules synchronized.

## Core Idea

The workflow turns the assistant into a lightweight team lead:

1. It reads the repository contract before acting.
2. It checks the active Linear story and links work to the right issue.
3. It uses Obsidian to preserve durable project memory.
4. It delegates parallel work to squad workers when the task is too large for one thread.
5. It updates the local contract when a stable process or responsibility changes.

## Scene Outline

### 1. Start From A Story

Show Linear with a product story selected. The story contains the expected outcome, acceptance criteria, priority, and links to supporting notes.

Narration:
The work starts from a clearly scoped story. Linear keeps the delivery layer clean: what is being built, why it matters, who owns it, and what must be verified.

### 2. Open The Project Contract

Show an `AGENTS.md` or `CLAUDE.md` file in a repository. Highlight that it contains the working contract: project structure, local rules, verification steps, and child DOX indexes.

Narration:
Before editing code, the assistant reads the nearest DOX contract. DOX makes project rules explicit and local, so the assistant does not rely on memory or vague convention.

### 3. Connect The Memory Vault

Show an Obsidian vault with folders such as `wiki`, `stories`, `decisions`, `sources`, and `logs`.

Narration:
Obsidian stores durable project memory: decisions, recurring context, research notes, story summaries, and lessons learned. The vault is a separate repository so it can evolve without polluting the application codebase.

### 4. Plan Like A Team Lead

Show the assistant summarizing the Linear story, checking DOX, and writing a short plan that references the memory vault.

Narration:
The assistant now has three anchors: Linear for delivery, DOX for repository rules, and Obsidian for long-term memory. This reduces repeated explanations and makes handoffs cleaner.

### 5. Delegate With Squad Workers

Show several squad worker commands conceptually: status, ticket, spawn, capture, waiting, respond, done.

Narration:
For larger tasks, the assistant becomes a lead. It creates or updates a task, spawns workers for independent slices, captures their output, responds when they are blocked, and consolidates the result.

### 6. Close The Loop

Show the assistant updating the Linear story with progress, adding a short Obsidian note, and updating the DOX contract only when the rule is durable.

Narration:
At the end, the system closes the loop: Linear reflects the delivery state, Obsidian keeps the reusable context, and DOX records stable project behavior for future sessions.

## Visual Requirements

- Show Obsidian, Linear, and a repository editor clearly.
- Use neutral example names such as `example-app`, `Project Memory`, and `LIN-123`.
- Avoid private paths, organization names, customer names, real issue identifiers, and hidden configuration.
- Use a practical product-building tone, not a marketing pitch.
- Prefer concrete UI moments over abstract diagrams.

## Suggested Voiceover

This workflow connects product intent, project memory, and execution rules.

Linear holds the story: what needs to be delivered and how success is checked.

DOX lives inside the repository. It tells the assistant how this project works before any edit happens.

Obsidian is the long-term memory. It keeps decisions, research, story notes, and recurring context in a separate vault.

When the task grows, the assistant can act as a team lead. It breaks the story into slices, delegates work to squad workers, tracks blockers, captures outputs, and brings everything back into a single verified result.

The important part is the loop. Start from Linear, execute under DOX, preserve learning in Obsidian, and update the story when the work changes state.

## Output Instruction For NotebookLM

Generate a concise video explainer in French. Show a realistic workflow using Obsidian, Linear, DOX, and squad workers. Keep it generic and do not reveal any private implementation references.
