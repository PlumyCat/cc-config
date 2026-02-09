---
name: feature-new
description: Démarre une nouvelle feature avec branche Git, story structurée, guardrails et Ralph loop
disable-model-invocation: true
argument-hint: "<nom_feature> [description]"
---

# Nouvelle Feature Structurée

Workflow complet pour développer une feature de manière efficace et contrôlée.

## Flux

```
1. Créer branche feature/<nom> depuis main
2. Créer FEATURE-<nom>.md avec spec et guardrails
3. Review humain → validation
4. Ralph loop jusqu'aux tests verts
5. /update-tracking → mise à jour suivi
6. Commit + merge main
```

## Étape 1 : Créer la branche Git

**OBLIGATOIRE** - Créer une branche dédiée depuis main :

```bash
# S'assurer d'être à jour
git fetch origin
git checkout main
git pull origin main

# Créer et basculer sur la branche feature
git checkout -b feature/<nom>
```

Confirmer à l'utilisateur :
```
✓ Branche feature/<nom> créée depuis main
```

## Étape 2 : Créer la Story

Créer le fichier `.claude/features/FEATURE-$ARGUMENTS.md` avec ce template :

```markdown
# Feature: <nom>

> Créée le: <date>
> Status: draft | validated | in_progress | done
> Branche: feature/<nom>

## Objectif

<Description claire et concise de ce qu'on veut accomplir>

## Contexte technique

- Projet: Be-Cloud-IA
- Resource Group: rg-becloud-ia (NE PAS EN CRÉER D'AUTRE)
- Région: westeurope (NE PAS CHANGER)
- Branche: feature/<nom>

## Scope exact (UNIQUEMENT ces fichiers/actions)

- [ ] Fichier 1 à créer/modifier
- [ ] Fichier 2 à créer/modifier
- [ ] ...

## Critères d'acceptance

- [ ] Critère 1 vérifiable
- [ ] Critère 2 vérifiable
- [ ] Tests passent
- [ ] Pas d'erreur dans les logs

## Tests à effectuer

### Tests automatiques
- [ ] pytest / unittest
- [ ] Linter (ruff)

### Tests manuels (chrome-gui)
- [ ] Test interaction 1
- [ ] Test interaction 2

## Guardrails (INTERDIT)

- NE PAS créer de resource group (utiliser rg-becloud-ia)
- NE PAS changer de région Azure
- NE PAS modifier l'infrastructure existante sauf si explicitement listé
- NE PAS supprimer de données
- NE PAS modifier les fichiers hors scope

## Completion Promise

Quand TOUS les critères sont verts, output:
<promise>FEATURE COMPLETE</promise>

## Historique des itérations

| # | Date | Action | Résultat |
|---|------|--------|----------|
| 1 | | | |
```

## Étape 3 : Validation humaine

Demander à l'utilisateur de valider :
- Le scope est-il correct ?
- Les guardrails sont-ils suffisants ?
- Les critères sont-ils testables ?

Passer le status à `validated` après accord.

## Étape 4 : Implémentation avec Ralph Loop

Une fois validé, proposer de lancer :

```
/ralph-loop "Implémente la feature décrite dans .claude/features/FEATURE-<nom>.md.
Respecte STRICTEMENT les guardrails.
Teste avec chrome-gui pour les interactions web.
Output <promise>FEATURE COMPLETE</promise> quand tous les critères sont verts."
--max-iterations 20
--completion-promise "FEATURE COMPLETE"
```

**Pendant le développement** : Rappeler régulièrement `/update-tracking-light` pour maintenir le suivi à jour.

## Étape 5 : Finalisation et Merge

Quand Ralph termine (ou manuellement quand tout est OK) :

1. **Mettre à jour le tracking complet** (OBLIGATOIRE avant merge) :
   ```
   /update-tracking
   ```

2. **Commit final** :
   ```bash
   git add -A
   git commit -m "feat(<nom>): <description courte>

   - Critère 1 implémenté
   - Critère 2 implémenté
   - Tests passent"
   ```

3. **Merge sur main** :
   ```bash
   git checkout main
   git pull origin main
   git merge feature/<nom> --no-ff -m "Merge feature/<nom>: <description>"
   git push origin main
   ```

4. **Nettoyer** :
   ```bash
   git branch -d feature/<nom>
   # Archiver la feature story
   mv .claude/features/FEATURE-<nom>.md .claude/features/archive/
   ```

5. **Mettre à jour le status** → `done`

## Commandes associées

- `/feature-resume <nom>` : Reprendre une feature en cours
- `/cancel-ralph` : Annuler le loop en cours
- `/update-tracking` : Mettre à jour les fichiers de suivi
