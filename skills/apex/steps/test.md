# Étape 5: TEST (flag -t)

## Objectif
S'assurer que les tests passent et que la couverture est maintenue.

## Actions

### 5.1 Lancer les tests existants
```bash
npm test
# ou
npm run test
# ou
pytest
# ou autre selon le projet
```

### 5.2 Analyser les échecs
Pour chaque test qui échoue :
- Comprendre pourquoi
- Est-ce une régression ou un test obsolète ?
- Corriger le code OU le test selon le cas

### 5.3 Ajouter des tests si nécessaire
Si la feature n'a pas de tests :
- Écrire des tests unitaires pour les nouvelles fonctions
- Écrire des tests d'intégration si pertinent

## Boucle de correction

```
┌──────────────┐
│  Run tests   │
└──────┬───────┘
       │
       ▼
   ┌───────┐     Non
   │ Pass? │ ──────────┐
   └───┬───┘           │
       │ Oui           ▼
       │         ┌───────────┐
       │         │ Fix issue │
       │         └─────┬─────┘
       │               │
       │               └──────┐
       ▼                      │
   ┌────────┐                 │
   │  Done  │ ◄───────────────┘
   └────────┘
```

## Output attendu

```
## Tests

### Exécution initiale
- Tests passés: X/Y
- Tests échoués: Z

### Corrections effectuées
1. [Test/Fichier] - [Description correction]
2. [Test/Fichier] - [Description correction]

### Exécution finale
- Tests passés: Y/Y ✅

### Nouveaux tests ajoutés
- `test/feature.test.ts` - [description]
```

## Next Step

- Si flag `-x` activé : lis `~/cc-config/skills/apex/steps/examine.md`
- Si flag `-pr` activé : lis `~/cc-config/skills/apex/steps/pr.md`
- Sinon : Workflow terminé
