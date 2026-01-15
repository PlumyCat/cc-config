# Guide d'utilisation personnel

## Mes commandes slash

### `/epct` - Explore Plan Code Test
Mon workflow principal pour les nouvelles features.
```
/epct <description de la feature>
```

### `/debug-mcp` - Déboguer MCP
Quand un serveur MCP ne répond pas ou a des erreurs.

### `/create-mcp-server` - Nouveau serveur MCP
Template pour créer un nouveau serveur MCP rapidement.

### `/review-security` - Review sécurité
Avant de merger du code sensible.

### `/setup-fastapi` / `/setup-nextjs`
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

### Debug rapide
1. Décrire le problème
2. Laisser Claude explorer
3. Valider la solution proposée

### Nouvelle feature
1. `/epct` pour planifier
2. Implémenter étape par étape
3. Review avec `/review-security` si sensible

### Tester une nouveauté Claude Code
1. `./scripts/experimental.sh start <nom>`
2. Tester la nouveauté
3. `./scripts/experimental.sh validate` ou `rollback`

---

## Mes préférences

- **Mode par défaut**: `acceptEdits` (éditions auto-acceptées)
- **Notifications**: Desktop + SSH fallback
- **Statusline**: Barre de progression du contexte

---

## Notes diverses

<!-- Ajoute ici ce que tu veux retenir -->


