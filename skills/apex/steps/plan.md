# Étape 2: PLAN

## Objectif
Créer un plan d'implémentation détaillé et actionnable.

## Actions

### 2.1 Découpage en tâches
Décompose l'implémentation en tâches atomiques :
- Chaque tâche = un changement cohérent et testable
- Ordre logique des dépendances
- Estimation de complexité (S/M/L)

### 2.2 Définition des critères de succès
Pour chaque tâche, définir :
- Ce qui doit fonctionner
- Comment le vérifier

### 2.3 Plan de rollback
- Comment annuler si problème ?
- Quels fichiers sauvegarder ?

## Output attendu

```
## Plan d'implémentation

### Tâches

1. **[Titre tâche 1]** (S)
   - Description: [...]
   - Fichiers: `file1.ts`, `file2.ts`
   - Critère: [comment vérifier que c'est fait]

2. **[Titre tâche 2]** (M)
   - Description: [...]
   - Fichiers: `file3.ts`
   - Dépend de: Tâche 1
   - Critère: [...]

3. **[Titre tâche 3]** (L)
   - Description: [...]
   - Fichiers: `file4.ts`, `file5.ts`
   - Dépend de: Tâche 2
   - Critère: [...]

### Ordre d'exécution
1 → 2 → 3

### Rollback
- Fichiers modifiés peuvent être restaurés via git
```

## Confirmation

**Si mode auto (-a) activé :** Passe directement à l'exécution.

**Sinon :** Demande à l'utilisateur :
> "Plan prêt. Voulez-vous que je procède à l'implémentation ? (oui/non/modifier)"

## Next Step

Une fois le plan validé, lis `~/cc-config/skills/apex/steps/execute.md`
