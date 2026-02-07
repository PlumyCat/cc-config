# Claude Code Configuration - cc-config

Configuration personnelle de Claude Code pour un usage professionnel.
**Repo:** https://github.com/PlumyCat/cc-config

## Structure du projet

```
cc-config/
├── settings/           # Configuration principale (settings.json)
├── skills/             # Skills locales à ce projet
├── agents/             # Agents spécialisés (.md)
├── hooks/              # Scripts de hooks (notifications, etc.)
├── scripts/            # Scripts utilitaires
├── mcp/                # MCP servers custom (locaux au projet)
│   └── youtube-transcript/  # Extraction transcriptions YouTube
├── docs/               # Documentation personnelle
├── experimental/       # Tests en cours (branche exp/*)
├── install.sh          # Script d'installation
└── CLAUDE.md           # Ce fichier
```

## Skills

### Skills locales (ce projet)

| Skill | Description |
|-------|-------------|
| `agent-teams` | Reference Agent Teams (multi-agents paralleles natifs) |
| `apex` | Workflow Apex |
| `cc-install` | Installation de la config Claude Code |
| `cleanup` | Diagnostic et nettoyage des processus Claude bloqués |
| `create-mcp-server` | Création de serveurs MCP |
| `debug-mcp` | Debug de serveurs MCP |
| `epct` | Workflow Explore-Plan-Code-Test |
| `experimental` | Workflow de test des nouveautés |
| `feature-new` | Nouvelle feature |
| `feature-resume` | Reprendre une feature |
| `note` | Ajout rapide de notes |
| `pull` | Git pull avec gestion des conflits |
| `review-security` | Audit de sécurité |
| `setup-fastapi` | Setup projet FastAPI |
| `setup-nextjs` | Setup projet Next.js |
| `skill-creator` | Création de nouvelles skills |
| `veille` | Veille des nouveautés Claude Code |

### Skills globales (~/.claude/skills/)

Les skills globales sont stockées dans `~/.claude/skills/` et disponibles dans tous les projets :
- claude-md-improver, context7, docker-expert, mermaid-diagrams
- orchestration-prompts, python-pro, python-testing-patterns
- ralph-tui-create-json, ralph-tui-prd, senior-architect
- typescript-expert, vercel-react-best-practices

## Scripts disponibles

### `./install.sh` - Installation
```bash
./install.sh              # Installation standard
./install.sh --backup     # Avec sauvegarde préalable
./install.sh --dry-run    # Simulation sans exécution
```

### `./scripts/experimental.sh` - Workflow de test
```bash
./scripts/experimental.sh start <nom>   # Démarrer un test
./scripts/experimental.sh status        # Voir le statut
./scripts/experimental.sh validate      # Valider et merger
./scripts/experimental.sh rollback      # Annuler le test
./scripts/experimental.sh list          # Historique
```

### `./scripts/veille.sh` - Veille
```bash
./scripts/veille.sh           # Résumé rapide
./scripts/veille.sh open      # Ouvrir les sources
./scripts/veille.sh version   # Versions actuelles
```

### `./scripts/note.sh` - Notes rapides
```bash
./scripts/note.sh tip "message"        # Ajouter un tip
./scripts/note.sh todo "message"       # Ajouter au backlog
./scripts/note.sh veille "message"     # Note de veille
./scripts/note.sh changelog "message"  # Entrée changelog
```

## Workflows

### Tester une nouveauté Claude Code
1. `./scripts/veille.sh` pour voir les nouveautés
2. `./scripts/experimental.sh start feature-name`
3. Modifier la config dans ce dépôt
4. `./install.sh` pour appliquer
5. Tester sur un projet non-critique
6. `./scripts/experimental.sh validate` ou `rollback`

### Mise à jour de la config
1. Modifier les fichiers dans ce dépôt
2. `./install.sh --dry-run` pour vérifier
3. `./install.sh --backup` pour appliquer
4. `git add -A && git commit && git push`

### Ajouter une note rapidement
```bash
./scripts/note.sh tip "Ne pas oublier --resume"
./scripts/note.sh todo "Tester le nouveau hook"
```

## Préférences d'outils

| Tâche | Outil préféré | Au lieu de |
|-------|---------------|------------|
| Recherche web | `mcp__exa__web_search_exa` | WebSearch natif |
| Recherche code | `mcp__exa__get_code_context_exa` | WebSearch |
| Transcriptions YouTube | `mcp__youtube-transcript__*` | - |
| Documentation libs | `mcp__context7__*` | WebSearch |

## Conventions

### Settings (settings.json)
- Permissions: format `"Tool pattern"` (ex: `"Git *"`)
- Hooks: organisés par événement (`Stop`, `Notification`)
- Mode par défaut: `acceptEdits`

### Skills (nouveau format)
- Un répertoire par skill dans `skills/`
- Chaque skill contient un fichier `SKILL.md` avec frontmatter YAML
- Frontmatter supporté: `name`, `description`, `disable-model-invocation`, `allowed-tools`, `context`, `agent`, `argument-hint`
- Fichiers de support optionnels (templates, scripts, exemples)

### Agents
- Un fichier `.md` par agent dans `agents/`
- Définir le rôle, outils, et exemples d'utilisation

## Documentation

| Fichier | Usage |
|---------|-------|
| `docs/tips.md` | Trucs à ne pas oublier |
| `docs/usage.md` | Guide personnel |
| `docs/changelog.md` | Historique des modifs |
| `docs/backlog.md` | Idées à tester |
| `docs/veille.md` | Suivi des nouveautés |
