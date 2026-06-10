#!/usr/bin/env python3
"""
Stop hook that prints lightweight next-step suggestions.

The hook is intentionally heuristic: it should never block a turn, and when it
cannot infer a project-specific action it still leaves a useful generic prompt.
"""
from __future__ import annotations

import json
import os
import subprocess
import sys
from pathlib import Path
from typing import Any


def run_git(cwd: Path, args: list[str]) -> str:
    try:
        result = subprocess.run(
            ["git", *args],
            cwd=str(cwd),
            capture_output=True,
            text=True,
            timeout=2,
            check=False,
        )
        if result.returncode == 0:
            return result.stdout.strip()
    except Exception:
        return ""
    return ""


def discover_cwd(payload: dict[str, Any]) -> Path:
    for key in ("cwd", "workspace", "project_dir", "project_path"):
        value = payload.get(key)
        if isinstance(value, str) and value:
            return Path(value).expanduser()
    return Path.cwd()


def read_recent_text(payload: dict[str, Any]) -> str:
    transcript = payload.get("transcript_path") or payload.get("conversation_path")
    if not isinstance(transcript, str) or not transcript:
        return ""

    path = Path(transcript).expanduser()
    if not path.is_file():
        return ""

    try:
        lines = path.read_text(encoding="utf-8", errors="ignore").splitlines()[-80:]
    except Exception:
        return ""

    snippets: list[str] = []
    for line in lines:
        try:
            item = json.loads(line)
        except Exception:
            continue
        message = item.get("message") or item
        content = message.get("content") if isinstance(message, dict) else None
        if isinstance(content, str):
            snippets.append(content)
        elif isinstance(content, list):
            for part in content:
                if isinstance(part, dict) and isinstance(part.get("text"), str):
                    snippets.append(part["text"])
    return "\n".join(snippets[-8:]).lower()


def project_suggestions(cwd: Path, recent_text: str) -> list[str]:
    suggestions: list[str] = []
    git_root = run_git(cwd, ["rev-parse", "--show-toplevel"])
    repo = Path(git_root) if git_root else cwd

    status = run_git(repo, ["status", "--short"]) if git_root else ""
    if status:
        suggestions.append("Relire le diff puis lancer le test ou dry-run le plus proche avant commit.")

    files = {path.name for path in repo.iterdir()} if repo.exists() and repo.is_dir() else set()
    if {"package.json", "pnpm-lock.yaml", "bun.lockb", "yarn.lock"} & files:
        suggestions.append("Verifier le flux frontend avec lint/test/build selon les scripts disponibles.")
    if {"pyproject.toml", "requirements.txt", "pytest.ini"} & files:
        suggestions.append("Lancer les tests Python cibles, puis formatter/linter si le depot en a.")
    if "install.sh" in files or "settings" in files:
        suggestions.append("Faire un dry-run d'installation pour valider la config globale avant application.")

    if "linear" in recent_text or "mcp" in recent_text:
        suggestions.append("Verifier l'etat MCP et relancer l'auth si un serveur distant apparait deconnecte.")
    if "todo" in recent_text or "backlog" in recent_text:
        suggestions.append("Transformer la decision en note ou ticket pour ne pas perdre le fil.")

    deduped: list[str] = []
    for item in suggestions:
        if item not in deduped:
            deduped.append(item)
    return deduped[:3]


def main() -> int:
    try:
        payload = json.load(sys.stdin)
    except Exception:
        payload = {}

    event = str(payload.get("hook_event_name") or payload.get("event") or "").lower()
    if event and event != "stop":
        return 0

    cwd = discover_cwd(payload)
    recent_text = read_recent_text(payload)
    suggestions = project_suggestions(cwd, recent_text)

    if not suggestions:
        suggestions = [
            "Demander un resume du dernier etat, continuer le chantier, ou convertir la suite en note/ticket."
        ]

    print("\nNext steps possibles:")
    for suggestion in suggestions:
        print(f"- {suggestion}")
    print("")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except Exception:
        os._exit(0)
