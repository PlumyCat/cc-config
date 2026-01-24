# Étape 3: EXECUTE

## Objectif
Implémenter le plan tâche par tâche.

## Règles d'exécution

### 3.1 Une tâche à la fois
- Implémente chaque tâche dans l'ordre défini
- Vérifie le critère de succès avant de passer à la suivante
- En cas de blocage, note le problème et continue si possible

### 3.2 Qualité du code
- Respecte les conventions existantes de la codebase
- Pas de code mort ou commenté
- Pas de console.log de debug oubliés
- Noms de variables/fonctions explicites

### 3.3 Commits atomiques (optionnel)
Si pertinent, suggère des points de commit entre les tâches.

## Progression

Pour chaque tâche, affiche :

```
## Tâche N/Total: [Titre]

### Implémentation
[Description des changements effectués]

### Fichiers modifiés
- `path/file.ts` - [nature du changement]

### Statut: ✅ Complété / ⚠️ Partiel / ❌ Bloqué
[Si bloqué, expliquer pourquoi]
```

## Output final

```
## Exécution terminée

### Résumé
- Tâches complétées: X/Y
- Fichiers modifiés: Z

### Changements effectués
1. [Résumé tâche 1]
2. [Résumé tâche 2]
3. [Résumé tâche 3]

### Points d'attention
- [Si quelque chose nécessite une vérification manuelle]
```

## Next Step

Une fois l'exécution terminée, lis `~/cc-config/skills/apex/steps/validate.md`
