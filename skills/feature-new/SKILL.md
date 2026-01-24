---
name: feature-new
description: Démarre une nouvelle feature avec story structurée, guardrails et Ralph loop pour itération
disable-model-invocation: true
argument-hint: "<nom_feature> [description]"
---

# Nouvelle Feature Structurée

Workflow complet pour développer une feature de manière efficace et contrôlée.

## Flux

```
1. Créer FEATURE-<nom>.md avec spec et guardrails
2. Review humain → validation
3. Ralph loop jusqu'aux tests verts
4. Commit + PR
```

## Étape 1 : Créer la Story

Créer le fichier `.claude/features/FEATURE-$ARGUMENTS.md` avec ce template :

```markdown
# Feature: <nom>

> Créée le: <date>
> Status: draft | validated | in_progress | done

## Objectif

<Description claire et concise de ce qu'on veut accomplir>

## Contexte technique

- Projet: Be-Cloud-IA
- Resource Group: rg-becloud-ia (NE PAS EN CRÉER D'AUTRE)
- Région: westeurope (NE PAS CHANGER)

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

## Étape 2 : Validation humaine

Demander à l'utilisateur de valider :
- Le scope est-il correct ?
- Les guardrails sont-ils suffisants ?
- Les critères sont-ils testables ?

Passer le status à `validated` après accord.

## Étape 3 : Implémentation avec Ralph Loop

Une fois validé, proposer de lancer :

```
/ralph-loop "Implémente la feature décrite dans .claude/features/FEATURE-<nom>.md.
Respecte STRICTEMENT les guardrails.
Teste avec chrome-gui pour les interactions web.
Output <promise>FEATURE COMPLETE</promise> quand tous les critères sont verts."
--max-iterations 20
--completion-promise "FEATURE COMPLETE"
```

## Étape 4 : Finalisation

Quand Ralph termine :
1. Mettre à jour le status → `done`
2. Proposer le commit avec message structuré
3. Proposer la PR si sur une branche feature

## Commandes associées

- `/feature-resume <nom>` : Reprendre une feature en cours
- `/cancel-ralph` : Annuler le loop en cours
