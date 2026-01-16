# Sprint Plan: cc-config

**Date:** 2025-01-16
**Scrum Master:** Eric
**Project Level:** 2 (Medium)
**Total Stories:** 15
**Total Points:** 19
**Planned Sprints:** 1

---

## Executive Summary

Sprint unique de validation et complétion du projet cc-config. La majorité des fonctionnalités existe déjà - ce sprint vise à valider, documenter et compléter les éléments manquants.

**Key Metrics:**
- Total Stories: 15
- Total Points: 19
- Stories existantes (à valider): 11 (11 points)
- Stories partielles (à améliorer): 3 (6 points)
- Stories nouvelles (à créer): 1 (2 points)
- Target Completion: 1 semaine

---

## Sprint 1: Validation & Complétion

**Goal:** Valider toutes les fonctionnalités existantes et compléter les éléments manquants

**Durée:** 1 semaine
**Points:** 19 points

---

## Story Inventory

### EPIC-001: Gestion Configuration

---

#### STORY-001: Centraliser settings.json

**Epic:** EPIC-001 - Gestion Configuration
**Priority:** Must Have
**Points:** 1
**Status:** ✅ Existe (à valider)

**User Story:**
En tant qu'utilisateur,
Je veux avoir mes settings Claude Code centralisés dans le repo,
Afin de les versionner et les déployer facilement.

**Acceptance Criteria:**
- [x] Fichier `settings/settings.json` existe
- [ ] Structure documentée dans CLAUDE.md
- [ ] Déployé correctement par install.sh

**Technical Notes:**
- Fichier existant : `settings/settings.json`
- Vérifier que install.sh le copie vers `~/.claude/settings.json`

---

#### STORY-002: Organiser les commands

**Epic:** EPIC-001 - Gestion Configuration
**Priority:** Must Have
**Points:** 1
**Status:** ✅ Existe (à valider)

**User Story:**
En tant qu'utilisateur,
Je veux avoir mes commandes slash organisées dans un dossier dédié,
Afin de les retrouver et les maintenir facilement.

**Acceptance Criteria:**
- [x] Dossier `commands/` existe avec fichiers .md
- [x] Convention de nommage respectée (nom fichier = nom commande)
- [ ] Liste des commandes documentée

**Technical Notes:**
- Commands existantes : experimental, veille, note, debug-mcp, etc.
- Vérifier déploiement vers `~/.claude/commands/`

---

#### STORY-003: Organiser les agents

**Epic:** EPIC-001 - Gestion Configuration
**Priority:** Should Have
**Points:** 1
**Status:** ✅ Existe (à valider)

**User Story:**
En tant qu'utilisateur,
Je veux avoir mes agents organisés dans un dossier dédié,
Afin de les retrouver et les maintenir facilement.

**Acceptance Criteria:**
- [x] Dossier `agents/` existe avec fichiers .md
- [x] Format agent respecté (rôle, outils, exemples)
- [ ] Liste des agents documentée

**Technical Notes:**
- Agents existants : python-expert, mcp-copilot-expert, mcp-tester, etc.
- Vérifier déploiement vers `~/.claude/agents/`

---

#### STORY-004: Configurer les hooks

**Epic:** EPIC-001 - Gestion Configuration
**Priority:** Should Have
**Points:** 2
**Status:** 🔶 Partiel

**User Story:**
En tant qu'utilisateur,
Je veux configurer des hooks Claude Code,
Afin d'automatiser certaines actions (notifications, etc.).

**Acceptance Criteria:**
- [ ] Dossier `hooks/` existe avec scripts
- [ ] Au moins un hook fonctionnel
- [ ] Hooks référencés dans settings.json
- [ ] Documentation des hooks disponibles

**Technical Notes:**
- Vérifier structure actuelle des hooks
- Documenter les événements supportés par Claude Code

---

#### STORY-005: Documenter les MCP

**Epic:** EPIC-001 - Gestion Configuration
**Priority:** Should Have
**Points:** 2
**Status:** 🔴 À faire

**User Story:**
En tant qu'utilisateur,
Je veux avoir une documentation de mes MCP servers,
Afin de savoir lesquels j'utilise et comment les configurer.

**Acceptance Criteria:**
- [ ] Section MCP dans docs/ ou CLAUDE.md
- [ ] Liste des MCP actifs avec leur usage
- [ ] Procédure d'ajout/suppression d'un MCP
- [ ] Fichier `settings/mcp-servers.json` documenté

**Technical Notes:**
- Fichier existant : `settings/mcp-servers.json`
- Créer une section dédiée dans la documentation

---

### EPIC-002: Workflow Experimental

---

#### STORY-006: Script experimental.sh

**Epic:** EPIC-002 - Workflow Experimental
**Priority:** Must Have
**Points:** 1
**Status:** ✅ Existe (à valider)

**User Story:**
En tant qu'utilisateur,
Je veux un script pour gérer mes tests de nouveautés,
Afin de pouvoir tester et rollback en sécurité.

**Acceptance Criteria:**
- [x] Script `scripts/experimental.sh` existe
- [ ] Commande `start <name>` fonctionne
- [ ] Commande `status` fonctionne
- [ ] Commande `validate` fonctionne
- [ ] Commande `rollback` fonctionne
- [ ] Commande `list` fonctionne

**Technical Notes:**
- Tester chaque commande manuellement
- Vérifier création branche `exp/<name>`

---

#### STORY-007: Documenter workflow experimental

**Epic:** EPIC-002 - Workflow Experimental
**Priority:** Should Have
**Points:** 2
**Status:** 🔶 Partiel

**User Story:**
En tant qu'utilisateur,
Je veux comprendre comment utiliser le workflow experimental,
Afin de tester les nouveautés correctement.

**Acceptance Criteria:**
- [ ] Section dans docs/usage.md ou CLAUDE.md
- [ ] Exemples d'utilisation
- [ ] Workflow step-by-step documenté

**Technical Notes:**
- Documenter le flow : veille → start → test → validate/rollback

---

#### STORY-008: Template current.md

**Epic:** EPIC-002 - Workflow Experimental
**Priority:** Could Have
**Points:** 1
**Status:** ✅ Existe (à valider)

**User Story:**
En tant qu'utilisateur,
Je veux un template pour documenter mes tests,
Afin de garder trace de ce que je teste.

**Acceptance Criteria:**
- [x] Fichier `experimental/current.md` existe
- [x] Template avec sections (Objectif, Changements, Notes, Résultat)
- [ ] Généré automatiquement par `experimental.sh start`

**Technical Notes:**
- Vérifier que le script crée/reset le fichier

---

### EPIC-003: Installation & Portabilité

---

#### STORY-009: Script install.sh

**Epic:** EPIC-003 - Installation & Portabilité
**Priority:** Must Have
**Points:** 1
**Status:** ✅ Existe (à valider)

**User Story:**
En tant qu'utilisateur,
Je veux un script d'installation,
Afin de déployer ma config sur une nouvelle machine rapidement.

**Acceptance Criteria:**
- [x] Script `install.sh` existe et est exécutable
- [ ] Copie settings vers ~/.claude/
- [ ] Copie commands vers ~/.claude/commands/
- [ ] Copie agents vers ~/.claude/agents/
- [ ] Messages de progression clairs

**Technical Notes:**
- Tester sur la machine actuelle
- Vérifier les chemins de destination

---

#### STORY-010: Options --dry-run et --backup

**Epic:** EPIC-003 - Installation & Portabilité
**Priority:** Should Have
**Points:** 2
**Status:** 🔶 À vérifier

**User Story:**
En tant qu'utilisateur,
Je veux des options de sécurité pour l'installation,
Afin de simuler ou sauvegarder avant d'écraser.

**Acceptance Criteria:**
- [ ] Option `--dry-run` simule sans exécuter
- [ ] Option `--backup` sauvegarde ~/.claude/ existant
- [ ] Messages clairs indiquant le mode
- [ ] Documentation des options dans --help

**Technical Notes:**
- Vérifier si ces options existent déjà
- Implémenter si manquantes

---

### EPIC-004: Documentation & Veille

---

#### STORY-011: Fichier tips.md

**Epic:** EPIC-004 - Documentation & Veille
**Priority:** Must Have
**Points:** 1
**Status:** ✅ Existe (à valider)

**User Story:**
En tant qu'utilisateur,
Je veux un fichier pour mes trucs et astuces,
Afin de ne pas oublier ce que j'apprends.

**Acceptance Criteria:**
- [x] Fichier `docs/tips.md` existe
- [x] Structure par catégorie
- [ ] Au moins 5 tips documentés

**Technical Notes:**
- Vérifier contenu actuel
- Ajouter tips manquants si besoin

---

#### STORY-012: Système veille complet

**Epic:** EPIC-004 - Documentation & Veille
**Priority:** Must Have
**Points:** 1
**Status:** ✅ Existe (à valider)

**User Story:**
En tant qu'utilisateur,
Je veux un système de veille structuré,
Afin de suivre les nouveautés Claude Code.

**Acceptance Criteria:**
- [x] Fichier `docs/veille.md` existe
- [x] Tableaux sources (officielles, communautaires)
- [x] Tableaux statuts (à tester, testées, adoptées)
- [x] Script `scripts/veille.sh` existe

**Technical Notes:**
- Système déjà bien en place
- Valider que veille.sh fonctionne

---

#### STORY-013: Script note.sh

**Epic:** EPIC-004 - Documentation & Veille
**Priority:** Should Have
**Points:** 1
**Status:** ✅ Existe (à valider)

**User Story:**
En tant qu'utilisateur,
Je veux ajouter des notes rapidement via script,
Afin de capturer l'information sans friction.

**Acceptance Criteria:**
- [x] Script `scripts/note.sh` existe
- [ ] Commande `tip "message"` fonctionne
- [ ] Commande `todo "message"` fonctionne
- [ ] Commande `veille "message"` fonctionne
- [ ] Commande `changelog "message"` fonctionne
- [ ] Date ajoutée automatiquement

**Technical Notes:**
- Tester chaque commande
- Vérifier format d'ajout dans les fichiers

---

#### STORY-014: Backlog structuré

**Epic:** EPIC-004 - Documentation & Veille
**Priority:** Could Have
**Points:** 1
**Status:** ✅ Existe (à valider)

**User Story:**
En tant qu'utilisateur,
Je veux un backlog pour mes idées,
Afin de ne pas perdre les choses à tester.

**Acceptance Criteria:**
- [x] Fichier `docs/backlog.md` existe
- [x] Sections définies (À tester, Idées commands, etc.)
- [x] Statuts visuels (emoji)

**Technical Notes:**
- Fichier déjà bien structuré
- Valider qu'il est utilisé

---

#### STORY-015: Changelog

**Epic:** EPIC-004 - Documentation & Veille
**Priority:** Could Have
**Points:** 1
**Status:** ✅ Existe (à valider)

**User Story:**
En tant qu'utilisateur,
Je veux un changelog des modifications,
Afin de savoir ce qui a changé.

**Acceptance Criteria:**
- [x] Fichier `docs/changelog.md` existe
- [ ] Format date + description
- [ ] Ajout via `note.sh changelog` fonctionne

**Technical Notes:**
- Vérifier format actuel
- Tester ajout via script

---

## Sprint Allocation

### Sprint 1 (Unique) - 19/19 points

**Goal:** Valider toutes les fonctionnalités et compléter les éléments manquants

**Priority Order:**

**Must Have (à faire en premier):**
1. STORY-009: Script install.sh (1 pt) - Valider
2. STORY-001: Centraliser settings.json (1 pt) - Valider
3. STORY-002: Organiser les commands (1 pt) - Valider
4. STORY-006: Script experimental.sh (1 pt) - Valider
5. STORY-011: Fichier tips.md (1 pt) - Valider
6. STORY-012: Système veille complet (1 pt) - Valider

**Should Have (ensuite):**
7. STORY-003: Organiser les agents (1 pt) - Valider
8. STORY-010: Options --dry-run et --backup (2 pt) - Vérifier/Implémenter
9. STORY-004: Configurer les hooks (2 pt) - Compléter
10. STORY-005: Documenter les MCP (2 pt) - Créer
11. STORY-007: Documenter workflow experimental (2 pt) - Compléter
12. STORY-013: Script note.sh (1 pt) - Valider

**Could Have (si temps):**
13. STORY-008: Template current.md (1 pt) - Valider
14. STORY-014: Backlog structuré (1 pt) - Valider
15. STORY-015: Changelog (1 pt) - Valider

**Total:** 19 points

---

## Epic Traceability

| Epic ID | Epic Name | Stories | Points | Status |
|---------|-----------|---------|--------|--------|
| EPIC-001 | Gestion Configuration | STORY-001 à 005 | 7 | 3 à valider, 1 partiel, 1 nouveau |
| EPIC-002 | Workflow Experimental | STORY-006 à 008 | 4 | 2 à valider, 1 partiel |
| EPIC-003 | Installation & Portabilité | STORY-009 à 010 | 3 | 1 à valider, 1 partiel |
| EPIC-004 | Documentation & Veille | STORY-011 à 015 | 5 | 5 à valider |

---

## Requirements Coverage

| FR ID | FR Name | Story | Points | Status |
|-------|---------|-------|--------|--------|
| FR-001 | Installation portable | STORY-009, 010 | 3 | ✅/🔶 |
| FR-002 | Workflow experimental | STORY-006, 007, 008 | 4 | ✅/🔶 |
| FR-003 | Gestion settings | STORY-001 | 1 | ✅ |
| FR-004 | Gestion commands | STORY-002 | 1 | ✅ |
| FR-005 | Documentation tips | STORY-011 | 1 | ✅ |
| FR-006 | Système de veille | STORY-012 | 1 | ✅ |
| FR-007 | Notes rapides | STORY-013 | 1 | ✅ |
| FR-008 | Gestion agents | STORY-003 | 1 | ✅ |
| FR-009 | Gestion hooks | STORY-004 | 2 | 🔶 |
| FR-010 | Gestion MCP | STORY-005 | 2 | 🔴 |
| FR-011 | Backlog structuré | STORY-014 | 1 | ✅ |
| FR-012 | Changelog | STORY-015 | 1 | ✅ |

**Couverture:** 12/12 FRs (100%)

---

## Definition of Done

Pour qu'une story soit considérée comme terminée :

- [ ] Fonctionnalité implémentée ou validée
- [ ] Tests manuels effectués
- [ ] Documentation à jour (si applicable)
- [ ] Pas de régression sur les autres fonctionnalités
- [ ] Commit Git avec message clair

---

## Checklist de Validation Rapide

### Scripts à tester

```bash
# Installation
./install.sh --help
./install.sh --dry-run

# Experimental
./scripts/experimental.sh status
./scripts/experimental.sh list

# Veille
./scripts/veille.sh
./scripts/veille.sh version

# Notes
./scripts/note.sh tip "Test tip"
./scripts/note.sh todo "Test todo"
```

### Fichiers à vérifier

- [ ] `settings/settings.json` - Structure correcte
- [ ] `settings/mcp-servers.json` - MCP documentés
- [ ] `commands/*.md` - Au moins 5 commands
- [ ] `agents/*.md` - Au moins 3 agents
- [ ] `docs/tips.md` - Au moins 5 tips
- [ ] `docs/veille.md` - Tableaux complets
- [ ] `docs/backlog.md` - Structure OK
- [ ] `docs/changelog.md` - Format OK

---

## Next Steps

**Immédiat:** Commencer la validation des stories

**Options:**
1. `/dev-story STORY-009` - Commencer par valider install.sh
2. Validation manuelle avec la checklist ci-dessus
3. `/workflow-status` - Voir la progression globale

**Recommandé:** Utiliser la checklist de validation rapide pour faire un premier pass, puis créer des stories détaillées pour les éléments à améliorer.

---

## Notes

Ce sprint est atypique car le projet existe déjà en grande partie. L'objectif principal est :
1. **Valider** que tout fonctionne comme attendu
2. **Documenter** les éléments manquants (MCP, workflow)
3. **Compléter** les fonctionnalités partielles (hooks, options install)

Une fois ce sprint terminé, le projet sera complet et documenté selon les specs du PRD.

---

**This plan was created using BMAD Method v6 - Phase 4 (Implementation Planning)**

*To continue: Run `/dev-story STORY-XXX` to implement a specific story, or use the validation checklist above.*
