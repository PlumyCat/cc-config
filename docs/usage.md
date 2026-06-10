# Guide d'utilisation personnel

## Mes skills Codex

### `epct` - Explore Plan Code Test
Mon workflow principal pour les nouvelles features.
```
Utilise la skill epct avec la description de la feature.
```

### `review-security` - Review sécurité
Avant de merger du code sensible.

### `mcbs-*` - Orchestration multi-Codex
Pour déléguer en parallèle à des workers via le projet `agent-squad`, tmux et les tickets.
```
Utilise mcbs-status pour voir les workers.
Utilise mcbs-spawn pour déléguer une tâche.
```

### `command-setup-fastapi` / `command-setup-nextjs`
Scaffolding de nouveaux projets.

---

## Mes agents

| Agent | Quand l'utiliser |
|-------|------------------|
| `python-expert` | Code Python complexe, architecture |
| `typescript-expert` | Frontend, Node.js |
| `mcp-copilot-expert` | Serveurs MCP pour Copilot Studio |
| `mcp-tester` | Valider un serveur MCP |

---

## Workflows quotidiens

### Apprendre avec Obsidian + Codex + NotebookLM
Voir `docs/apprentissage-obsidian-codex-notebooklm.md` pour le parcours complet : routines, prompts, revision NotebookLM et plan 30 jours.

### Debug rapide
1. Décrire le problème
2. Laisser Codex explorer
3. Valider la solution proposée

### Nouvelle feature
1. `/epct` pour planifier
2. Implémenter étape par étape
3. Review avec `/review-security` si sensible

### Tester une nouveauté Codex
1. `./scripts/experimental.sh start <nom>`
2. Tester la nouveauté
3. `./scripts/experimental.sh validate` ou `rollback`

### Réinstaller la config Codex
```bash
cd ~/cc-config
./install.sh --codex-only
```

---

## Mes préférences

- **Mode par défaut Codex**: config globale dans `~/.codex/config.toml`
- **Notifications**: Desktop + SSH fallback
- **Source de vérité**: ce dépôt, puis `./install.sh --codex-only`

---

## Notes diverses

<!-- Ajoute ici ce que tu veux retenir -->
