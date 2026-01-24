# Étape 6: EXAMINE (flag -x)

## Objectif
Review de code automatisée pour améliorer la qualité.

## Actions

### 6.1 Lancer des agents de review

Lance 3 agents en parallèle avec le Task tool (subagent_type: general-purpose) :

**Agent 1 - Security Review**
```
Revois les fichiers modifiés pour identifier :
- Vulnérabilités de sécurité (injection, XSS, etc.)
- Données sensibles exposées
- Permissions manquantes
```

**Agent 2 - Performance Review**
```
Revois les fichiers modifiés pour identifier :
- Opérations coûteuses dans des boucles
- Requêtes N+1 potentielles
- Memory leaks possibles
- Optimisations manquées
```

**Agent 3 - Code Quality Review**
```
Revois les fichiers modifiés pour identifier :
- Code dupliqué
- Fonctions trop longues
- Nommage ambigu
- Manque de gestion d'erreurs
- Patterns anti-recommandés
```

### 6.2 Consolider les retours

Collecter les issues de chaque agent et les prioriser :
- 🔴 Critique (sécurité, bugs)
- 🟡 Important (performance, maintenabilité)
- 🟢 Suggestion (style, optimisation mineure)

### 6.3 Résoudre les issues

Pour chaque issue critique ou importante :
1. Corriger le code
2. Valider la correction
3. Marquer comme résolu

## Output attendu

```
## Code Review

### Issues trouvées

#### 🔴 Critiques (X)
1. [Fichier:ligne] - [Description]
   → Résolu: [Description fix]

#### 🟡 Importantes (Y)
1. [Fichier:ligne] - [Description]
   → Résolu: [Description fix]

#### 🟢 Suggestions (Z)
1. [Fichier:ligne] - [Description]
   → [Ignoré/Résolu]: [Raison]

### Résumé
- Issues résolues: A/B
- Issues ignorées: C (avec justification)
```

## Next Step

- Si flag `-pr` activé : lis `~/cc-config/skills/apex/steps/pr.md`
- Sinon : Workflow terminé
