# MCP chrome-devtools - Configuration

## Problème
Erreur: "Missing X server to start the headful browser"

## Solution
Ajouter `--headless=true` dans les **args** (PAS dans env) :

```json
// ~/.claude.json
"mcpServers": {
  "chrome-devtools": {
    "type": "stdio",
    "command": "npx",
    "args": [
      "chrome-devtools-mcp@latest",
      "--headless=true"
    ]
  }
}
```

## Fix rapide
```bash
cat ~/.claude.json | jq '.mcpServers["chrome-devtools"].args = ["chrome-devtools-mcp@latest", "--headless=true"]' > /tmp/claude.json.tmp && mv /tmp/claude.json.tmp ~/.claude.json
```

## Après modif
Relancer Claude Code (`/quit` puis `claude`)

## Source
https://github.com/ChromeDevTools/chrome-devtools-mcp

---
*Dernière mise à jour: 2026-01-26*
