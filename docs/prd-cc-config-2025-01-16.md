# Product Requirements Document: cc-config

**Date:** 2025-01-16
**Author:** Eric
**Version:** 1.0
**Project Type:** Library / Configuration personnelle
**Project Level:** 2 (Medium - 5-15 stories)
**Status:** Draft

---

## Document Overview

This Product Requirements Document (PRD) defines the functional and non-functional requirements for cc-config. It serves as the source of truth for what will be built and provides traceability from requirements through implementation.

**Related Documents:**
- Product Brief: `docs/product-brief-cc-config-2025-01-16.md`

---

## Executive Summary

**cc-config** est un système de gestion de configuration personnelle pour Claude Code, destiné à un développeur solo sur machine dédiée. Il permet de faire de la veille sur les nouveautés Claude Code, les tester en sécurité avec rollback possible, maintenir à jour les MCP/plugins/tools, documenter et s'auto-former, puis déployer progressivement les améliorations sur les projets en production.

---

## Product Goals

### Business Objectives

- Réduire le temps de veille Claude Code (automatiser/structurer)
- Tester les nouveautés sans risque pour les projets prod
- Avoir une documentation toujours à jour et accessible
- Pouvoir reproduire l'environnement rapidement sur nouvelle machine

### Success Metrics

- Nombre de nouveautés testées/adoptées par mois
- Temps pour setup sur nouvelle machine < 5 minutes
- Zéro incident en prod lié à une nouveauté mal testée
- Documentation consultée et utile au quotidien

---

## Functional Requirements

Functional Requirements (FRs) define **what** the system does - specific features and behaviors.

Each requirement includes:
- **ID**: Unique identifier (FR-001, FR-002, etc.)
- **Priority**: Must Have / Should Have / Could Have (MoSCoW)
- **Description**: What the system should do
- **Acceptance Criteria**: How to verify it's complete

---

### FR-001: Installation portable

**Priority:** Must Have

**Description:**
Script `install.sh` permettant de déployer la configuration complète sur une nouvelle machine Linux/WSL en une seule commande.

**Acceptance Criteria:**
- [ ] Script exécutable sans dépendances préalables (hors git, bash)
- [ ] Installation complète en < 5 minutes
- [ ] Option `--dry-run` pour simuler sans exécuter
- [ ] Option `--backup` pour sauvegarder la config existante
- [ ] Messages clairs de progression et erreurs

**Dependencies:** Aucune

---

### FR-002: Workflow experimental

**Priority:** Must Have

**Description:**
Script `experimental.sh` permettant de créer des branches de test pour les nouveautés, avec possibilité de valider ou rollback.

**Acceptance Criteria:**
- [ ] Commande `start <name>` crée une branche `exp/<name>`
- [ ] Commande `status` affiche l'état du test en cours
- [ ] Commande `validate` merge la branche et nettoie
- [ ] Commande `rollback` annule et revient à l'état précédent
- [ ] Commande `list` affiche l'historique des expérimentations
- [ ] Fichier `experimental/current.md` pour documenter le test

**Dependencies:** Git

---

### FR-003: Gestion settings

**Priority:** Must Have

**Description:**
Centraliser et versionner le fichier `settings.json` de Claude Code avec une structure claire.

**Acceptance Criteria:**
- [ ] Fichier `settings/settings.json` versionné
- [ ] Structure documentée (permissions, hooks, mode)
- [ ] Lien symbolique ou copie vers `~/.claude/settings.json`

**Dependencies:** FR-001

---

### FR-004: Gestion commands

**Priority:** Must Have

**Description:**
Créer et organiser des commandes slash personnalisées dans un dossier dédié.

**Acceptance Criteria:**
- [ ] Dossier `commands/` avec fichiers `.md`
- [ ] Un fichier = une commande (nom fichier = nom commande)
- [ ] Documentation du format attendu
- [ ] Commandes installées dans `~/.claude/commands/`

**Dependencies:** FR-001

---

### FR-005: Documentation tips

**Priority:** Must Have

**Description:**
Fichier centralisant les trucs et astuces à retenir pour une consultation rapide.

**Acceptance Criteria:**
- [ ] Fichier `docs/tips.md` structuré par catégorie
- [ ] Format simple et scannable
- [ ] Possibilité d'ajouter via script `note.sh tip`

**Dependencies:** FR-007

---

### FR-006: Système de veille

**Priority:** Should Have

**Description:**
Tracker les nouveautés Claude Code avec sources, statuts (à tester, testé, adopté) et notes.

**Acceptance Criteria:**
- [ ] Fichier `docs/veille.md` avec structure définie
- [ ] Tableau des sources officielles et communautaires
- [ ] Tableau "En attente de test" avec date, feature, source, priorité
- [ ] Tableau "Testées" avec résultat et action
- [ ] Tableau "Adoptées" avec notes
- [ ] Script `veille.sh` pour ouvrir les sources rapidement

**Dependencies:** Aucune

---

### FR-007: Notes rapides

**Priority:** Should Have

**Description:**
Script `note.sh` pour ajouter rapidement des informations aux différents fichiers de documentation.

**Acceptance Criteria:**
- [ ] Commande `note.sh tip "message"` ajoute à tips.md
- [ ] Commande `note.sh todo "message"` ajoute au backlog
- [ ] Commande `note.sh veille "message"` ajoute à veille.md
- [ ] Commande `note.sh changelog "message"` ajoute au changelog
- [ ] Ajout automatique de la date

**Dependencies:** Aucune

---

### FR-008: Gestion agents

**Priority:** Should Have

**Description:**
Créer et organiser des agents spécialisés dans un dossier dédié.

**Acceptance Criteria:**
- [ ] Dossier `agents/` avec fichiers `.md`
- [ ] Un fichier = un agent (définition rôle, outils, exemples)
- [ ] Documentation du format attendu
- [ ] Agents installés dans `~/.claude/agents/`

**Dependencies:** FR-001

---

### FR-009: Gestion hooks

**Priority:** Should Have

**Description:**
Configurer des hooks Claude Code (notifications, actions automatiques).

**Acceptance Criteria:**
- [ ] Dossier `hooks/` avec scripts
- [ ] Documentation des événements supportés
- [ ] Hooks référencés dans settings.json

**Dependencies:** FR-003

---

### FR-010: Gestion MCP

**Priority:** Should Have

**Description:**
Documenter et maintenir la liste des MCP servers utilisés.

**Acceptance Criteria:**
- [ ] Section MCP dans la documentation
- [ ] Liste des MCP actifs avec usage
- [ ] Procédure d'ajout/suppression

**Dependencies:** Aucune

---

### FR-011: Backlog structuré

**Priority:** Could Have

**Description:**
Fichier pour tracker les idées, choses à tester, et améliorations futures.

**Acceptance Criteria:**
- [ ] Fichier `docs/backlog.md` avec sections définies
- [ ] Statuts visuels (emoji)
- [ ] Sections : À tester, Idées commands, Idées agents, Améliorations

**Dependencies:** Aucune

---

### FR-012: Changelog

**Priority:** Could Have

**Description:**
Historique des modifications significatives de la configuration.

**Acceptance Criteria:**
- [ ] Fichier `docs/changelog.md`
- [ ] Format date + description
- [ ] Ajout via `note.sh changelog`

**Dependencies:** FR-007

---

## Non-Functional Requirements

Non-Functional Requirements (NFRs) define **how** the system performs - quality attributes and constraints.

---

### NFR-001: Simplicité

**Priority:** Must Have

**Description:**
La configuration doit rester simple, lisible et maintenable par une seule personne.

**Acceptance Criteria:**
- [ ] Maximum 10 fichiers de configuration principaux
- [ ] Pas de logique complexe dans les scripts (< 200 lignes chacun)
- [ ] Structure intuitive et auto-documentée

**Rationale:** Projet personnel, pas de temps à perdre en complexité inutile.

---

### NFR-002: Portabilité

**Priority:** Must Have

**Description:**
Installation reproductible sur toute machine Linux/WSL.

**Acceptance Criteria:**
- [ ] Setup complet en < 5 minutes
- [ ] Fonctionne sur Ubuntu, Debian, WSL2
- [ ] Pas de dépendances spécifiques à une distribution

**Rationale:** Pouvoir migrer ou dupliquer l'environnement rapidement.

---

### NFR-003: Compatibilité Claude Code

**Priority:** Must Have

**Description:**
La configuration doit rester compatible avec les mises à jour de Claude Code.

**Acceptance Criteria:**
- [ ] Utilisation uniquement des APIs/structures documentées
- [ ] Pas de hack ou modification du core Claude Code
- [ ] Test après chaque mise à jour majeure de CC

**Rationale:** Éviter les breaking changes et la maintenance lourde.

---

### NFR-004: Réversibilité

**Priority:** Must Have

**Description:**
Possibilité de revenir en arrière rapidement après test d'une nouveauté.

**Acceptance Criteria:**
- [ ] Rollback complet en < 1 minute
- [ ] Aucune perte de données lors du rollback
- [ ] Historique Git propre pour tracer les changements

**Rationale:** Tester sans risque, annuler si problème.

---

### NFR-005: Documentation

**Priority:** Should Have

**Description:**
Toute fonctionnalité doit être documentée.

**Acceptance Criteria:**
- [ ] 1 documentation minimum par feature
- [ ] README à jour
- [ ] CLAUDE.md avec instructions projet

**Rationale:** Auto-formation et rappel rapide.

---

### NFR-006: Versioning

**Priority:** Should Have

**Description:**
Historique complet des changements via Git.

**Acceptance Criteria:**
- [ ] Commits clairs et descriptifs
- [ ] Branches pour les expérimentations
- [ ] Push régulier sur remote (GitHub)

**Rationale:** Backup et traçabilité.

---

### NFR-007: Autonomie

**Priority:** Should Have

**Description:**
Pas de dépendances externes lourdes.

**Acceptance Criteria:**
- [ ] Uniquement bash, git, outils standard Linux
- [ ] Pas de npm/pip/gems requis pour le core
- [ ] Fonctionne offline (sauf git push)

**Rationale:** Simplicité et fiabilité.

---

### NFR-008: Extensibilité

**Priority:** Could Have

**Description:**
Facile d'ajouter de nouvelles commands/agents.

**Acceptance Criteria:**
- [ ] Structure modulaire (1 fichier = 1 élément)
- [ ] Template documenté pour nouveaux éléments
- [ ] Pas de modification du core pour ajouter

**Rationale:** Évolution naturelle sans refactoring.

---

## Epics

Epics are logical groupings of related functionality that will be broken down into user stories during sprint planning (Phase 4).

---

### EPIC-001: Gestion de la Configuration

**Description:**
Centraliser et organiser tous les éléments de configuration Claude Code (settings, commands, agents, hooks, MCP).

**Functional Requirements:**
- FR-003: Gestion settings
- FR-004: Gestion commands
- FR-008: Gestion agents
- FR-009: Gestion hooks
- FR-010: Gestion MCP

**Story Count Estimate:** 4-6 stories

**Priority:** Must Have

**Business Value:**
Fondation du projet - sans configuration centralisée, pas de gestion possible.

---

### EPIC-002: Workflow Experimental

**Description:**
Permettre de tester les nouveautés Claude Code en sécurité avec possibilité de valider ou rollback.

**Functional Requirements:**
- FR-002: Workflow experimental

**Story Count Estimate:** 2-3 stories

**Priority:** Must Have

**Business Value:**
Sécurité des projets prod - tester sans risque de casser l'environnement de travail.

---

### EPIC-003: Installation & Portabilité

**Description:**
Rendre la configuration installable rapidement sur toute machine Linux/WSL.

**Functional Requirements:**
- FR-001: Installation portable

**Story Count Estimate:** 2-3 stories

**Priority:** Must Have

**Business Value:**
Résilience et mobilité - pouvoir recréer l'environnement n'importe où.

---

### EPIC-004: Documentation & Veille

**Description:**
Documenter l'usage, suivre les nouveautés Claude Code, capitaliser les connaissances.

**Functional Requirements:**
- FR-005: Documentation tips
- FR-006: Système de veille
- FR-007: Notes rapides
- FR-011: Backlog structuré
- FR-012: Changelog

**Story Count Estimate:** 4-5 stories

**Priority:** Should Have

**Business Value:**
Auto-formation et mémoire - ne pas perdre les connaissances acquises.

---

## User Stories (High-Level)

Detailed user stories will be created during sprint planning (Phase 4). Voici les stories principales par epic :

**EPIC-001 - Gestion Configuration:**
- En tant qu'utilisateur, je veux centraliser mes settings Claude Code pour les versionner
- En tant qu'utilisateur, je veux créer des commandes slash personnalisées facilement
- En tant qu'utilisateur, je veux gérer mes agents et hooks de manière organisée

**EPIC-002 - Workflow Experimental:**
- En tant qu'utilisateur, je veux tester une nouveauté sans risque pour mes projets
- En tant qu'utilisateur, je veux pouvoir annuler un test qui ne convient pas

**EPIC-003 - Installation:**
- En tant qu'utilisateur, je veux installer ma config sur une nouvelle machine en < 5 min
- En tant qu'utilisateur, je veux sauvegarder ma config existante avant installation

**EPIC-004 - Documentation:**
- En tant qu'utilisateur, je veux noter rapidement un tip découvert
- En tant qu'utilisateur, je veux suivre les nouveautés Claude Code de manière structurée

---

## User Personas

### Persona Principal : Eric

**Profil:**
- Dev autodidacte "vibecoding" (formation via IA)
- Utilisation quotidienne exclusive de Claude Code
- Travaille sur projets ambitieux (agence IA, projets Azure)
- Environnement : Azure/M365, Docker, Azure Functions

**Besoins:**
- Rester à jour sur les nouveautés Claude Code
- Tester sans casser les projets en production
- Documenter pour ne pas oublier
- Environnement reproductible

**Frustrations potentielles:**
- Perdre du temps à redécouvrir des choses
- Casser un projet prod en testant une nouveauté
- Config qui devient un plat de spaghetti

---

## User Flows

### Flow 1 : Tester une nouveauté

```
1. Voir nouveauté (veille.sh ou docs/veille.md)
2. Créer branche test (experimental.sh start <name>)
3. Modifier la config
4. Installer (install.sh)
5. Tester sur projet non-critique
6. Valider (experimental.sh validate) ou Rollback (experimental.sh rollback)
7. Documenter dans veille.md
```

### Flow 2 : Setup nouvelle machine

```
1. Cloner le repo (git clone)
2. Lancer installation (./install.sh --backup)
3. Vérifier (claude --version, tester une commande)
4. Terminé (< 5 minutes)
```

### Flow 3 : Ajouter une note rapide

```
1. Découvrir un tip utile
2. Lancer (./scripts/note.sh tip "le tip")
3. Tip ajouté à docs/tips.md avec date
```

---

## Dependencies

### Internal Dependencies

- Git installé et configuré
- Bash disponible
- Claude Code installé

### External Dependencies

- GitHub (remote pour backup/sync)
- Connexion internet (pour git push, veille)

---

## Assumptions

- Claude Code continue d'évoluer régulièrement
- Git est disponible sur toutes les machines cibles
- Machine Linux/WSL avec accès internet
- Temps disponible pour la veille (même minimal)
- Structure actuelle de Claude Code (~/.claude/) reste stable

---

## Out of Scope

- Gestion des projets eux-mêmes (juste la config Claude Code)
- Backup/sync automatique (Git suffit)
- Interface graphique
- Multi-utilisateurs / gestion de droits
- Sync temps réel entre machines

---

## Open Questions

1. Faut-il versionner les MCP servers configs ou juste les documenter ?
2. Quelle fréquence de veille est réaliste ? (hebdo semble bien)
3. Partager publiquement la config un jour ? (à décider plus tard)

---

## Approval & Sign-off

### Stakeholders

- **Eric (Owner/User)** - Influence haute. Seul décideur.

### Approval Status

- [x] Product Owner (Eric)
- [ ] Engineering Lead (N/A - projet solo)
- [ ] Design Lead (N/A)
- [ ] QA Lead (N/A)

---

## Revision History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | 2025-01-16 | Eric | Initial PRD |

---

## Next Steps

### Phase 3: Architecture

Run `/architecture` to create system architecture based on these requirements.

The architecture will address:
- All functional requirements (FRs)
- All non-functional requirements (NFRs)
- Structure des fichiers et dossiers
- Scripts et leur interaction
- Flux de données

### Phase 4: Sprint Planning

After architecture is complete, run `/sprint-planning` to:
- Break epics into detailed user stories
- Estimate story complexity
- Plan sprint iterations
- Begin implementation

---

**This document was created using BMAD Method v6 - Phase 2 (Planning)**

*To continue: Run `/workflow-status` to see your progress and next recommended workflow.*

---

## Appendix A: Requirements Traceability Matrix

| Epic ID | Epic Name | Functional Requirements | Story Count (Est.) |
|---------|-----------|-------------------------|-------------------|
| EPIC-001 | Gestion Configuration | FR-003, FR-004, FR-008, FR-009, FR-010 | 4-6 |
| EPIC-002 | Workflow Experimental | FR-002 | 2-3 |
| EPIC-003 | Installation & Portabilité | FR-001 | 2-3 |
| EPIC-004 | Documentation & Veille | FR-005, FR-006, FR-007, FR-011, FR-012 | 4-5 |

**Total:** 12 FRs → 4 Epics → 12-17 Stories estimées

---

## Appendix B: Prioritization Details

### Functional Requirements

| Priority | Count | FRs |
|----------|-------|-----|
| Must Have | 5 | FR-001, FR-002, FR-003, FR-004, FR-005 |
| Should Have | 5 | FR-006, FR-007, FR-008, FR-009, FR-010 |
| Could Have | 2 | FR-011, FR-012 |

### Non-Functional Requirements

| Priority | Count | NFRs |
|----------|-------|------|
| Must Have | 4 | NFR-001, NFR-002, NFR-003, NFR-004 |
| Should Have | 3 | NFR-005, NFR-006, NFR-007 |
| Could Have | 1 | NFR-008 |

### Summary

- **Critical (Must Have):** 9 requirements (5 FR + 4 NFR)
- **Important (Should Have):** 8 requirements (5 FR + 3 NFR)
- **Nice to Have (Could Have):** 3 requirements (2 FR + 1 NFR)
