# Veille Claude Code

Sources d'information et suivi des nouveautés.

---

## Sources officielles

| Source | URL | Fréquence |
| ------ | --- | --------- |
| **Changelog officiel** | [docs.anthropic.com](https://docs.anthropic.com/en/docs/claude-code/changelog) | Hebdo |
| **GitHub Releases** | [github.com/anthropics](https://github.com/anthropics/claude-code/releases) | À chaque release |
| **Blog Anthropic** | [anthropic.com/news](https://www.anthropic.com/news) | Mensuel |
| **Discord Anthropic** | [discord.gg/anthropic](https://discord.gg/anthropic) | Quotidien |

## Sources communautaires

| Source | URL | Notes |
| ------ | --- | ----- |
| Reddit r/ClaudeAI | [reddit.com/r/ClaudeAI](https://reddit.com/r/ClaudeAI) | Tips communauté |
| Twitter/X | [#ClaudeCode](https://x.com/search?q=claudecode) | Annonces rapides |
| GitHub Issues | [Issues Claude Code](https://github.com/anthropics/claude-code/issues) | Bugs et features |

## Chaînes YouTube

| Chaîne | Lien | Focus |
| ------ | ---- | ----- |
| **Anthropic** | [youtube.com/@anthropic-ai](https://www.youtube.com/@anthropic-ai) | Officiel |
| **AI Explained** | [youtube.com/@aiexplained-official](https://www.youtube.com/@aiexplained-official) | News AI |
| **Matthew Berman** | [youtube.com/@matthew_berman](https://www.youtube.com/@matthew_berman) | Reviews outils AI |
| **Prompt Engineering** | [youtube.com/@PromptEngineering](https://www.youtube.com/@PromptEngineering) | Tutoriels |
| **All About AI** | [youtube.com/@AllAboutAI](https://www.youtube.com/@AllAboutAI) | Demos pratiques |
| **Alex so yes** | [youtube.com/@alexsoyes](https://www.youtube.com/@alexsoyes) | Dev & IA (FR) |
| **Melvyn X** | [youtube.com/@melvynxdev](https://www.youtube.com/@melvynxdev) | Dev & IA (FR) |
| **Benjamin Code** | [youtube.com/@BenjaminCode](https://www.youtube.com/@BenjaminCode) | Dev & IA (FR) |
| | | |

<!-- Ajoute tes chaînes préférées ici -->

---

## Nouveautés à suivre

### En attente de test

| Date       | Feature     | Source                                                                 | Priorité |
| ---------- | ----------- | ---------------------------------------------------------------------- | -------- |
|            |             |                                                                        |          |

### Testées (en experimental)

| Date | Feature | Résultat | Action |
| ---- | ------- | -------- | ------ |
|      |         |          |        |

### Adoptées

| Date       | Feature           | Notes                              |
| ---------- | ----------------- | ---------------------------------- |
| 2025-01-16 | BMAD Method v6    | 9 agents, 15 workflows - Full test |
| 2025-01-15 | Plugin ralph-loop | Activé par défaut                  |
| 2025-01-15 | Statusline custom | Via npx ccsp                       |

---

## Process de veille

### Hebdomadaire
1. Checker le changelog officiel
2. Regarder les GitHub releases
3. Parcourir Discord/Reddit
4. Voir les nouvelles vidéos YouTube

### À chaque nouveauté intéressante
1. Noter dans "En attente de test"
2. Créer branche experimental si besoin
3. Tester sur un projet non-critique
4. Valider ou abandonner
5. Mettre à jour le backlog

---

## Commande de veille rapide

```bash
# Ouvrir les sources de veille
./scripts/veille.sh

# Checker la dernière version
claude --version
npm view @anthropic-ai/claude-code version
```

---

## Notes de veille

<!-- Journal des découvertes -->

### Semaine du 2025-01-16

**Découvertes:**
- **BMAD Method v6** - Framework agile AI-driven avec 9 agents spécialisés pour Claude Code

**Testé et adopté:**
- ✅ BMAD Method installé via [claude-code-bmad-skills](https://github.com/aj-geddes/claude-code-bmad-skills)
- ✅ Workflow complet testé sur cc-config: workflow-init → product-brief → prd → architecture → sprint-planning
- ✅ Génère une documentation complète et structurée (PRD, Architecture, Sprint Plan)

---

## BMAD Method - Notes détaillées

### Qu'est-ce que BMAD ?
**BMAD** = Breakthrough Method for Agile AI-Driven Development

Framework open-source avec agents spécialisés qui guident le développement logiciel via des workflows structurés. Concept clé : "document sharding" - découper la documentation en morceaux digestibles pour l'IA.

### 9 Agents disponibles

| Agent | Rôle |
|-------|------|
| BMad Master | Orchestration & coordination |
| Business Analyst | Discovery produit & analyse marché |
| Product Manager | Documentation requirements (PRD) |
| System Architect | Design technique & validation |
| Scrum Master | Planning sprint & création stories |
| Developer | Implémentation avec tests |
| UX Designer | Flows utilisateur & accessibilité |
| Builder | Création agents/workflows custom |
| Creative Intelligence | Brainstorming & recherche |

### 15 Commandes workflow

**Phase 1 - Analyse:** `/product-brief`, `/workflow-init`, `/workflow-status`
**Phase 2 - Planning:** `/prd`, `/tech-spec`
**Phase 3 - Design:** `/architecture`, `/solutioning-gate-check`
**Phase 4 - Dev:** `/sprint-planning`, `/create-story`, `/dev-story`
**Extensibilité:** `/create-agent`, `/create-workflow`, `/brainstorm`, `/research`, `/create-ux-design`

### Ressources

| Ressource | URL |
|-----------|-----|
| Repo officiel | https://github.com/bmad-code-org/BMAD-METHOD |
| Claude Code Skills | https://github.com/aj-geddes/claude-code-bmad-skills |
| Vidéo créateur | https://www.youtube.com/watch?v=LorEJPrALcg |
| Discord | discord.gg/gk8jAdXWmj |

---
