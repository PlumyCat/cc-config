# Étape 4: VALIDATE

## Objectif
Vérifier que l'implémentation fonctionne et ne casse rien.

## Actions

### 4.1 Vérification syntaxique
- Le code compile sans erreurs
- Pas d'erreurs TypeScript/ESLint
- Exécute `npm run build` ou équivalent si disponible

### 4.2 Vérification fonctionnelle
- Les critères de succès définis dans le plan sont remplis
- Les cas d'usage principaux fonctionnent
- Pas de régression évidente

### 4.3 Review rapide
- Relire les fichiers modifiés
- Vérifier qu'il n'y a pas de code oublié (TODO, FIXME, debug)
- S'assurer que les imports sont corrects

## Commandes de validation

```bash
# TypeScript check
npx tsc --noEmit

# ESLint
npm run lint

# Build
npm run build
```

## Output attendu

```
## Validation

### Build/Compile
- [ ] ✅ Compilation OK / ❌ Erreurs (lister)

### Lint
- [ ] ✅ Pas d'erreurs / ⚠️ Warnings (lister)

### Critères de succès
- [ ] Critère 1: ✅/❌
- [ ] Critère 2: ✅/❌
- [ ] Critère 3: ✅/❌

### Statut global: ✅ VALIDÉ / ❌ ÉCHEC
```

## En cas d'échec

Si la validation échoue :
1. Identifier la cause
2. Corriger le problème
3. Re-valider

## Next Step

- Si flag `-t` activé : lis `~/cc-config/skills/apex/steps/test.md`
- Si flag `-x` activé : lis `~/cc-config/skills/apex/steps/examine.md`
- Si flag `-pr` activé : lis `~/cc-config/skills/apex/steps/pr.md`
- Sinon : Workflow terminé, affiche le résumé final
