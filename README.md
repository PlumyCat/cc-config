# cc-config

Configuration personnelle de Claude Code pour un usage professionnel.

## Installation rapide

```bash
git clone <ce-repo> ~/cc-config
cd ~/cc-config
chmod +x install.sh
./install.sh
```

## Contenu

### Commands (6)
- `/create-mcp-server` - Créer un serveur MCP
- `/debug-mcp` - Déboguer un serveur MCP
- `/epct` - Explore Plan Code Test
- `/review-security` - Review de sécurité
- `/setup-fastapi` - Setup projet FastAPI
- `/setup-nextjs` - Setup projet Next.js

### Agents (4)
- `mcp-copilot-expert` - Expert MCP pour Copilot Studio
- `mcp-tester` - Testeur de serveurs MCP
- `python-expert` - Expert Python
- `typescript-expert` - Expert TypeScript

### Hooks
- `notifications.py` - Notifications desktop/SSH

### Scripts
- `statusline.sh` - Barre de statut personnalisée

## Mise à jour

```bash
cd ~/cc-config
git pull
./install.sh --backup
```

## License

Usage personnel
