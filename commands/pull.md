# Commande /pull - Pull Git avec gestion des conflits

## Rôle
Tu es un assistant Git qui effectue un `git pull` intelligent avec gestion automatique des conflits.

## Objectif
Synchroniser le dépôt local avec le remote en gérant proprement les conflits potentiels.

## Processus

### 1. Vérification préalable
```bash
# Vérifier l'état du repo
git status

# Vérifier la branche actuelle
git branch --show-current

# Vérifier s'il y a des changements non commités
git diff --stat
```

### 2. Stratégie selon l'état

#### Si changements non commités :
```bash
# Option 1: Stash automatique
git stash push -m "Auto-stash before pull $(date +%Y%m%d_%H%M%S)"
git pull
git stash pop

# Option 2: Proposer de commit avant pull
```

#### Si clean :
```bash
git pull
```

### 3. Détection des conflits

Après le pull, vérifier :
```bash
# Si conflits
git status | grep "both modified"

# Lister les fichiers en conflit
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
- ✅ Branche synchronisée
- 📊 Nombre de commits pulled
- 📝 Fichiers modifiés
- ⚠️ Conflits résolus (si applicable)

## Exemples d'utilisation

### Cas 1: Pull simple (pas de conflits)
```
> /pull

✅ Vérification de l'état du repo...
📍 Branche actuelle: main
🔄 Pull en cours...
✅ Pull réussi: 3 commits pulled, 5 fichiers modifiés
```

### Cas 2: Pull avec changements non commités
```
> /pull

⚠️ Changements non commités détectés
Options:
1. Stash automatique puis pull
2. Commit avant pull
3. Annuler

Quelle option préférez-vous ?
```

### Cas 3: Pull avec conflits
```
> /pull

⚠️ Conflits détectés dans 2 fichiers:
- src/config.ts (lignes 15-20)
- package.json (ligne 8)

Analyse des conflits:
1. src/config.ts:
   LOCAL: timeout: 3000
   REMOTE: timeout: 5000

2. package.json:
   LOCAL: "version": "1.2.0"
   REMOTE: "version": "1.2.1"

Comment souhaitez-vous résoudre ?
```

## Options

- `--rebase` : Utiliser `git pull --rebase` au lieu de merge
- `--force` : Forcer le pull (⚠️ écrasera les changements locaux)
- `--dry-run` : Simuler sans exécuter

## Sécurité

- ⚠️ Toujours proposer avant d'écraser des changements locaux
- 💾 Créer un stash automatique en cas de doute
- 📋 Demander confirmation pour `--force`
- 🔍 Afficher clairement les conflits avant résolution

## Notes

- Fonctionne sur la branche courante
- Préserve les changements locaux via stash si nécessaire
- Propose des solutions intelligentes pour les conflits
- Compatible avec les workflows multi-terminaux
