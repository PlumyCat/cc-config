---
name: feature-resume
description: Reprend une feature en cours depuis son fichier FEATURE-*.md et sa branche Git
disable-model-invocation: true
argument-hint: "<nom_feature>"
---

# Reprendre une Feature

Reprend le travail sur une feature existante avec sa branche Git.

## Étape 1 : Charger le contexte

1. **Vérifier/basculer sur la branche** :
   ```bash
   # Vérifier si la branche existe
   git branch -a | grep "feature/$ARGUMENTS"

   # Basculer sur la branche
   git checkout feature/$ARGUMENTS

   # Mettre à jour depuis origin si elle existe en remote
   git pull origin feature/$ARGUMENTS 2>/dev/null || echo "Branche locale uniquement"
   ```

2. **Lire le fichier** `.claude/features/FEATURE-$ARGUMENTS.md`

Si le fichier n'existe pas, lister les features disponibles :
```bash
echo "Features disponibles:"
ls .claude/features/FEATURE-*.md 2>/dev/null || echo "  Aucune feature en cours"
echo ""
echo "Branches feature:"
git branch -a | grep feature/ || echo "  Aucune branche feature"
```

## Étape 2 : Analyser l'état

Afficher un résumé :

```
## Feature: <nom>
Status: <status>
Branche: feature/<nom> (✓ active | ⚠️ pas sur cette branche)

### Critères d'acceptance
- [x] Critère 1 ✓
- [ ] Critère 2 (en cours)
- [ ] Critère 3

### Dernière itération
#<n> - <date> - <action> - <résultat>

### Git status
<résumé des fichiers modifiés/non commités>

### Prochaine action recommandée
<suggestion basée sur l'état>
```

## Étape 3 : Options

Proposer à l'utilisateur :

1. **Continuer avec Ralph Loop**
   ```
   /ralph-loop "Continue la feature FEATURE-<nom>.md.
   Critères restants: <liste>.
   Guardrails: <rappel>.
   <promise>FEATURE COMPLETE</promise> quand terminé."
   --max-iterations 15
   ```

2. **Travail manuel** - Continuer sans Ralph loop

3. **Modifier la spec** - Ajuster les critères ou guardrails

4. **Finaliser et Merge** - Si tous les critères sont verts

5. **Abandonner** - Marquer comme abandonné avec raison

## Étape 4 : Mise à jour continue

Après chaque session de travail :
- Mettre à jour l'historique des itérations
- Cocher les critères validés
- Sauvegarder l'état

**Rappeler régulièrement** : `/update-tracking-light` pour maintenir le suivi à jour.

## Étape 5 : Finalisation (si tous critères OK)

Quand l'utilisateur choisit "Finaliser et Merge" :

1. **Vérifier que tous les critères sont verts**

2. **Mettre à jour le tracking complet** (OBLIGATOIRE avant merge) :
   ```
   /update-tracking
   ```

3. **Commit final** (si changements non commités) :
   ```bash
   git add -A
   git commit -m "feat(<nom>): finalisation

   Tous les critères d'acceptance validés."
   ```

4. **Merge sur main** :
   ```bash
   git checkout main
   git pull origin main
   git merge feature/<nom> --no-ff -m "Merge feature/<nom>: <description>"
   git push origin main
   ```

5. **Nettoyer** :
   ```bash
   git branch -d feature/<nom>
   mkdir -p .claude/features/archive
   mv .claude/features/FEATURE-<nom>.md .claude/features/archive/
   git add .claude/features/
   git commit -m "chore: archive FEATURE-<nom>"
   git push origin main
   ```

6. Confirmer :
   ```
   ✓ Feature <nom> mergée sur main
   ✓ Branche feature/<nom> supprimée
   ✓ Story archivée dans .claude/features/archive/
   ```

## Gestion des blocages

Si la feature est bloquée depuis plusieurs itérations :

1. Analyser les logs des dernières itérations
2. Identifier le pattern d'échec
3. Proposer :
   - Simplifier le scope
   - Ajouter des guardrails
   - Découper en sous-features
   - Escalader à l'humain pour décision

## Structure du dossier features

```
.claude/features/
├── FEATURE-oauth-login.md      # En cours (branche: feature/oauth-login)
├── FEATURE-bot-telephonie.md   # En cours (branche: feature/bot-telephonie)
└── archive/
    └── FEATURE-old.md          # Terminées/abandonnées (mergées)
```
