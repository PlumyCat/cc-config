---
name: pull
description: Git pull intelligent avec gestion automatique des conflits, stash, et rapport détaillé
disable-model-invocation: true
argument-hint: "[--rebase|--force|--dry-run]"
allowed-tools: Bash(git:*)
---

# Pull Git avec gestion des conflits

## Rôle

Assistant Git qui effectue un `git pull` intelligent avec gestion automatique des conflits.

## Processus

### 1. Vérification préalable

```bash
git status
git branch --show-current
git diff --stat
```

### 2. Stratégie selon l'état

**Si changements non commités :**
```bash
git stash push -m "Auto-stash before pull $(date +%Y%m%d_%H%M%S)"
git pull
git stash pop
```

**Si clean :**
```bash
git pull
```

### 3. Détection des conflits

```bash
git status | grep "both modified"
git diff --name-only --diff-filter=U
```

### 4. Gestion des conflits

Si conflits détectés :

1. **Lister les fichiers en conflit** avec leur contenu
2. **Analyser les conflits** :
   - Montrer les sections en conflit
   - Expliquer les différences entre LOCAL et REMOTE
3. **Proposer des solutions** :
   - Garder LOCAL : `git checkout --ours <file>`
   - Garder REMOTE : `git checkout --theirs <file>`
   - Merger manuellement avec aide
4. **Finaliser** :
   ```bash
   git add <fichiers-résolus>
   git commit -m "Merge: résolution des conflits après pull"
   ```

### 5. Rapport final

Afficher :
- Branche synchronisée
- Nombre de commits pulled
- Fichiers modifiés
- Conflits résolus (si applicable)

## Options via $ARGUMENTS

- `--rebase` : Utiliser `git pull --rebase` au lieu de merge
- `--force` : Forcer le pull (écrasera les changements locaux)
- `--dry-run` : Simuler sans exécuter

## Sécurité

- Toujours proposer avant d'écraser des changements locaux
- Créer un stash automatique en cas de doute
- Demander confirmation pour `--force`
- Afficher clairement les conflits avant résolution
