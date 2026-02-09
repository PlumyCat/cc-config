# /cc-install - Installation de la config Claude Code

Installe la configuration depuis le dépôt cc-config vers ~/.claude.

## Instructions

Exécute le script d'installation avec les options appropriées :

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
- `commands/*.md` → `~/.claude/commands/`
- `agents/*.md` → `~/.claude/agents/`
- `hooks/*` → `~/.claude/hooks/`

## Après installation

Affiche le résumé et rappelle de redémarrer Claude Code si nécessaire pour appliquer les changements.
