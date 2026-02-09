# BMAD Method v6 - Guide d'utilisation

> **B**reakthrough **M**ethod of **A**gile AI-**D**riven Development

## Qu'est-ce que c'est ?

BMAD est une methodologie structuree en 4 phases pour developper des projets avec des agents IA. Elle fournit 9 agents specialises et 15+ commandes couvrant tout le cycle de vie, de l'analyse a l'implementation.

**Source :** [BMAD Method repo](https://github.com/bmadcode/BMAD-METHOD) par BMad Code

## Les 4 phases

```
Phase 1          Phase 2          Phase 3           Phase 4
ANALYSIS    →    PLANNING    →    SOLUTIONING  →    IMPLEMENTATION
(optionnel)      (requis)         (conditionnel)    (requis)

Analyst          PM               Architect         Scrum Master
Creative Intel.  UX Designer                        Developer
```

### Phase 1 : Analysis (optionnelle)

Comprendre le probleme avant de solutionner.

| Commande | Agent | Description |
|----------|-------|-------------|
| `/bmad:product-brief` | Business Analyst | Decouverte produit, interview structuree |
| `/bmad:brainstorm` | Creative Intelligence | Session de brainstorming (5 Whys, SCAMPER, Six Hats) |
| `/bmad:research` | Creative Intelligence | Recherche marche et concurrentielle |

### Phase 2 : Planning (requise)

Definir les exigences et priorites.

| Commande | Agent | Description |
|----------|-------|-------------|
| `/bmad:prd` | Product Manager | PRD complet (Level 2+) avec FRs, NFRs, epics |
| `/bmad:tech-spec` | Product Manager | Spec technique legere (Level 0-1) |
| `/bmad:create-ux-design` | UX Designer | Design UX, wireframes, accessibilite |

### Phase 3 : Solutioning (conditionnel, Level 2+)

Designer l'architecture technique.

| Commande | Agent | Description |
|----------|-------|-------------|
| `/bmad:architecture` | System Architect | Architecture systeme complete |
| `/bmad:solutioning-gate-check` | System Architect | Valider l'architecture vs exigences |

### Phase 4 : Implementation (requise)

Planifier les sprints et coder.

| Commande | Agent | Description |
|----------|-------|-------------|
| `/bmad:sprint-planning` | Scrum Master | Planification des sprints |
| `/bmad:create-story` | Scrum Master | Creer une user story detaillee |
| `/bmad:dev-story` | Developer | Implementer une story end-to-end |

### Commandes transverses

| Commande | Description |
|----------|-------------|
| `/bmad:workflow-init` | Initialiser BMAD dans le projet |
| `/bmad:workflow-status` | Voir le statut et la prochaine etape |
| `/bmad:create-agent` | Creer un agent personnalise (Builder) |
| `/bmad:create-workflow` | Creer un workflow personnalise (Builder) |

## Niveaux de projet

BMAD adapte la profondeur du process selon la complexite :

| Level | Description | Stories | Phases requises |
|-------|-------------|---------|-----------------|
| **0** | Changement atomique | 1 | Planning + Implementation |
| **1** | Petite feature | 1-10 | Planning + Implementation |
| **2** | Feature set moyen | 5-15 | Planning + Solutioning + Implementation |
| **3** | Integration complexe | 12-40 | Toutes |
| **4** | Expansion enterprise | 40+ | Toutes |

## Demarrage rapide

### 1. Initialiser BMAD dans un projet

```
/bmad:workflow-init
```

Cree la structure :
```
bmad/
├── config.yaml           # Configuration projet (nom, type, level)
└── agent-overrides/      # Surcharges d'agents (optionnel)

docs/
├── bmm-workflow-status.yaml  # Suivi des phases
└── stories/                  # User stories
```

### 2. Verifier le statut

```
/bmad:workflow-status
```

Affiche :
```
Project: MyApp (Web Application, Level 2)
Phase: 1 - Analysis

→ Phase 1: Analysis [CURRENT]
  ⚠ product-brief (recommended - NOT STARTED)

Phase 2: Planning
  - prd (required)

Phase 3: Solutioning
  - architecture (required)

Recommended next step: /bmad:product-brief
```

### 3. Suivre le workflow recommande

BMAD recommande toujours la prochaine etape en fonction du statut.

## Les 9 agents

### BMad Master (orchestrateur)
- Point d'entree, routing vers les workflows
- Suit le statut des phases
- Recommande la prochaine etape

### Business Analyst (Phase 1)
- Decouverte produit et probleme
- Interview structuree (5 Whys, Jobs-to-be-Done, SMART)
- Cree le product brief

### Creative Intelligence (Phase 1)
- Brainstorming structure (SCAMPER, Six Thinking Hats, Mind Mapping)
- Recherche marche, competitive, technique et utilisateur
- SWOT Analysis

### Product Manager (Phase 2)
- Cree les PRD et tech specs
- Definit FRs et NFRs
- Priorise avec MoSCoW, RICE ou Kano
- Decoupe en epics et stories

### UX Designer (Phase 2-3)
- Design d'experience utilisateur
- Wireframes textuels
- Checklist accessibilite (WCAG)
- Systemes de couleurs, typographie, responsive

### System Architect (Phase 3)
- Architecture systeme (monolith, microservices, serverless)
- Selection tech stack avec justification
- Modeles de donnees et APIs
- Couverture systematique des NFRs
- Trade-offs documentes

### Scrum Master (Phase 4)
- Decoupe epics en stories (Fibonacci: 1-13 points)
- Planification des sprints
- Suivi de velocite
- Si story > 8 points → la decouper

### Developer (Phase 4)
- Implementation des stories
- TDD quand pertinent
- Couverture tests >= 80%
- Commits atomiques

### Builder (meta)
- Cree des agents et workflows personnalises
- Customise BMAD pour un domaine (QA, DevOps, Data Science, Security)

## Estimation des stories

| Points | Complexite | Duree | Exemple |
|--------|-----------|-------|---------|
| 1 | Trivial | 1-2h | Config, texte |
| 2 | Simple | 2-4h | CRUD basique |
| 3 | Modere | 4-8h | Composant complexe |
| 5 | Complexe | 1-2j | Feature multi-composants |
| 8 | Tres complexe | 2-3j | Feature frontend + backend |
| 13 | Trop gros | 3-5j | A decouper |

## Fichiers generes

| Document | Chemin | Phase |
|----------|--------|-------|
| Config projet | `bmad/config.yaml` | Init |
| Statut workflow | `docs/bmm-workflow-status.yaml` | Init |
| Product Brief | `docs/product-brief-{name}-{date}.md` | 1 |
| PRD | `docs/prd-{name}-{date}.md` | 2 |
| Tech Spec | `docs/tech-spec-{name}-{date}.md` | 2 |
| Architecture | `docs/architecture-{name}-{date}.md` | 3 |
| Sprint Plan | `docs/sprint-plan-{name}-{date}.md` | 4 |
| Stories | `docs/stories/STORY-{NNN}.md` | 4 |

## Workflow typique (Level 2)

```
1. /bmad:workflow-init          → Initialise le projet (Level 2)
2. /bmad:product-brief          → Decouverte produit (Phase 1)
3. /bmad:prd                    → Requirements detailles (Phase 2)
4. /bmad:architecture           → Architecture systeme (Phase 3)
5. /bmad:solutioning-gate-check → Valider archi vs requirements
6. /bmad:sprint-planning        → Planifier les sprints (Phase 4)
7. /bmad:dev-story STORY-001    → Implementer story par story
```

## Quand utiliser BMAD ?

| Situation | Recommendation |
|-----------|---------------|
| Fix rapide, bug simple | Pas besoin de BMAD |
| Feature unique bien definie | BMAD Level 0-1 (tech-spec → dev) |
| Feature set moyen | BMAD Level 2 (full pipeline) |
| Projet complexe multi-equipe | BMAD Level 3-4 |
| Prototypage rapide | Pas besoin de BMAD (utiliser Apex) |

## BMAD vs Apex

| | BMAD | Apex |
|---|---|---|
| **Scope** | Projet entier, multi-phases | Une feature a la fois |
| **Agents** | 9 agents specialises | 3 agents review (examine) |
| **Duree** | Jours/semaines | Minutes/heures |
| **Structure** | Phases avec gates | Pipeline lineaire |
| **Tracking** | workflow-status.yaml | Pas de tracking persistant |
| **Usage** | Projets structures | Implementation rapide |

## Ressources

- [BMAD Method GitHub](https://github.com/bmadcode/BMAD-METHOD)
- [BMAD Skills GitHub](https://github.com/bmadcode/BMAD-METHOD-SKILLS)
- [Video BMad Code](https://www.youtube.com/@bmadcode)
