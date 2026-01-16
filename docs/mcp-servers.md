# MCP Servers - Configuration

Documentation des serveurs MCP (Model Context Protocol) configurés.

---

## Serveurs actifs

| Serveur | Type | Usage |
|---------|------|-------|
| playwright | stdio | Automatisation navigateur |
| github | stdio | Intégration GitHub API |
| sequential-thinking | stdio | Raisonnement structuré |
| time | stdio | Gestion du temps |
| memory | stdio | Mémoire persistante |
| serena | stdio | Analyse code sémantique |
| ms-learn | http | Documentation Microsoft |
| shadcn | stdio | Composants UI shadcn |
| streamable-mcp-server | http | Chrome automation |
| ai-elements | stdio | AI SDK registry |

---

## Détails par serveur

### playwright
**Automatisation navigateur web**
```json
{
  "type": "stdio",
  "command": "npx",
  "args": ["-y", "@playwright/mcp@latest"]
}
```
- **Usage**: Tests E2E, scraping, automatisation web
- **Prérequis**: Node.js, npx

### github
**Intégration GitHub API**
```json
{
  "type": "stdio",
  "command": "docker",
  "args": ["run", "-i", "--rm", "-e", "GITHUB_PERSONAL_ACCESS_TOKEN", "ghcr.io/github/github-mcp-server"]
}
```
- **Usage**: Issues, PRs, repos, actions
- **Prérequis**: Docker, `GITHUB_TOKEN` dans l'environnement
- **Secrets**: Nécessite `mcp-secrets.env` avec `GITHUB_TOKEN`

### sequential-thinking
**Raisonnement structuré étape par étape**
```json
{
  "type": "stdio",
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-sequential-thinking"]
}
```
- **Usage**: Problèmes complexes, analyse multi-étapes
- **Prérequis**: Node.js, npx

### time
**Gestion du temps et fuseaux horaires**
```json
{
  "type": "stdio",
  "command": "uvx",
  "args": ["mcp-server-time"]
}
```
- **Usage**: Heure actuelle, conversions de timezone
- **Prérequis**: Python, uv/uvx

### memory
**Mémoire persistante entre sessions**
```json
{
  "type": "stdio",
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-memory", "--env", "MEMORY_FILE_PATH=${HOME}/.claude/memory.json"]
}
```
- **Usage**: Stocker/rappeler des informations entre conversations
- **Stockage**: `~/.claude/memory.json`
- **Prérequis**: Node.js, npx

### serena
**Analyse sémantique de code**
```json
{
  "type": "stdio",
  "command": "uv",
  "args": ["--directory", "${HOME}/serena", "run", "serena-mcp-server"]
}
```
- **Usage**: Navigation code, refactoring, analyse AST
- **Prérequis**: Python, uv, repo serena cloné dans `~/serena`
- **Installation**: `git clone https://github.com/lspinheiro/serena ~/serena`

### ms-learn
**Documentation Microsoft Learn**
```json
{
  "type": "http",
  "url": "https://learn.microsoft.com/api/mcp",
  "headers": {"Authorization": "Bearer ${GITHUB_TOKEN}"}
}
```
- **Usage**: Recherche docs Azure/Microsoft
- **Prérequis**: `GITHUB_TOKEN` pour l'authentification

### shadcn
**Composants UI shadcn/ui**
```json
{
  "type": "stdio",
  "command": "npx",
  "args": ["shadcn@latest", "mcp"]
}
```
- **Usage**: Installation composants shadcn, recherche
- **Prérequis**: Node.js, npx

### streamable-mcp-server (Chrome)
**Automatisation Chrome en direct**
```json
{
  "type": "http",
  "url": "http://127.0.0.1:12306/mcp"
}
```
- **Usage**: Contrôle Chrome, captures d'écran, navigation
- **Prérequis**: Extension Chrome Claude installée et active
- **Note**: Serveur local démarré par l'extension

### ai-elements
**AI SDK Registry**
```json
{
  "command": "npx",
  "args": ["-y", "mcp-remote", "https://registry.ai-sdk.dev/api/mcp"]
}
```
- **Usage**: Accès au registre Vercel AI SDK
- **Prérequis**: Node.js, npx

---

## Configuration

### Fichier principal
`settings/mcp-servers.json` - Configuration complète des serveurs

### Secrets
`mcp-secrets.env` - Variables d'environnement sensibles (non versionné)
```bash
# Exemple de contenu
GITHUB_TOKEN=ghp_xxxx
```

### Installation
```bash
# Installer la config MCP
./install.sh --mcp

# Nécessite mcp-secrets.env à la racine du projet
```

---

## Ajout d'un nouveau serveur

1. Éditer `settings/mcp-servers.json`
2. Ajouter la configuration du serveur
3. Documenter dans ce fichier
4. `./install.sh` pour appliquer

### Format de configuration

**Serveur stdio (commande locale)**
```json
{
  "nom-serveur": {
    "type": "stdio",
    "command": "commande",
    "args": ["arg1", "arg2"],
    "env": {}
  }
}
```

**Serveur HTTP (distant)**
```json
{
  "nom-serveur": {
    "type": "http",
    "url": "https://example.com/mcp",
    "headers": {}
  }
}
```

---

## Dépannage

### Serveur ne répond pas
```bash
# Utiliser la commande de debug
/debug-mcp
```

### Vérifier la configuration
```bash
# Voir la config MCP installée
cat ~/.claude/settings.json | jq '.mcpServers'
```

### Logs
Les erreurs MCP apparaissent dans la console Claude Code.

---

*Dernière mise à jour: 2025-01-16*
