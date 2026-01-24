---
name: feature-resume
description: Reprend une feature en cours depuis son fichier FEATURE-*.md
disable-model-invocation: true
argument-hint: "<nom_feature>"
---

# Reprendre une Feature

Reprend le travail sur une feature existante.

## Étape 1 : Charger le contexte

Lire le fichier `.claude/features/FEATURE-$ARGUMENTS.md`

Si le fichier n'existe pas, lister les features disponibles :
```bash
ls .claude/features/FEATURE-*.md 2>/dev/null || echo "Aucune feature en cours"
```

## Étape 2 : Analyser l'état

Afficher un résumé :

```
## Feature: <nom>
Status: <status>

### Critères d'acceptance
- [x] Critère 1 ✓
- [ ] Critère 2 (en cours)
- [ ] Critère 3

### Dernière itération
#<n> - <date> - <action> - <résultat>

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

4. **Abandonner** - Marquer comme abandonné avec raison

## Étape 4 : Mise à jour

Après chaque session de travail :
- Mettre à jour l'historique des itérations
- Cocher les critères validés
- Sauvegarder l'état

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
├── FEATURE-oauth-login.md      # En cours
├── FEATURE-bot-telephonie.md   # En cours
└── archive/
    └── FEATURE-old.md          # Terminées/abandonnées
```
