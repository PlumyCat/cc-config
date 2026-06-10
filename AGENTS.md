# Configuration cc-config — Claude Code & Codex

Configuration personnelle partagée par **Claude Code** (`~/.claude`) et **Codex** (`~/.codex` + `~/.agents/skills`) pour un usage professionnel.
**Repo:** https://github.com/PlumyCat/cc-config

> Ce fichier `AGENTS.md` est la **source unique** d'instructions. `CLAUDE.md` est un symlink vers ce fichier : les deux outils lisent exactement le même contenu, aucune divergence possible.

## Structure du projet

```
cc-config/
├── settings/           # Configuration principale (settings.json, mcp-servers.json)
├── skills/             # Skills (déployées en scope user, sauf project-only)
├── .claude/skills/     # Skills project-only (cc-install, experimental, veille)
├── agents/             # Agents spécialisés (.md)
├── hooks/              # Scripts de hooks (notifications, next_steps, etc.)
├── scripts/            # Scripts utilitaires (install codex, mcp, veille, note…)
├── docs/               # Documentation personnelle
├── install.sh          # Installation Claude Code (+ options --codex, --mcp…)
└── AGENTS.md           # Ce fichier (CLAUDE.md = symlink)
```

## Skills

### Skills cc-config (déployées en scope user sur les deux outils)

| Skill | Description |
|-------|-------------|
| `agent-teams` | Reference Agent Teams (multi-agents paralleles natifs) |
| `apex` | Workflow Apex (Analyze-Plan-Execute-Validate) |
| `cleanup` | Diagnostic et nettoyage des processus bloqués |
| `command-setup-fastapi` | Setup projet FastAPI |
| `command-setup-nextjs` | Setup projet Next.js |
| `crm` | Gestion du temps et comptes rendus Dynamics 365 |
| `daily-crm-sync` | Workflow biquotidien GitHub → CRM Dynamics 365 |
| `epct` | Workflow Explore-Plan-Code-Test |
| `feature-new` | Nouvelle feature |
| `feature-resume` | Reprendre une feature |
| `grill-me` | Interview/stress-test d'un plan ou design |
| `next-step` | Propositions de prochaines actions en fin de tour |
| `note` | Ajout rapide de notes |
| `prompt-creator` | Création/amélioration de prompts |
| `pull` | Git pull avec gestion des conflits |
| `review-security` | Audit de sécurité |
| `team-memory-setup` | Configuration Obsidian + Linear + DOX pour un projet |

### Skills project-only (`.claude/skills/`, jamais en scope user)

| Skill | Description |
|-------|-------------|
| `cc-install` | Installation de la config (ne sert que dans ce repo) |
| `experimental` | Workflow de test des nouveautés |
| `veille` | Veille des nouveautés Claude Code / Codex |

### Skills globales (`~/.claude/skills/` ou `~/.agents/skills/`)

Disponibles dans tous les projets, hors gestion cc-config :
- context7, mermaid-diagrams, orchestration-prompts
- ralph-tui-create-json, ralph-tui-prd, typescript-expert, vercel-react-best-practices

## Serveurs MCP

`settings/mcp-servers.json` définit les serveurs partagés (mêmes serveurs côté Claude Code et Codex) :

| Serveur | Type | Détail |
|---------|------|--------|
| `time` | stdio | `uvx mcp-server-time` (timezone Europe/Paris) |
| `obsidian` | http | `http://127.0.0.1:27123/mcp/` (Bearer `OBSIDIAN_API_KEY`) |
| `linear` | http | `https://mcp.linear.app/mcp` |
| `bot-dataverse` | stdio | MCP Dynamics 365 / Dataverse |
| `playwright` | stdio | `npx @playwright/mcp` |
| `microsoft-learn` | http | `https://learn.microsoft.com/api/mcp` |

> `node_repl` reste spécifique à la plateforme Codex et n'est pas géré ici.

## Scripts disponibles

### `./install.sh` - Installation
```bash
./install.sh              # Installation standard (Claude Code)
./install.sh --backup     # Avec sauvegarde préalable
./install.sh --dry-run    # Simulation sans exécution
./install.sh --mcp        # Installe aussi la config MCP
./install.sh --codex      # Installe aussi la config Codex
./install.sh --codex-only # Installe uniquement Codex
./install.sh --full       # backup + shell + codex
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

### Tester une nouveauté
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
| Documentation libs | `mcp__context7__*` | WebSearch |

## Conventions

### Settings (settings.json)
- Permissions: format `"Tool pattern"` (ex: `"Git *"`)
- Hooks: organisés par événement (`Stop`, `Notification`)
- Mode par défaut: `acceptEdits`

### Skills (format répertoire)
- Un répertoire par skill dans `skills/`
- Chaque skill contient un fichier `SKILL.md` avec frontmatter YAML
- Frontmatter supporté: `name`, `description`, `disable-model-invocation`, `allowed-tools`, `context`, `agent`, `argument-hint`
- Fichiers de support optionnels (templates, scripts, exemples)
- Skills project-only : placées dans `.claude/skills/` (symlinks vers `skills/`), exclues du scope user par `install.sh` et `codex-install.py`

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
| `docs/agent-teams.md` | Guide Agent Teams (multi-agents paralleles) |
| `docs/apex.md` | Guide workflow Apex (Analyze-Plan-Execute-Validate) |
| `docs/bmad.md` | Référence des stories BMAD (le lien stories est géré par Linear désormais) |
| `docs/notebooklm-obsidian-linear-dox-video.md` | Source publique NotebookLM (vidéo Obsidian + Linear + DOX) |
| `docs/ralph.md` | Guide Ralph (orchestration autonome de taches) |

## Note projet

Ce dépôt sert à maintenir et suivre la configuration de Claude Code et Codex (skills, MCP, hooks, agents).
