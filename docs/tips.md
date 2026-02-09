# Tips & Astuces

Notes personnelles pour ne pas oublier les trucs utiles.

---

## Raccourcis clavier

| Raccourci | Action |
|-----------|--------|
| `Ctrl+C` | Interrompre Claude |
| `Escape` (x2) | Annuler l'entrée en cours |
| `Tab` | Autocomplétion |

## Commandes utiles

```bash
# Voir l'historique des conversations
claude --history

# Reprendre une conversation
claude --resume

# Mode REPL sans contexte
claude --no-context
```

## Prompts efficaces

```
# Pour du debug rapide
"Trouve le bug, corrige-le, explique en 2 lignes"

# Pour explorer du code
"Explique l'architecture de ce module en bullet points"
```

---

## À retenir

<!-- Ajoute ici les trucs que tu oublies souvent -->



---

## Pièges à éviter

<!-- Erreurs déjà faites à ne pas répéter -->



---

- Pour la veille YouTube: cd ~/projects/youtube-veille && npm run dev

*Dernière mise à jour: $(date +%Y-%m-%d)*
## Chrome DevTools MCP - Debug

**Problème:** Le MCP chrome-devtools ne se connecte pas à Chrome

**Cause:** Chrome doit être lancé avec `--remote-debugging-port=9222`

**Solution permanente appliquée:**
- Launcher modifié: `~/.local/share/applications/google-chrome.desktop`
- Ajoute automatiquement `--remote-debugging-port=9222`

**Si ça ne marche pas:**
1. `pkill -9 chrome`
2. Relancer Chrome depuis le menu/dock (PAS en ligne de commande)
3. Vérifier: `curl -s http://localhost:9222/json/version`

**Date:** 2026-01-26

---

## MCP chrome-devtools - Config HEADLESS (IMPORTANT)

**Problème:** Erreur "Missing X server to start the headful browser"

**Solution:** Ajouter `HEADLESS=true` dans la config MCP :

```json
// Dans ~/.claude.json > mcpServers > chrome-devtools
"env": {
  "HEADLESS": "true"
}
```

**Commande pour fix rapide:**
```bash
cat ~/.claude.json | jq '.mcpServers["chrome-devtools"].env = {"HEADLESS": "true"}' > /tmp/claude.json.tmp && mv /tmp/claude.json.tmp ~/.claude.json
```

**Après modif:** Relancer Claude Code (`/quit` puis `claude`)

**Date:** 2026-01-26
