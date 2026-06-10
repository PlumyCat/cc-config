# cc-config

Configuration personnelle Codex / Claude Code pour un usage professionnel.
Le dépôt sert de source de vérité pour modifier, nettoyer et réinstaller la config locale.

## Installation rapide

```bash
git clone https://github.com/PlumyCat/cc-config.git ~/cc-config
cd ~/cc-config
./install.sh
```

Pour installer uniquement la config Codex :

```bash
./install.sh --codex-only
```

## Contenu

### Skills et commandes

- `skills/*/SKILL.md` est installé vers `~/.agents/skills/`, sauf les skills liées uniquement à ce projet.
- `commands/**/*.md` est converti en skills Codex `command-*`, sauf les commandes liées uniquement à ce projet.
- Les commandes déjà couvertes par une skill native ne sont pas dupliquées.
- Les skills `cc-install`, `experimental`, `veille` et la commande `veille-youtube` restent project-only.

### Agents (4)
| Agent | Description |
|-------|-------------|
| `mcp-copilot-expert` | Expert MCP pour Copilot Studio |
| `mcp-tester` | Testeur de serveurs MCP |
| `python-expert` | Expert Python |
| `typescript-expert` | Expert TypeScript |

## Scripts utilitaires

```bash
# Installation
./install.sh [--backup] [--dry-run]
./install.sh --codex-only [--dry-run]

# Tester une nouveauté
./scripts/experimental.sh start <nom>
./scripts/experimental.sh validate|rollback

# Veille des nouveautés
./scripts/veille.sh [open|version]

# Notes rapides
./scripts/note.sh tip|todo|veille|changelog "message"
```

## Documentation personnelle

- `docs/tips.md` - Trucs et astuces
- `docs/usage.md` - Guide d'utilisation
- `docs/changelog.md` - Historique des modifs
- `docs/backlog.md` - Idées à tester
- `docs/veille.md` - Suivi des nouveautés

## Hooks globaux

- `hooks/next_steps.py` - propose des axes de reprise en fin de tour.

## Mise à jour

```bash
cd ~/cc-config
git pull
./install.sh --codex-only
```

## License

Usage personnel
