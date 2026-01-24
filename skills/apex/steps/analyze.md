# Étape 1: ANALYZE

## Objectif
Comprendre le contexte, la codebase et les implications de la feature demandée.

## Actions

### 1.1 Exploration de la codebase
- Identifier les fichiers pertinents avec Glob et Grep
- Lire les fichiers clés pour comprendre l'architecture existante
- Noter les patterns et conventions utilisés

### 1.2 Analyse des dépendances
- Quels fichiers seront impactés ?
- Y a-t-il des dépendances externes nécessaires ?
- Quels tests existants pourraient être affectés ?

### 1.3 Identification des risques
- Points de complexité potentiels
- Breaking changes possibles
- Cas limites à considérer

## Output attendu

Résume ton analyse avec :

```
## Analyse complète

### Fichiers identifiés
- `path/to/file1.ts` - [raison]
- `path/to/file2.ts` - [raison]

### Architecture actuelle
[Description brève de l'architecture pertinente]

### Approche proposée
[Grandes lignes de l'implémentation]

### Risques identifiés
- [Risque 1]
- [Risque 2]

### Questions (si besoin)
- [Question pour l'utilisateur si clarification nécessaire]
```

## Next Step

Une fois l'analyse terminée, lis `~/cc-config/skills/apex/steps/plan.md`
