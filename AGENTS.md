# Codex Configuration - cc-config

Configuration personnelle de Codex pour un usage professionnel.
**Repo:** https://github.com/PlumyCat/cc-config

## Structure du projet

```
cc-config/
├── settings/           # Configuration principale (settings.json)
├── skills/             # Skills locales à ce projet
├── agents/             # Agents spécialisés (.md)
├── hooks/              # Scripts de hooks (notifications, etc.)
├── scripts/            # Scripts utilitaires
├── docs/               # Documentation personnelle
├── experimental/       # Tests en cours (branche exp/*)
├── install.sh          # Script d'installation
└── AGENTS.md           # Ce fichier
```

## Skills

### Skills locales (ce projet)

| Skill | Description |
|-------|-------------|
| `agent-teams` | Reference Agent Teams (multi-agents paralleles natifs) |
| `apex` | Workflow Apex |
| `cc-install` | Installation de la config Codex |
| `cleanup` | Diagnostic et nettoyage des processus Codex bloqués |
| `create-mcp-server` | Création de serveurs MCP |
| `crm` | Gestion du temps et comptes rendus Dynamics 365 |
| `epct` | Workflow Explore-Plan-Code-Test |
| `experimental` | Workflow de test des nouveautés |
| `feature-new` | Nouvelle feature |
| `feature-resume` | Reprendre une feature |
| `next-step` | Propositions de prochaines actions en fin de tour |
| `note` | Ajout rapide de notes |
| `pull` | Git pull avec gestion des conflits |
| `review-security` | Audit de sécurité |
| `setup-fastapi` | Setup projet FastAPI |
| `setup-nextjs` | Setup projet Next.js |
| `veille` | Veille des nouveautés Codex |

### Skills globales (~/.Codex/skills/)

Les skills globales sont stockées dans `~/.Codex/skills/` et disponibles dans tous les projets :
- Codex-md-improver, context7, crm, docker-expert, mermaid-diagrams
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

### Tester une nouveauté Codex
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
| `docs/agent-teams.md` | Guide Agent Teams (multi-agents paralleles) |
| `docs/apex.md` | Guide workflow Apex (Analyze-Plan-Execute-Validate) |
| `docs/bmad.md` | Guide BMAD Method v6 (methodologie agile IA) |
| `docs/ralph.md` | Guide Ralph (orchestration autonome de taches) |

## Imported Claude Cowork project instructions

Ceci est le projet pour m'aider a MAJ et suivre la config Claude code

## Cadre DOX

- DOX est une hierarchie performante de fichiers `AGENTS.md`.
- L'agent doit suivre les consignes DOX pour toute modification.

### Contrat principal

- Les fichiers `AGENTS.md` sont des contrats de travail obligatoires pour leur sous-arborescence.
- Les livrables, sources, consignes, traces, assets et documentations durables doivent rester compréhensibles à partir du fichier `AGENTS.md` applicable le plus proche et de tous les fichiers `AGENTS.md` parents.

### Lire avant de modifier

1. Lire le `AGENTS.md` racine.
2. Identifier chaque fichier ou dossier susceptible d'être modifié.
3. Parcourir le chemin depuis la racine du dépôt jusqu'à chaque cible.
4. Lire chaque `AGENTS.md` trouvé sur ce chemin.
5. Si un `AGENTS.md` parent liste un `AGENTS.md` enfant dont le périmètre contient la cible, lire cet enfant et continuer depuis celui-ci.
6. Utiliser le `AGENTS.md` le plus proche comme contrat local, et les documents parents pour les règles globales du dépôt.
7. En cas de conflit, le document le plus proche contrôle les détails locaux, mais aucun document enfant ne peut affaiblir DOX.

Ne pas se fier à la mémoire. Relire la chaîne DOX applicable dans la session courante avant toute modification.

### Mettre à jour après modification

Toute modification significative nécessite une passe DOX avant de terminer la tâche.

Mettre à jour le `AGENTS.md` propriétaire le plus proche lorsqu'une modification affecte :

- l'objectif, le périmètre, la propriété ou les responsabilités ;
- la structure durable, les contrats, les workflows ou les règles de fonctionnement ;
- les entrées, sorties, permissions, contraintes, effets de bord ou artefacts requis ;
- les préférences utilisateur sur le comportement, la communication, le processus, l'organisation ou la qualité ;
- la création, suppression, déplacement, renommage ou indexation de fichiers `AGENTS.md`.

Mettre à jour les documents parents lorsque la structure, la propriété, le workflow ou l'index enfant de niveau parent change. Mettre à jour les documents enfants lorsque des changements parents modifient les règles locales. Supprimer immédiatement les textes obsolètes ou contradictoires. Les petites modifications qui ne changent ni comportement ni contrat peuvent laisser les documents inchangés, mais la passe DOX reste obligatoire.

### Hiérarchie

- Le `AGENTS.md` racine est le rail DOX : consignes globales du projet, préférences générales, règles de workflow durables et index principal des DOX enfants.
- Les fichiers `AGENTS.md` enfants portent les consignes spécifiques à leur domaine et leur propre index des DOX enfants.
- Chaque parent explique ce que couvrent ses enfants directs et ce qui reste sous sa responsabilité.
- Plus un document est proche du travail, plus il doit être spécifique et pratique.

### Forme des documents enfants

- Créer un `AGENTS.md` enfant lorsqu'un dossier devient une frontière durable avec son propre objectif, ses règles, responsabilités, workflows, matériaux ou standards qualité.
- La section `Work Guidance` doit refléter les standards actuels du projet ou les consignes utilisateur ; s'il n'y a pas encore de standards spécifiques, la laisser vide.
- La section `Verification` doit refléter une vérification existante ; s'il n'y a pas encore de cadre de vérification, la laisser vide et la mettre à jour lorsqu'il existe.

Ordre de sections par défaut :

- `Purpose`
- `Ownership`
- `Local Contracts`
- `Work Guidance`
- `Verification`
- `Child DOX Index`

### Style

- Garder les documents concis, à jour et opérationnels.
- Documenter les contrats stables, pas les entrées de journal.
- Placer les règles larges dans les documents parents et les détails concrets dans les documents enfants.
- Préférer des puces directes avec des noms explicites.
- Ne pas dupliquer les règles dans de nombreux fichiers sauf si chaque périmètre a besoin d'une version locale.
- Supprimer les notes obsolètes au lieu d'expliquer l'historique.
- Réduire les évidences, règles répétées, détails mal placés et avertissements sur des risques qui n'existent plus.

### Clôture

1. Revérifier les chemins modifiés par rapport à la chaîne DOX.
2. Mettre à jour les documents propriétaires les plus proches et les éventuels parents ou enfants affectés.
3. Rafraîchir chaque `Child DOX Index` affecté.
4. Supprimer les textes obsolètes ou contradictoires.
5. Lancer les vérifications existantes lorsque c'est pertinent.
6. Signaler les documents volontairement laissés inchangés et pourquoi.

### Préférences utilisateur

Lorsqu'une demande utilisateur correspond à un changement durable de comportement, l'enregistrer ici ou dans le `AGENTS.md` enfant pertinent.

### Child DOX Index

Ce projet n'est pas encore indexé. Avant de continuer, scanner le projet, construire l'arbre DOX et remplacer ce message par l'index réel. Aller en profondeur et scanner les fichiers récursivement afin d'évaluer correctement la complexité et de créer des fichiers `AGENTS.md` imbriqués lorsque c'est nécessaire.
