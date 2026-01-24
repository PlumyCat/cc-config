# Étape 7: PR (flag -pr)

## Objectif
Créer une pull request propre et bien documentée.

## Actions

### 7.1 Préparer le commit

```bash
# Voir les changements
git status
git diff

# Stage les fichiers pertinents (pas de fichiers sensibles)
git add [fichiers]

# Commit avec message descriptif
git commit -m "feat: [description courte]

[Description détaillée si nécessaire]

Co-Authored-By: Claude Opus 4.5 <noreply@anthropic.com>"
```

### 7.2 Créer la branche (si pas déjà fait)

```bash
# Si on est sur main/master
git checkout -b feature/[nom-feature]
git push -u origin feature/[nom-feature]
```

### 7.3 Créer la PR

Utilise `gh pr create` avec un template structuré :

```bash
gh pr create --title "[Type]: [Description]" --body "$(cat <<'EOF'
## Summary
[2-3 bullet points décrivant les changements]

## Changes
- [Fichier 1]: [Description changement]
- [Fichier 2]: [Description changement]

## Testing
- [ ] Build passes
- [ ] Tests pass
- [ ] Manual verification done

## Screenshots (if applicable)
[Si UI changé]

---
🤖 Generated with Claude Code (Apex workflow)
EOF
)"
```

## Types de PR

| Préfixe | Usage |
|---------|-------|
| `feat:` | Nouvelle fonctionnalité |
| `fix:` | Correction de bug |
| `refactor:` | Refactoring sans changement fonctionnel |
| `docs:` | Documentation |
| `test:` | Ajout/modification de tests |
| `chore:` | Maintenance, dépendances |

## Output attendu

```
## Pull Request créée

### Détails
- **Titre:** [titre]
- **Branche:** feature/xxx → main
- **URL:** https://github.com/xxx/xxx/pull/123

### Fichiers inclus
- `file1.ts`
- `file2.ts`

### Prochaines étapes
1. Review par un pair
2. CI/CD checks
3. Merge
```

## Workflow terminé

Affiche le résumé final :

```
## ✅ Apex Workflow Completed

### Feature: [Description]

### Étapes effectuées
- [x] Analyze
- [x] Plan
- [x] Execute
- [x] Validate
- [x] Test (si -t)
- [x] Examine (si -x)
- [x] PR (si -pr)

### Résultat
- Fichiers modifiés: X
- Tests: Y passés
- Issues résolues: Z
- PR: [URL]
```
