# Apprendre Obsidian + Codex + NotebookLM

Objectif : utiliser Obsidian comme base de connaissance vivante, Codex comme copilote de lecture/ecriture/action, et NotebookLM comme coach de revision.

Ce guide est fait pour etre suivi progressivement. Il ne cherche pas a tout automatiser tout de suite : il installe d'abord les bons reflexes, puis ajoute les accelerateurs.

---

## Le systeme en une phrase

- **Obsidian** garde la memoire longue : notes, decisions, sources, liens, retrospectives.
- **Codex** transforme cette memoire en action : synthese, extraction, plans, code, scripts, documentation.
- **NotebookLM** transforme les sources en apprentissage : guide d'etude, quiz, flashcards, questions, audio overview.

Le bon usage n'est pas "tout mettre dans un outil". Le bon usage est :

1. Capturer dans Obsidian.
2. Structurer avec Codex.
3. Reviser et interroger avec NotebookLM.
4. Reinjecter les apprentissages utiles dans Obsidian.

---

## Architecture recommandee

### Dossiers

```text
~/projects/memories/
├── veille-rd/
│   ├── wiki/
│   ├── .raw/
│   └── notes/
├── projet-client-a/
│   ├── wiki/
│   ├── .raw/
│   └── notes/
└── perso-learning/
    ├── wiki/
    ├── .raw/
    └── notes/
```

### Roles des dossiers

| Dossier | Usage |
|---------|-------|
| `.raw/` | Sources brutes : PDF, transcripts, articles, exports, comptes rendus |
| `wiki/` | Memoire structuree : index, hot context, concepts, decisions |
| `notes/` | Notes rapides, apprentissage, journal de bord |

Regle simple : les sources brutes entrent dans `.raw/`, les connaissances consolidees vivent dans `wiki/`, les reflexions personnelles restent dans `notes/`.

---

## Les 5 habitudes a installer

### 1. Demarrer par le contexte chaud

Au debut d'une session Codex sur un projet :

```text
Lis le contexte Obsidian du projet, en commencant par wiki/hot.md, puis propose-moi les 5 points a garder en tete pour cette session.
```

But : eviter de redemander a Codex de reconstruire le contexte depuis zero.

### 2. Capturer sans trier trop tot

Quand tu trouves une source utile, ne cherche pas tout de suite la note parfaite.

Mets-la dans :

```text
<vault>/.raw/
```

Puis demande :

```text
Ingere cette source dans le wiki Obsidian. Cree les pages necessaires, relie les concepts, ajoute les decisions et mets a jour hot.md.
```

### 3. Faire des notes de decision

Chaque decision importante doit laisser une trace courte.

Format conseille :

```markdown
# Decision - <sujet>

Date: YYYY-MM-DD
Statut: proposee | acceptee | remplacee

## Contexte

## Decision

## Raisons

## Consequences

## Liens
```

Prompt utile :

```text
Transforme notre discussion en note de decision Obsidian concise, avec contexte, decision, raisons, consequences et liens vers les concepts existants.
```

### 4. Finir par une consolidation

En fin de session :

```text
Resume ce que nous avons appris ou decide aujourd'hui. Propose les notes Obsidian a creer ou mettre a jour, puis mets a jour wiki/hot.md.
```

### 5. Reviser avec NotebookLM

Chaque semaine, envoie les meilleures sources et notes consolidees dans NotebookLM, puis demande :

```text
Genere un guide d'etude progressif pour comprendre ce sujet, avec les concepts cles, les erreurs frequentes, des questions de revision et des exercices pratiques.
```

---

## Parcours d'apprentissage sur 30 jours

### Semaine 1 - Prendre le reflexe Obsidian

Objectif : capturer et retrouver.

Chaque jour :

1. Ajouter au moins une note dans Obsidian.
2. Relier cette note a une note existante.
3. Ajouter 3 tags maximum.
4. Demander a Codex de resumer la note en 5 lignes.

Exercice de fin de semaine :

```text
Analyse mon vault Obsidian de la semaine. Repere les notes orphelines, les themes recurrents et les 5 concepts qui meritent une page dediee.
```

### Semaine 2 - Structurer avec Codex

Objectif : transformer des notes en systeme.

Chaque jour :

1. Prendre une source brute.
2. Demander a Codex d'en extraire concepts, decisions, actions.
3. Creer ou enrichir les pages du wiki.
4. Mettre a jour `hot.md`.

Prompt :

```text
Lis cette source comme un knowledge manager. Extrais :
- concepts
- entites
- decisions
- questions ouvertes
- actions
- liens Obsidian suggeres
Puis propose les fichiers markdown a creer ou modifier.
```

### Semaine 3 - Apprendre avec NotebookLM

Objectif : reviser activement.

Chaque jour :

1. Ajouter 2 a 5 notes/sources dans un notebook NotebookLM.
2. Poser une question de comprehension.
3. Demander un quiz.
4. Corriger les lacunes dans Obsidian.

Prompts :

```text
Explique-moi ce sujet comme si je devais l'appliquer demain sur un vrai projet.
```

```text
Pose-moi 10 questions progressives. Attends mes reponses, puis corrige-moi sans indulgence mais avec pedagogie.
```

```text
Liste les points que je crois probablement comprendre mais que je risque de mal appliquer.
```

### Semaine 4 - Boucle complete

Objectif : faire tourner le systeme complet.

Routine :

1. Source dans `.raw/`.
2. Ingestion dans Obsidian avec Codex.
3. Consolidation dans `wiki/`.
4. Import dans NotebookLM.
5. Quiz ou guide d'etude.
6. Retour des apprentissages dans Obsidian.

Exercice final :

```text
A partir de mon vault et du notebook NotebookLM, cree une roadmap d'apprentissage sur 90 jours avec :
- themes
- competences a acquerir
- exercices pratiques
- criteres de validation
- sources a revoir
```

---

## Workflows concrets

### Lire une documentation technique

1. Mettre la doc dans `.raw/`.
2. Demander a Codex :

```text
Lis cette doc et cree une fiche Obsidian orientee application pratique : ce que je dois retenir, comment l'utiliser, pieges, exemples, liens vers mes projets.
```

3. Ajouter la fiche dans NotebookLM.
4. Demander :

```text
Prepare-moi un quiz de validation pour verifier que je peux utiliser cette doc sans la relire.
```

### Preparer un projet client

Dans Obsidian :

```text
projet-client/
├── wiki/
│   ├── hot.md
│   ├── decisions/
│   ├── contraintes/
│   ├── architecture/
│   └── risques/
└── .raw/
```

Avec Codex :

```text
A partir des notes du vault, cree un brief projet : contexte, objectifs, contraintes, risques, architecture probable et prochaines actions.
```

Avec NotebookLM :

```text
Transforme ces sources en briefing de prise de poste. Je veux comprendre rapidement ce qui compte, ce qui peut casser, et les questions a poser au client.
```

### Faire de la veille

Rythme conseille :

- Capture quotidienne rapide dans `.raw/`.
- Consolidation 2 fois par semaine.
- Synthese NotebookLM chaque vendredi.
- Une note Obsidian "ce que je change dans ma pratique".

Prompt de synthese :

```text
Classe cette veille en trois categories :
1. a tester cette semaine
2. a surveiller
3. bruit interessant mais non prioritaire
Ajoute pour chaque item une justification concrete.
```

---

## Prompts Codex utiles

### Nettoyer une note

```text
Ameliore cette note Obsidian sans changer le fond. Clarifie la structure, ajoute des titres utiles, suggere des wikilinks et retire les repetitions.
```

### Creer une fiche concept

```text
Cree une fiche concept Obsidian sur <concept> avec definition, pourquoi c'est important, exemples, contre-exemples, liens, questions ouvertes.
```

### Trouver les trous dans le savoir

```text
Analyse ces notes et dis-moi ce qui manque pour pouvoir appliquer le sujet en conditions reelles.
```

### Transformer une conversation en memoire

```text
Transforme cette conversation en notes Obsidian durables :
- une note de synthese
- les decisions
- les actions
- les concepts a creer
- les liens a ajouter
```

---

## Prompts NotebookLM utiles

### Guide d'etude

```text
Cree un guide d'etude progressif. Commence par les fondations, puis ajoute les notions avancees. Pour chaque section, donne :
- ce qu'il faut comprendre
- pourquoi ca compte
- une erreur frequente
- un mini-exercice
```

### Flashcards

```text
Cree des flashcards en francais pour reviser ce notebook. Melange definitions, questions pratiques, pieges et exemples.
```

### Quiz pratique

```text
Cree un quiz de 15 questions, du niveau debutant au niveau expert. Donne les reponses seulement apres les questions.
```

### Simulation de mission

```text
Simule une mission reelle ou je dois appliquer ces connaissances. Donne-moi le contexte, les contraintes, les livrables attendus et les questions auxquelles je dois repondre.
```

### Anti-illusion de comprehension

```text
Repere les zones ou un lecteur pourrait croire avoir compris trop vite. Pose-moi des questions qui forcent a verifier la comprehension pratique.
```

---

## Cadence hebdomadaire recommandee

| Moment | Action |
|--------|--------|
| Lundi | Relire `wiki/hot.md`, choisir 3 objectifs d'apprentissage |
| Mardi-mercredi | Capturer sources + notes rapides |
| Jeudi | Structurer avec Codex, lier les notes, nettoyer les doublons |
| Vendredi | NotebookLM : quiz, guide d'etude, synthese |
| Fin de semaine | Ecrire une note "ce que je change dans ma pratique" |

---

## Indicateurs que le systeme fonctionne

Tu progresses si :

- tu retrouves une information en moins de 2 minutes ;
- tes notes ont plus de liens que de tags ;
- `hot.md` te remet dans le bain rapidement ;
- NotebookLM te pose des questions qui revelent des lacunes ;
- Codex peut produire un plan d'action a partir de ton vault sans beaucoup de contexte supplementaire ;
- chaque semaine produit au moins une decision, une fiche concept ou une amelioration de workflow.

---

## Pieges a eviter

| Piege | Correction |
|-------|------------|
| Tout mettre dans NotebookLM | Garder Obsidian comme source durable |
| Tout mettre dans Obsidian sans reviser | Utiliser NotebookLM pour tester la comprehension |
| Faire trop de tags | Preferer les liens entre notes |
| Demander a Codex de deviner le contexte | Lui faire lire `hot.md`, `index.md`, puis les notes ciblees |
| Accumuler des sources brutes | Planifier une consolidation chaque semaine |
| Confondre resume et apprentissage | Ajouter quiz, exercices, decisions et actions |

---

## Checklist de session

### Debut

- [ ] Le bon vault Obsidian est ouvert.
- [ ] `wiki/hot.md` est lu.
- [ ] L'objectif de la session est clair.

### Pendant

- [ ] Les nouvelles sources vont dans `.raw/`.
- [ ] Les decisions sont notees.
- [ ] Les concepts importants ont une page dediee.

### Fin

- [ ] `hot.md` est mis a jour.
- [ ] Les actions sont capturees.
- [ ] Les notes importantes sont ajoutees a NotebookLM si elles servent a apprendre.
- [ ] Une question de revision est posee.

---

## Premiere sequence a faire

1. Ouvrir le vault Obsidian principal.
2. Choisir 3 notes importantes.
3. Demander a Codex :

```text
Analyse ces 3 notes. Propose une structure de wiki, les liens manquants, les concepts a extraire et une version courte pour hot.md.
```

4. Ajouter les notes consolidees a NotebookLM.
5. Demander a NotebookLM :

```text
Cree mon parcours d'apprentissage sur ce sujet en 7 jours, avec une question de revision par jour et un exercice pratique.
```

6. A la fin des 7 jours, creer dans Obsidian :

```text
notes/retrospectives/YYYY-MM-DD-apprentissage.md
```

avec :

```markdown
# Retrospective apprentissage

## Ce que j'ai compris

## Ce que je dois pratiquer

## Ce qui reste flou

## Ce que je change dans mon workflow
```

---

## Lien avec la doc existante

Pour l'installation technique et le detail du pattern wiki, voir :

- `docs/obsidian-wiki.md`

Ce document-ci sert plutot de plan d'entrainement et de routine d'usage.
