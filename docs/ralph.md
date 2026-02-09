# Ralph - Guide d'utilisation

> Systeme d'orchestration de taches autonome pour Claude Code

## Qu'est-ce que c'est ?

Ralph est un ecosysteme compose de 3 outils complementaires pour automatiser l'implementation de features :

1. **ralph-tui-prd** (skill) : Genere un PRD optimise pour l'execution par agents IA
2. **ralph-tui-create-json** (skill) : Convertit le PRD en prd.json executable
3. **ralph-loop** (plugin) : Boucle autonome qui execute les taches une par une

Le pipeline complet va de la spec a l'implementation autonome.

## Architecture

```
  /ralph-tui-prd          /ralph-tui-create-json        /ralph-loop
  +--------------+        +------------------+          +---------------+
  | Questions    |        | Parse PRD .md    |          | Pick task     |
  | iteratives   | -----> | Extract stories  | -------> | Execute       |
  | PRD .md      |        | Quality gates    |          | Validate      |
  +--------------+        | prd.json         |          | Commit        |
                          +------------------+          | Reset context |
                                                        | Repeat        |
                                                        +---------------+
```

## Etape 1 : Generer le PRD

```
/ralph-tui-prd
```

Le skill pose des questions iteratives avec options A/B/C/D pour definir la feature.

**Deroulement :**
1. 3-5 questions clarifiantes (probleme, fonctionnalite, scope, succes)
2. Question obligatoire sur les **quality gates** (commandes qui doivent passer)
3. 2-4 rounds adaptatifs selon les reponses
4. Generation du PRD complet

**Sections generees :**
- Overview et Goals
- Quality Gates (commandes obligatoires)
- User Stories avec acceptance criteria
- Functional Requirements (numerotes FR-1, FR-2...)
- Non-Goals (hors scope)
- Technical Considerations
- Success Metrics
- Open Questions

**Output :** Fichier Markdown dans `./tasks/prd-[feature-name].md`, entoure de marqueurs `[PRD]...[/PRD]`

**Exemple rapide :**
```
User: /ralph-tui-prd

Claude: Quelques questions...
  1. Quel est le but principal ?
     A. Ameliorer l'onboarding  B. Retention  C. Reduire le support  D. Autre
  2. Qui est l'utilisateur cible ?
     A. Nouveaux users  B. Existants  C. Tous  D. Admins

User: 1A, 2C

Claude: [genere le PRD complet]
```

## Etape 2 : Convertir en prd.json

```
/ralph-tui-create-json
```

Le skill parse le PRD Markdown et produit un fichier JSON executable par ralph-tui.

**Ce qu'il fait :**
1. Extrait les quality gates du PRD
2. Parse chaque user story
3. Ajoute les quality gates aux acceptance criteria de chaque story
4. Configure les dependances entre stories
5. Genere le JSON

**Format du prd.json :**
```json
{
  "name": "Task Priority System",
  "branchName": "ralph/task-priority",
  "description": "Add priority levels to tasks",
  "userStories": [
    {
      "id": "US-001",
      "title": "Add priority field to database",
      "description": "As a developer, I need to store task priority.",
      "acceptanceCriteria": [
        "Add priority column: 1-4 (default 2)",
        "Migration runs successfully",
        "pnpm typecheck passes",
        "pnpm lint passes"
      ],
      "priority": 1,
      "passes": false,
      "notes": "",
      "dependsOn": []
    },
    {
      "id": "US-002",
      "title": "Display priority badge",
      "description": "As a user, I want to see task priority.",
      "acceptanceCriteria": [
        "Badge shows P1/P2/P3/P4 with colors",
        "pnpm typecheck passes",
        "pnpm lint passes",
        "Verify in browser using dev-browser skill"
      ],
      "priority": 2,
      "passes": false,
      "notes": "",
      "dependsOn": ["US-001"]
    }
  ]
}
```

**Regles critiques du schema :**
- Structure PLATE a la racine (pas de wrapper `"prd": {...}`)
- Tableau `"userStories"` (pas `"tasks"`)
- Champ `"passes": false` (pas `"status": "open"`)
- Quality gates ajoutees a chaque story
- Stories UI : ajout de la verification browser si specifiee

**Output :** `./tasks/prd.json`

### Taille des stories

Regle n1 : **chaque story doit etre completable en UNE iteration ralph-tui** (un contexte agent).

**Bonne taille :**
- Ajouter une colonne DB + migration
- Ajouter un composant UI a une page existante
- Mettre a jour une server action

**Trop gros (a decouper) :**
- "Build the entire dashboard" → schema, queries, UI, filters
- "Add authentication" → schema, middleware, login UI, sessions

**Regle : si tu ne peux pas decrire le changement en 2-3 phrases, c'est trop gros.**

### Ordre des dependances

```
1. Schema/database (pas de dependances)
2. Backend logic (depend du schema)
3. UI components (depend du backend)
4. Integration/polish (depend de l'UI)
```

## Etape 3 : Executer avec ralph-loop

### Demarrage

```
/ralph-loop
```

Ou directement avec ralph-tui CLI :

```bash
ralph-tui run --prd ./tasks/prd.json
```

### Fonctionnement de la boucle

Ralph-loop execute une boucle autonome :

```
1. Charger prd.json
2. Selectionner la story prioritaire (passes: false, pas bloquee)
3. Generer un prompt avec les details + acceptance criteria
4. Spawner un agent frais pour implementer
5. Valider les acceptance criteria
6. Marquer passes: true si OK
7. Commit les changements
8. Reset le contexte (nouveau agent frais)
9. Repeter jusqu'a ce que toutes les stories passent
```

**Point cle :** Chaque tache = **nouvelle instance Claude** avec un contexte frais. Pas de memoire entre les taches. La memoire est dans les fichiers : `prd.json` (statut des stories) et `progress.txt` (historique).

### Commandes ralph-loop

| Commande | Description |
|----------|-------------|
| `/ralph-loop:ralph-loop` | Demarrer la boucle |
| `/ralph-loop:cancel-ralph` | Annuler la boucle en cours |
| `/ralph-loop:help` | Aide et commandes disponibles |

### Integration avec add-feature

Ralph-loop peut aussi etre utilise via le workflow `/add-feature` :

```
/ralph-loop "Implemente la feature decrite dans FEATURE-<nom>.md.
Respecte STRICTEMENT les guardrails.
<promise>FEATURE COMPLETE</promise> quand tous les criteres sont verts."
--max-iterations 10
```

## Configuration

Le plugin ralph-loop est active dans `settings.json` :

```json
{
  "enabledPlugins": {
    "ralph-loop@claude-plugins-official": true
  }
}
```

## Workflow complet exemple

```bash
# 1. Generer le PRD
/ralph-tui-prd
# -> Repondre aux questions iteratives
# -> Output: ./tasks/prd-task-priority.md

# 2. Convertir en JSON
/ralph-tui-create-json
# -> Output: ./tasks/prd.json

# 3. Lancer l'execution autonome
/ralph-loop
# -> Ralph execute chaque story automatiquement
# -> Commit apres chaque story
# -> S'arrete quand tout est passe
```

## Quand utiliser Ralph ?

| Situation | Recommendation |
|-----------|---------------|
| Feature bien definie, multi-stories | Ralph complet (PRD + JSON + loop) |
| Feature deja specifiee (PRD existant) | JSON + loop |
| Tache unique simple | Pas besoin de Ralph |
| Exploration / prototypage | Pas besoin de Ralph |
| Feature complexe necessitant coordination | Combiner avec Agent Teams |

## Ralph vs Apex vs BMAD

| | Ralph | Apex | BMAD |
|---|---|---|---|
| **Focus** | Execution autonome | Implementation guidee | Methodologie projet |
| **Autonomie** | Totale (boucle auto) | Semi-auto (flags) | Interactive |
| **Contexte** | Frais a chaque tache | Continu | Continu par phase |
| **Spec** | PRD + JSON | Description inline | PRD/Tech-spec formels |
| **Duree** | Minutes-heures (auto) | Minutes-heures (guide) | Jours-semaines |
| **Usage** | Features multi-stories | Feature unique | Projet entier |

## Ressources

- [Ralph Loop plugin](https://github.com/anthropics/claude-code-plugins) (officiel Anthropic)
- Plugin active via `settings.json` > `enabledPlugins`
- Skills globales ralph-tui-prd et ralph-tui-create-json dans `~/.claude/skills/`
