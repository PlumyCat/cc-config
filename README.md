# cc-config

Configuration personnelle de Claude Code pour un usage professionnel.

## Installation rapide

```bash
git clone https://github.com/PlumyCat/cc-config.git ~/cc-config
cd ~/cc-config
./install.sh
```

## Contenu

### Commands (6)
| Commande | Description |
|----------|-------------|
| `/create-mcp-server` | Créer un serveur MCP |
| `/debug-mcp` | Déboguer un serveur MCP |
| `/epct` | Explore Plan Code Test |
| `/review-security` | Review de sécurité |
| `/setup-fastapi` | Setup projet FastAPI |
| `/setup-nextjs` | Setup projet Next.js |

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

## Mise à jour

```bash
cd ~/cc-config
git pull
./install.sh --backup
```

## License

Usage personnel
