# Product Brief: cc-config

**Date:** 2025-01-16
**Author:** Eric
**Version:** 1.0
**Project Type:** Library / Configuration personnelle
**Project Level:** 2 (Medium - 5-15 stories)

---

## Executive Summary

**cc-config** est un système de gestion de configuration personnelle pour Claude Code, destiné à un développeur solo sur machine dédiée. Il permet de faire de la veille sur les nouveautés Claude Code, les tester en sécurité avec rollback possible, maintenir à jour les MCP/plugins/tools, documenter et s'auto-former, puis déployer progressivement les améliorations sur les projets en production.

---

## Problem Statement

### The Problem

Sans système structuré, maintenir son environnement Claude Code à jour devient chaotique :
- Risque de rater des fonctionnalités utiles
- Risque de casser des projets prod en testant des nouveautés directement
- Difficulté à se rappeler comment les choses fonctionnent
- Pas de processus clair pour adopter ou rejeter une nouveauté

### Why Now?

Claude Code évolue rapidement avec de nouvelles fonctionnalités, MCP servers, plugins, et méthodes de travail. Mieux vaut structurer maintenant qu'accumuler de la dette technique et rater des opportunités d'amélioration.

### Impact if Unsolved

- Perte de productivité par méconnaissance des outils disponibles
- Incidents potentiels sur projets prod lors de tests non encadrés
- Configuration qui devient obsolète et difficile à maintenir
- Temps perdu à redécouvrir des choses déjà apprises

---

## Target Audience

### Primary Users

**Eric** - Dev autodidacte "vibecoding" (formation via IA)
- Utilisation quotidienne exclusive de Claude Code
- Travaille sur des projets ambitieux (agence IA complète, projets Azure)
- Environnement : Azure/M365, Docker, Azure Functions, WebApps
- Apprend sur le tas, besoin de documentation pour mémoriser

### Secondary Users

- Potentiellement d'autres devs si la config est partagée
- Nouvelle machine si migration nécessaire

### User Needs

1. Être informé des nouveautés Claude Code rapidement
2. Pouvoir tester sans risque avec possibilité de rollback
3. Avoir une documentation claire et accessible
4. Maintenir MCP, plugins et tools à jour
5. S'auto-former à l'utilisation des nouveaux outils
6. Déployer les changements progressivement sur les projets prod

---

## Solution Overview

### Proposed Solution

Un dépôt Git structuré contenant toute la configuration Claude Code personnelle, avec des scripts utilitaires pour la veille, les tests expérimentaux, et la documentation.

### Key Features

- **Workflow experimental** : Branches de test avec validate/rollback (`experimental.sh`)
- **Système de veille** : Suivi structuré des nouveautés (`veille.sh`, `docs/veille.md`)
- **Notes rapides** : Capture d'informations à la volée (`note.sh`)
- **Documentation structurée** : Tips, usage, changelog, backlog
- **Installation portable** : Script d'installation reproductible (`install.sh`)
- **Gestion centralisée** : Settings, commands, agents, hooks, MCP

### Value Proposition

Un environnement Claude Code toujours à jour, documenté, testable en sécurité, et reproductible sur n'importe quelle machine en quelques minutes.

---

## Business Objectives

### Goals

- Réduire le temps de veille Claude Code (automatiser/structurer)
- Tester les nouveautés sans risque pour les projets prod
- Avoir une documentation toujours à jour et accessible
- Pouvoir reproduire l'environnement rapidement sur nouvelle machine

### Success Metrics

- Nombre de nouveautés testées/adoptées par mois
- Temps pour setup sur nouvelle machine < 5 minutes
- Zéro incident en prod lié à une nouveauté mal testée
- Documentation consultée et utile au quotidien

### Business Value

- Gain de productivité par maîtrise des outils
- Réduction des risques sur projets prod
- Capitalisation des connaissances (pas de perte d'information)
- Portabilité et résilience de l'environnement de travail

---

## Scope

### In Scope

- Gestion settings.json Claude Code
- Commands slash personnalisées
- Agents spécialisés
- Hooks (notifications)
- Scripts utilitaires (veille, experimental, notes)
- Documentation (tips, usage, changelog, backlog, veille)
- Workflow de test/validation/rollback
- Script d'installation portable
- Gestion MCP servers

### Out of Scope

- Gestion des projets eux-mêmes (juste la config Claude Code)
- Backup/sync automatique (Git suffit)
- Interface graphique
- Multi-utilisateurs / gestion de droits

### Future Considerations

- Sync automatique entre machines
- Partage public de la config (template pour d'autres devs)
- Dashboard de suivi des nouveautés
- Intégration avec d'autres outils (Notion, etc.)

---

## Key Stakeholders

- **Eric (Owner/User)** - Influence haute. Seul utilisateur, mainteneur et décideur du projet.

---

## Constraints and Assumptions

### Constraints

- Doit rester simple (pas d'usine à gaz)
- Compatible avec les mises à jour Claude Code
- Pas de dépendances externes lourdes
- Fonctionne sur Linux/WSL

### Assumptions

- Claude Code continue d'évoluer régulièrement
- Git disponible pour versioning
- Machine Linux/WSL avec accès internet
- Temps disponible pour la veille (même minimal)

---

## Success Criteria

- Config installable en < 5 minutes sur nouvelle machine
- Zéro régression sur projets prod après adoption d'une nouveauté
- Documentation à jour et utile au quotidien
- Veille effectuée au moins 1x/semaine
- Workflow experimental utilisé pour chaque nouveauté testée

---

## Timeline and Milestones

### Target Launch

Projet en amélioration continue - pas de date de fin. Structure de base déjà en place.

### Key Milestones

- ✅ Structure de base créée (settings, commands, agents, hooks, scripts)
- ✅ Scripts utilitaires fonctionnels (experimental.sh, veille.sh, note.sh)
- ✅ Documentation initiale en place
- 🔄 Test BMAD Method v6 (en cours)
- 📋 Enrichir la documentation au fil de l'usage
- 📋 Ajouter des commands/agents selon besoins

---

## Risks and Mitigation

| Risque | Probabilité | Impact | Mitigation |
|--------|-------------|--------|------------|
| Breaking change Claude Code | Moyenne | Haut | Workflow experimental + rollback rapide |
| Config trop complexe | Faible | Moyen | Garder simple, documenter, refactorer si besoin |
| Oubli de documenter | Moyenne | Moyen | Scripts note.sh, créer l'habitude |
| Perte de données | Faible | Haut | Git + push régulier sur remote |

---

## Next Steps

1. Continuer le test BMAD Method - `/workflow-status`
2. Créer le PRD si nécessaire - `/prd`
3. Définir l'architecture si le projet grossit - `/architecture`

---

**This document was created using BMAD Method v6 - Phase 1 (Analysis)**

*To continue: Run `/workflow-status` to see your progress and next recommended workflow.*
