# Architecture Document: cc-config

**Date:** 2025-01-16
**Author:** Eric
**Version:** 1.0
**Project Type:** Library / Configuration personnelle
**Project Level:** 2 (Medium)
**Status:** Draft

---

## Document Overview

This Architecture Document defines the technical design for cc-config, a personal Claude Code configuration management system. It addresses all functional and non-functional requirements from the PRD.

**Related Documents:**
- Product Brief: `docs/product-brief-cc-config-2025-01-16.md`
- PRD: `docs/prd-cc-config-2025-01-16.md`

---

## Executive Summary

cc-config utilise une architecture **File-Based Configuration** simple et efficace :
- Fichiers de configuration versionnés dans un repo Git
- Scripts Bash utilitaires pour l'automatisation
- Installation via script déployant vers `~/.claude/`
- Aucune dépendance externe (uniquement Bash + Git)

Cette architecture respecte les principes de simplicité, portabilité et réversibilité définis dans les NFRs.

---

## Architectural Drivers

Les NFRs suivants ont le plus d'impact sur les décisions architecturales :

| NFR | Driver | Impact |
|-----|--------|--------|
| NFR-001 | **Simplicité** | Structure plate, pas de frameworks, fichiers atomiques |
| NFR-002 | **Portabilité** | Scripts bash standards, installation < 5 min |
| NFR-003 | **Compatibilité CC** | Respecter exactement la structure ~/.claude/ |
| NFR-004 | **Réversibilité** | Git branches + script rollback |
| NFR-007 | **Autonomie** | Zéro dépendance externe |

**Ce qui n'est PAS nécessaire :**
- Base de données
- Serveur / API
- Conteneurisation
- CI/CD complexe
- Frameworks

---

## High-Level Architecture

### Pattern : File-Based Configuration avec Scripts Utilitaires

```
┌─────────────────────────────────────────────────────────────┐
│                   cc-config (Git Repository)                │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌───────────┐ ┌───────────┐ ┌───────────┐ ┌───────────┐   │
│  │ settings/ │ │ commands/ │ │  agents/  │ │  hooks/   │   │
│  │  (.json)  │ │   (.md)   │ │   (.md)   │ │   (.sh)   │   │
│  └─────┬─────┘ └─────┬─────┘ └─────┬─────┘ └─────┬─────┘   │
│        │             │             │             │          │
│        └─────────────┴──────┬──────┴─────────────┘          │
│                             │                               │
│                     ┌───────▼───────┐                       │
│                     │  install.sh   │                       │
│                     │   (Deployer)  │                       │
│                     └───────┬───────┘                       │
│                             │                               │
├─────────────────────────────┼───────────────────────────────┤
│                             ▼                               │
│               ~/.claude/ (Claude Code Config)               │
│   ┌──────────────┬────────────────┬────────────────┐       │
│   │settings.json │   commands/    │    agents/     │       │
│   └──────────────┴────────────────┴────────────────┘       │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│                   Scripts Utilitaires                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌─────────────────┐  ┌────────────┐  ┌──────────────┐     │
│  │ experimental.sh │  │ veille.sh  │  │   note.sh    │     │
│  │ (Test/Rollback) │  │  (Veille)  │  │(Notes rapides│     │
│  └─────────────────┘  └────────────┘  └──────────────┘     │
│                                                             │
└─────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────┐
│                      Documentation                          │
├─────────────────────────────────────────────────────────────┤
│  docs/                                                      │
│  ├── tips.md          (Trucs et astuces)                   │
│  ├── veille.md        (Suivi nouveautés)                   │
│  ├── backlog.md       (Idées à tester)                     │
│  ├── changelog.md     (Historique)                         │
│  └── usage.md         (Guide utilisation)                  │
└─────────────────────────────────────────────────────────────┘
```

### Rationale

- **File-Based** : Pas besoin de BDD, les fichiers suffisent pour une config personnelle
- **Git-Versioned** : Historique complet, branches pour experiments, backup sur remote
- **Script-Driven** : Automatisation simple et portable via Bash

---

## Technology Stack

### Choix Technologiques

| Catégorie | Technologie | Justification |
|-----------|-------------|---------------|
| **Scripts** | Bash | Standard Linux/WSL, aucune installation requise |
| **Config** | JSON | Format natif de Claude Code settings |
| **Documentation** | Markdown | Lisible, versionnable, rendu natif dans CC |
| **Versioning** | Git | Standard industrie, branches, historique |
| **Remote** | GitHub | Backup cloud, partage potentiel, issues |

### Dépendances

**Runtime (requises) :**
- Bash 4.0+
- Git 2.0+
- Claude Code (installé)

**Aucune dépendance optionnelle** - Le système fonctionne avec uniquement les outils ci-dessus.

### Trade-offs

| Décision | Avantage | Inconvénient |
|----------|----------|--------------|
| Bash uniquement | Portable, pas de setup | Moins de features que Python/Node |
| Fichiers plats | Simple, lisible | Pas de requêtes complexes |
| Pas de sync auto | Simple, Git suffit | Manuel pour multi-machines |

---

## System Components

### Component 1: Config Core (`settings/`)

**Purpose:** Centraliser la configuration Claude Code

**Files:**
- `settings.json` - Configuration principale
- `mcp-servers.json` - Configuration MCP servers

**Responsibilities:**
- Stocker les settings Claude Code
- Définir les permissions
- Configurer les hooks

**Interfaces:**
- Lecture/écriture directe (éditeur)
- Déploiement via `install.sh`

**FRs Addressed:** FR-003

---

### Component 2: Commands (`commands/`)

**Purpose:** Définir des commandes slash personnalisées

**Files:** `*.md` (un fichier par commande)

**Responsibilities:**
- Définir le comportement de chaque commande
- Documenter l'usage

**Naming Convention:** `{command-name}.md` → `/command-name`

**FRs Addressed:** FR-004

---

### Component 3: Agents (`agents/`)

**Purpose:** Définir des agents spécialisés

**Files:** `*.md` (un fichier par agent)

**Responsibilities:**
- Définir le rôle et les capacités
- Spécifier les outils disponibles
- Donner des exemples d'utilisation

**FRs Addressed:** FR-008

---

### Component 4: Hooks (`hooks/`)

**Purpose:** Scripts d'automatisation Claude Code

**Files:** `*.sh` (scripts exécutables)

**Responsibilities:**
- Notifications
- Actions automatiques sur événements

**FRs Addressed:** FR-009

---

### Component 5: Scripts Utilitaires (`scripts/`)

**Purpose:** Outils d'aide à la gestion

**Files:**

| Script | Responsabilité | FRs |
|--------|----------------|-----|
| `experimental.sh` | Workflow test/validate/rollback | FR-002 |
| `veille.sh` | Ouvrir sources de veille | FR-006 |
| `note.sh` | Ajouter notes rapidement | FR-007 |

---

### Component 6: Documentation (`docs/`)

**Purpose:** Capitaliser les connaissances

**Files:**

| Fichier | Contenu | FR |
|---------|---------|-----|
| `tips.md` | Trucs et astuces | FR-005 |
| `veille.md` | Suivi nouveautés | FR-006 |
| `backlog.md` | Idées à tester | FR-011 |
| `changelog.md` | Historique modifications | FR-012 |
| `usage.md` | Guide utilisation | - |

---

### Component 7: Installer (`install.sh`)

**Purpose:** Déployer la config sur une machine

**Responsibilities:**
- Copier/lier les fichiers vers `~/.claude/`
- Sauvegarder la config existante (option)
- Afficher la progression

**Options:**
- `--dry-run` : Simulation sans exécution
- `--backup` : Sauvegarde préalable

**FRs Addressed:** FR-001

---

### Component 8: Experimental (`experimental/`)

**Purpose:** Zone de travail pour tests de nouveautés

**Files:**
- `current.md` - Documentation du test en cours

**Workflow:**
1. `experimental.sh start <name>` → Crée branche `exp/<name>`
2. Modifier, tester
3. `experimental.sh validate` → Merge et nettoie
4. `experimental.sh rollback` → Annule tout

**FRs Addressed:** FR-002

---

## Data Architecture

### Data Model

**Pas de base de données** - Données stockées en fichiers :

| Type de données | Format | Emplacement |
|-----------------|--------|-------------|
| Configuration CC | JSON | `settings/settings.json` |
| MCP Servers | JSON | `settings/mcp-servers.json` |
| Commands | Markdown | `commands/*.md` |
| Agents | Markdown | `agents/*.md` |
| Documentation | Markdown | `docs/*.md` |
| État workflow | YAML | `docs/bmm-workflow-status.yaml` |

### Data Flow

```
┌──────────────┐    ┌──────────────┐    ┌──────────────┐
│   Édition    │───▶│  Git Commit  │───▶│  install.sh  │
│  (VS Code)   │    │              │    │              │
└──────────────┘    └──────────────┘    └──────┬───────┘
                                               │
                                               ▼
                                        ┌──────────────┐
                                        │  ~/.claude/  │
                                        │   (Actif)    │
                                        └──────────────┘
```

### Backup Strategy

- **Local:** Git history (toutes les versions)
- **Remote:** GitHub (push régulier)
- **Pre-install:** Option `--backup` sauvegarde `~/.claude/` existant

---

## Directory Structure

```
cc-config/
├── CLAUDE.md                 # Instructions projet pour Claude Code
├── README.md                 # Documentation publique
├── install.sh                # Script d'installation
│
├── settings/                 # Configuration Claude Code
│   ├── settings.json         # Settings principaux
│   └── mcp-servers.json      # Config MCP servers
│
├── commands/                 # Commandes slash personnalisées
│   ├── experimental.md       # /experimental
│   ├── veille.md             # /veille
│   ├── note.md               # /note
│   └── ...                   # Autres commandes
│
├── agents/                   # Agents spécialisés
│   ├── python-expert.md
│   ├── mcp-copilot-expert.md
│   └── ...
│
├── hooks/                    # Scripts de hooks
│   └── notify.sh
│
├── scripts/                  # Scripts utilitaires
│   ├── experimental.sh       # Workflow test/rollback
│   ├── veille.sh             # Ouvrir sources veille
│   └── note.sh               # Notes rapides
│
├── docs/                     # Documentation
│   ├── tips.md               # Trucs et astuces
│   ├── veille.md             # Suivi nouveautés
│   ├── backlog.md            # Idées à tester
│   ├── changelog.md          # Historique
│   ├── usage.md              # Guide utilisation
│   └── bmm-workflow-status.yaml  # État BMAD
│
├── experimental/             # Zone de test
│   └── current.md            # Test en cours
│
└── bmad/                     # Config BMAD (si utilisé)
    └── config.yaml
```

---

## NFR Coverage

### NFR-001: Simplicité

**Requirement:** Max 10 fichiers config principaux, structure intuitive

**Solution:**
- Structure plate et prévisible
- 1 fichier = 1 élément (1 command = 1 fichier .md)
- Pas de configuration complexe ou imbriquée
- Scripts < 200 lignes chacun

**Validation:** Compter les fichiers, review structure

---

### NFR-002: Portabilité

**Requirement:** Installation < 5 minutes sur Linux/WSL

**Solution:**
- Script `install.sh` autonome
- Uniquement Bash + Git requis
- Options `--dry-run` et `--backup`
- Messages clairs de progression

**Validation:** Test sur machine vierge, chrono < 5 min

---

### NFR-003: Compatibilité Claude Code

**Requirement:** Compatible avec mises à jour CC

**Solution:**
- Utiliser uniquement la structure documentée `~/.claude/`
- Pas de modification du core Claude Code
- Fichiers standards (JSON, Markdown)

**Validation:** Test après chaque mise à jour majeure CC

---

### NFR-004: Réversibilité

**Requirement:** Rollback < 1 minute

**Solution:**
- Git branches pour chaque expérimentation
- Script `experimental.sh rollback`
- Historique Git complet

**Validation:** Test rollback, chrono < 1 min

---

### NFR-005: Documentation

**Requirement:** Toute feature documentée

**Solution:**
- `docs/` pour documentation générale
- `CLAUDE.md` pour instructions projet
- Chaque script avec `--help`

**Validation:** Checklist documentation par feature

---

### NFR-006: Versioning

**Requirement:** Historique complet via Git

**Solution:**
- Commits atomiques et descriptifs
- Branches pour expérimentations
- Push régulier sur GitHub

**Validation:** `git log` lisible et utile

---

### NFR-007: Autonomie

**Requirement:** Pas de dépendances externes lourdes

**Solution:**
- Bash uniquement pour scripts
- Git pour versioning
- Aucun npm/pip/gems

**Validation:** Installation sans internet (sauf git clone initial)

---

### NFR-008: Extensibilité

**Requirement:** Facile d'ajouter commands/agents

**Solution:**
- Structure modulaire (1 fichier = 1 élément)
- Pas de registration centrale
- Conventions de nommage claires

**Validation:** Ajouter un élément en < 2 minutes

---

## Security Considerations

**Contexte:** Projet personnel sur machine dédiée, pas de données sensibles externes.

### Bonnes Pratiques

- **Pas de secrets dans le repo** : Utiliser variables d'environnement si besoin
- **Permissions fichiers** : Scripts exécutables (755), configs lisibles (644)
- **Git ignore** : Exclure fichiers temporaires et secrets locaux

### .gitignore recommandé

```
# Secrets
.env
*.secret

# Temporaire
*.tmp
*.log

# OS
.DS_Store
Thumbs.db

# IDE
.vscode/
.idea/
```

---

## Testing Strategy

### Test Manuel

Pour un projet de cette taille, les tests manuels suffisent :

| Test | Commande | Attendu |
|------|----------|---------|
| Installation | `./install.sh --dry-run` | Liste des actions sans exécution |
| Installation réelle | `./install.sh` | Fichiers copiés vers ~/.claude/ |
| Experimental start | `./scripts/experimental.sh start test` | Branche exp/test créée |
| Experimental rollback | `./scripts/experimental.sh rollback` | Retour branche principale |
| Note | `./scripts/note.sh tip "test"` | Ligne ajoutée à docs/tips.md |

### Validation Post-Installation

```bash
# Vérifier que Claude Code fonctionne
claude --version

# Tester une commande personnalisée
# (dans Claude Code) /experimental status
```

---

## Deployment

### Installation Initiale

```bash
# 1. Cloner le repo
git clone https://github.com/PlumyCat/cc-config.git
cd cc-config

# 2. Installer
./install.sh --backup

# 3. Vérifier
claude --version
```

### Mise à Jour

```bash
cd cc-config
git pull
./install.sh
```

### Migration Nouvelle Machine

```bash
# Sur nouvelle machine
git clone https://github.com/PlumyCat/cc-config.git
cd cc-config
./install.sh
# Terminé en < 5 minutes
```

---

## Traceability Matrix

### FR → Components

| FR ID | FR Name | Component(s) | File(s) |
|-------|---------|--------------|---------|
| FR-001 | Installation portable | Installer | `install.sh` |
| FR-002 | Workflow experimental | Scripts, Experimental | `scripts/experimental.sh`, `experimental/` |
| FR-003 | Gestion settings | Config Core | `settings/settings.json` |
| FR-004 | Gestion commands | Commands | `commands/*.md` |
| FR-005 | Documentation tips | Docs | `docs/tips.md` |
| FR-006 | Système de veille | Scripts, Docs | `scripts/veille.sh`, `docs/veille.md` |
| FR-007 | Notes rapides | Scripts | `scripts/note.sh` |
| FR-008 | Gestion agents | Agents | `agents/*.md` |
| FR-009 | Gestion hooks | Hooks | `hooks/*.sh` |
| FR-010 | Gestion MCP | Config Core, Docs | `settings/mcp-servers.json` |
| FR-011 | Backlog structuré | Docs | `docs/backlog.md` |
| FR-012 | Changelog | Docs | `docs/changelog.md` |

### NFR → Solutions

| NFR ID | NFR Name | Solution |
|--------|----------|----------|
| NFR-001 | Simplicité | Structure plate, fichiers atomiques |
| NFR-002 | Portabilité | install.sh, bash uniquement |
| NFR-003 | Compatibilité CC | Structure ~/.claude/ standard |
| NFR-004 | Réversibilité | Git branches, experimental.sh rollback |
| NFR-005 | Documentation | docs/, CLAUDE.md |
| NFR-006 | Versioning | Git, commits clairs |
| NFR-007 | Autonomie | Bash + Git uniquement |
| NFR-008 | Extensibilité | 1 fichier = 1 élément |

---

## Trade-offs & Decisions

### Decision 1: Bash vs Python/Node

**Choix:** Bash

**Avantages:**
- Aucune installation requise
- Portable Linux/WSL
- Simple pour des scripts utilitaires

**Inconvénients:**
- Moins de features avancées
- Parsing complexe plus difficile

**Rationale:** Pour des scripts < 200 lignes, Bash suffit largement. Pas besoin de sur-ingénierie.

---

### Decision 2: Fichiers plats vs Base de données

**Choix:** Fichiers plats (JSON, Markdown, YAML)

**Avantages:**
- Lisibles directement
- Versionnables avec Git
- Éditables avec n'importe quel éditeur

**Inconvénients:**
- Pas de requêtes complexes
- Pas de relations

**Rationale:** Config personnelle, pas besoin de requêtes. La simplicité prime.

---

### Decision 3: Copie vs Liens symboliques

**Choix:** Copie (configurable)

**Avantages:**
- Fonctionne partout
- Pas de problèmes de permissions

**Inconvénients:**
- Nécessite re-run install.sh après modifs

**Rationale:** Plus robuste. L'installation est rapide, ce n'est pas un problème.

---

## Future Considerations

### Évolutions Possibles

1. **Sync multi-machines** : Script de sync via Git
2. **Template public** : Version anonymisée partageable
3. **Dashboard veille** : Script générant un résumé HTML
4. **Tests automatisés** : Si le projet grossit

### Ce qui ne changera PAS

- Bash comme langage principal
- Structure fichiers plats
- Git comme unique outil de versioning
- Philosophie "simplicité d'abord"

---

## Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2025-01-16 | Eric | Initial Architecture |

---

## Next Steps

### Phase 4: Sprint Planning

Run `/sprint-planning` to:
- Créer les user stories détaillées
- Estimer la complexité
- Planifier les sprints

**Documentation complète disponible :**
- ✅ Product Brief
- ✅ PRD (12 FRs, 8 NFRs, 4 Epics)
- ✅ Architecture

L'implémentation peut commencer !

---

**This document was created using BMAD Method v6 - Phase 3 (Solutioning)**

*To continue: Run `/workflow-status` to see your progress and next recommended workflow.*
