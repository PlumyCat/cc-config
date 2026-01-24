---
name: cc-install
description: Installation de la configuration Claude Code depuis cc-config vers ~/.claude
disable-model-invocation: true
argument-hint: "[--backup] [--dry-run] [--mcp]"
allowed-tools: Bash
---

# Installation de la config Claude Code

Installe la configuration depuis le dépôt cc-config vers ~/.claude.

## Commandes

### Installation standard
```bash
~/cc-config/install.sh
```

### Avec backup préalable
```bash
~/cc-config/install.sh --backup
```

### Simulation (dry-run)
```bash
~/cc-config/install.sh --dry-run
```

### Avec config MCP
```bash
~/cc-config/install.sh --mcp
```

### Toutes les options
```bash
~/cc-config/install.sh --backup --mcp
```

## Ce qui est installé

- `settings.json` → `~/.claude/settings.json`
- `skills/*/SKILL.md` → `~/.claude/skills/`
- `agents/*.md` → `~/.claude/agents/`
- `hooks/*` → `~/.claude/hooks/`

## Après installation

Affiche le résumé et rappelle de redémarrer Claude Code si nécessaire pour appliquer les changements.
