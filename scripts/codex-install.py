#!/usr/bin/env python3
"""Install cc-config artifacts into the local Codex configuration."""

from __future__ import annotations

import argparse
import json
import os
import re
import shutil
import stat
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CODEX_HOME = Path.home() / ".codex"
AGENTS_HOME = Path.home() / ".agents"
PROJECT_ONLY_SKILLS = {"cc-install", "experimental", "veille"}
PROJECT_ONLY_COMMAND_SKILLS = {"veille-youtube"}


def log(message: str) -> None:
    print(f"[CODEX] {message}")


def parse_frontmatter(text: str) -> tuple[dict[str, str], str]:
    if not text.startswith("---\n"):
        return {}, text
    end = text.find("\n---\n", 4)
    if end == -1:
        return {}, text
    raw = text[4:end]
    body = text[end + 5 :]
    data: dict[str, str] = {}
    for line in raw.splitlines():
        if ":" not in line:
            continue
        key, value = line.split(":", 1)
        data[key.strip()] = value.strip().strip("\"'")
    return data, body


def slug(value: str) -> str:
    value = value.lower().strip()
    value = re.sub(r"[^a-z0-9_-]+", "-", value)
    return value.strip("-")


def toml_string(value: str) -> str:
    if "'''" not in value:
        return "'''" + value + "'''"
    return json.dumps(value, ensure_ascii=False)


def copy_file(src: Path, dst: Path, dry_run: bool) -> None:
    log(f"{src.relative_to(ROOT)} -> {dst}")
    if dry_run:
        return
    dst.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(src, dst)


def write_file(dst: Path, content: str, dry_run: bool) -> None:
    log(f"write {dst}")
    if dry_run:
        return
    dst.parent.mkdir(parents=True, exist_ok=True)
    dst.write_text(content, encoding="utf-8")


def sanitize_skill(src: Path) -> str:
    text = src.read_text(encoding="utf-8")
    meta, body = parse_frontmatter(text)
    name = meta.get("name", src.parent.name)
    description = meta.get("description", f"cc-config skill {name}")
    return f"---\nname: {name}\ndescription: {description}\n---\n{body.lstrip()}"


def install_skills(dry_run: bool) -> int:
    count = 0
    skills_dir = ROOT / "skills"
    for skill_md in sorted(skills_dir.glob("*/SKILL.md")):
        name = skill_md.parent.name
        if name in PROJECT_ONLY_SKILLS:
            log(f"skip project-only skill {name}")
            continue
        target_dir = AGENTS_HOME / "skills" / name
        write_file(target_dir / "SKILL.md", sanitize_skill(skill_md), dry_run)
        for child in skill_md.parent.iterdir():
            if child.name == "SKILL.md":
                continue
            if child.is_dir():
                dst = target_dir / child.name
                log(f"{child.relative_to(ROOT)} -> {dst}")
                if not dry_run:
                    if dst.exists():
                        shutil.rmtree(dst)
                    shutil.copytree(child, dst)
            elif child.is_file():
                copy_file(child, target_dir / child.name, dry_run)
        count += 1
    return count


def command_skill_name(command_file: Path) -> str:
    rel = command_file.relative_to(ROOT / "commands")
    parts = list(rel.with_suffix("").parts)
    return slug("command-" + "-".join(parts))


def install_command_skills(dry_run: bool) -> int:
    count = 0
    native_skill_names = {p.name for p in (ROOT / "skills").glob("*") if p.is_dir()}
    for command_file in sorted((ROOT / "commands").glob("**/*.md")):
        if command_file.relative_to(ROOT / "commands").parts[0] == "bmad":
            continue
        if command_file.stem in PROJECT_ONLY_COMMAND_SKILLS:
            log(f"skip project-only command skill {command_file.relative_to(ROOT)}")
            continue
        base_name = slug(command_file.stem)
        if base_name in native_skill_names and command_file.parent == ROOT / "commands":
            continue
        name = command_skill_name(command_file)
        body = command_file.read_text(encoding="utf-8").strip()
        content = (
            "---\n"
            f"name: {name}\n"
            f"description: Commande Claude migree vers Codex depuis {command_file.relative_to(ROOT)}.\n"
            "---\n\n"
            "Cette skill reprend une ancienne commande slash Claude Code. Adapte les references a Codex quand le texte source parle de Claude.\n\n"
            f"{body}\n"
        )
        write_file(AGENTS_HOME / "skills" / name / "SKILL.md", content, dry_run)
        count += 1
    return count


def install_agents(dry_run: bool) -> int:
    count = 0
    for agent_md in sorted((ROOT / "agents").glob("*.md")):
        text = agent_md.read_text(encoding="utf-8")
        meta, body = parse_frontmatter(text)
        name = slug(meta.get("name") or agent_md.stem)
        description = meta.get("description", f"cc-config agent {name}")
        tools = meta.get("tools")
        body = body.replace("Claude Code", "Codex").replace("claude mcp", "codex mcp")
        instructions = body.strip()
        if tools:
            instructions += (
                "\n\n## Tool Guidance\n"
                "The original Claude agent declared these tools as guidance, not as a Codex permission boundary:\n"
                f"{tools}\n"
            )
        content = (
            f'name = "{name}"\n'
            f"description = {json.dumps(description, ensure_ascii=False)}\n"
            "sandbox_mode = \"workspace-write\"\n"
            f"developer_instructions = {toml_string(instructions)}\n"
        )
        write_file(CODEX_HOME / "agents" / f"{name}.toml", content, dry_run)
        count += 1
    return count


def env_ref(value: str) -> str | None:
    match = re.fullmatch(r"\$\{([A-Za-z_][A-Za-z0-9_]*)\}", value)
    return match.group(1) if match else None


def expand_arg(value: str) -> str:
    value = value.replace("${HOME}", str(Path.home()))
    value = value.replace("~", str(Path.home()))
    value = value.replace(".claude/memory.json", ".codex/memory.json")
    return value


def mcp_server_toml(name: str, config: dict) -> str:
    lines = [f"[mcp_servers.{name}]"]
    if config.get("url"):
        lines.append(f"url = {json.dumps(config['url'])}")
    if config.get("command"):
        lines.append(f"command = {json.dumps(expand_arg(config['command']))}")
    args = [expand_arg(str(arg)) for arg in config.get("args", [])]
    if args:
        lines.append("args = " + json.dumps(args, ensure_ascii=False))

    env_vars: list[str] = []
    env_literals: dict[str, str] = {}
    for key, value in config.get("env", {}).items():
        if isinstance(value, str) and (ref := env_ref(value)):
            env_vars.append(ref)
            env_literals[key] = f"${{{ref}}}"
        else:
            env_literals[key] = str(value)
    if env_vars:
        lines.append("env_vars = " + json.dumps(sorted(set(env_vars))))
    if env_literals:
        lines.append("")
        lines.append(f"[mcp_servers.{name}.env]")
        for key, value in sorted(env_literals.items()):
            lines.append(f"{key} = {json.dumps(expand_arg(value))}")

    headers = config.get("headers", {})
    header_literals: dict[str, str] = {}
    for key, value in headers.items():
        if key.lower() == "authorization" and isinstance(value, str):
            match = re.fullmatch(r"Bearer \$\{([A-Za-z_][A-Za-z0-9_]*)\}", value)
            if match:
                lines.append(f"bearer_token_env_var = {json.dumps(match.group(1))}")
                continue
        header_literals[key] = str(value)
    if header_literals:
        lines.append("")
        lines.append(f"[mcp_servers.{name}.http_headers]")
        for key, value in sorted(header_literals.items()):
            lines.append(f"{key} = {json.dumps(value)}")
    return "\n".join(lines) + "\n"


def strip_mcp_sections(config_text: str, managed_names: set[str]) -> str:
    output: list[str] = []
    skipping = False
    section_re = re.compile(r"^\[([^\]]+)\]\s*$")
    for line in config_text.splitlines():
        if line.strip() == "# Managed by cc-config. Re-run ./install.sh --codex to update.":
            continue
        match = section_re.match(line)
        if match:
            section = match.group(1)
            skipping = any(
                section == f"mcp_servers.{name}" or section.startswith(f"mcp_servers.{name}.")
                for name in managed_names
            )
        if not skipping:
            output.append(line)
    return "\n".join(output).rstrip() + "\n"


def ensure_feature_flags(config_text: str, flags: dict[str, bool]) -> str:
    lines = config_text.rstrip().splitlines()
    start = next((i for i, line in enumerate(lines) if line.strip() == "[features]"), None)
    flag_lines = [f"{name} = {'true' if enabled else 'false'}" for name, enabled in flags.items()]

    if start is None:
        return "\n".join(lines).rstrip() + "\n\n[features]\n" + "\n".join(flag_lines) + "\n"

    end = len(lines)
    for i in range(start + 1, len(lines)):
        if re.match(r"^\s*\[", lines[i]):
            end = i
            break

    block = lines[start + 1 : end]
    seen: set[str] = set()
    updated: list[str] = []
    for line in block:
        matched = re.match(r"^(\s*)([A-Za-z_][A-Za-z0-9_]*)(\s*=).*$", line)
        if matched and matched.group(2) in flags:
            name = matched.group(2)
            seen.add(name)
            updated.append(f"{matched.group(1)}{name}{matched.group(3)} {'true' if flags[name] else 'false'}")
        else:
            updated.append(line)
    for name, enabled in flags.items():
        if name not in seen:
            updated.append(f"{name} = {'true' if enabled else 'false'}")

    return "\n".join(lines[: start + 1] + updated + lines[end:]).rstrip() + "\n"


def install_mcp_config(dry_run: bool) -> int:
    source = ROOT / "settings" / "mcp-servers.json"
    servers = json.loads(source.read_text(encoding="utf-8"))
    retired_managed_names = {
        "ai-elements",
        "memory",
        "ms-learn",
        "sequential-thinking",
        "serena",
        "shadcn",
        "streamable-mcp-server",
        "time-paris",
    }
    managed_names = set(servers) | retired_managed_names
    blocks = ["# Managed by cc-config. Re-run ./install.sh --codex to update.\n"]
    for name, config in sorted(servers.items()):
        blocks.append(mcp_server_toml(slug(name), config))
    managed = "\n".join(blocks).rstrip() + "\n"

    target = CODEX_HOME / "config.toml"
    current = target.read_text(encoding="utf-8") if target.exists() else ""
    merged = strip_mcp_sections(current, {slug(name) for name in managed_names})
    merged = ensure_feature_flags(merged, {"rmcp_client": True})
    merged = merged.rstrip() + "\n\n" + managed
    write_file(target, merged, dry_run)
    return len(servers)


def install_hooks(dry_run: bool) -> int:
    hooks_dir = CODEX_HOME / "hooks"
    for src in sorted((ROOT / "hooks").glob("*")):
        if src.is_file():
            copy_file(src, hooks_dir / src.name, dry_run)
            if not dry_run:
                mode = (hooks_dir / src.name).stat().st_mode
                (hooks_dir / src.name).chmod(mode | stat.S_IXUSR)

    target = CODEX_HOME / "hooks.json"
    data = {"hooks": {}}
    if target.exists():
        data = json.loads(target.read_text(encoding="utf-8"))
    stop_hooks = data.setdefault("hooks", {}).setdefault("Stop", [])
    commands = [
        str(CODEX_HOME / "hooks" / "notifications.py"),
        str(CODEX_HOME / "hooks" / "next_steps.py"),
    ]
    for entry in stop_hooks:
        entry["hooks"] = [
            hook
            for hook in entry.get("hooks", [])
            if hook.get("command", "").strip("'\"") not in commands
        ]
    stop_hooks[:] = [entry for entry in stop_hooks if entry.get("hooks")]
    for command in reversed(commands):
        stop_hooks.insert(0, {"hooks": [{"type": "command", "command": command}]})
    write_file(target, json.dumps(data, ensure_ascii=False, indent=2) + "\n", dry_run)
    return 1


def install_agents_md(dry_run: bool) -> int:
    copy_file(ROOT / "AGENTS.md", CODEX_HOME / "AGENTS.md", dry_run)
    return 1


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--dry-run", action="store_true")
    parser.add_argument("--skip-mcp", action="store_true")
    args = parser.parse_args()

    CODEX_HOME.mkdir(parents=True, exist_ok=True)
    AGENTS_HOME.mkdir(parents=True, exist_ok=True)
    counts = {
        "AGENTS.md": install_agents_md(args.dry_run),
        "skills": install_skills(args.dry_run),
        "command-skills": install_command_skills(args.dry_run),
        "agents": install_agents(args.dry_run),
        "hooks": install_hooks(args.dry_run),
    }
    if not args.skip_mcp:
        counts["mcp"] = install_mcp_config(args.dry_run)

    log("summary: " + ", ".join(f"{key}={value}" for key, value in counts.items()))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
