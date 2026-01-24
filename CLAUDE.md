# Claude Code Configuration - cc-config

Configuration personnelle de Claude Code pour un usage professionnel.
**Repo:** https://github.com/PlumyCat/cc-config

## Structure du projet

```
cc-config/
├── settings/           # Configuration principale (settings.json)
├── skills/             # Skills personnalisées (répertoires avec SKILL.md)
│   ├── pull/           # Git pull intelligent
│   ├── veille/         # Veille des nouveautés
│   ├── epct/           # Workflow Explore-Plan-Code-Test
│   └── ...
├── agents/             # Agents spécialisés (.md)
├── hooks/              # Scripts de hooks (notifications, etc.)
├── scripts/            # Scripts utilitaires
│   ├── statusline.sh   # Barre de statut personnalisée
│   ├── experimental.sh # Workflow de test des nouveautés
│   ├── veille.sh       # Veille des nouveautés Claude Code
│   └── note.sh         # Ajout rapide de notes
├── docs/               # Documentation personnelle
│   ├── tips.md         # Trucs et astuces à retenir
│   ├── usage.md        # Guide d'utilisation personnel
│   ├── changelog.md    # Historique des modifications
│   ├── backlog.md      # Idées et choses à tester
│   └── veille.md       # Suivi des nouveautés
├── experimental/       # Tests en cours (branche exp/*)
├── install.sh          # Script d'installation
└── CLAUDE.md           # Ce fichier
```

## Scripts disponibles

### `./install.sh` - Installation
```bash
./install.sh              # Installation standard
./install.sh --backup     # Avec sauvegarde préalable
./install.sh --dry-run    # Simulation sans exécution
```

### `./scripts/experimental.sh` - Workflow de test
```bash
./scripts/experimental.sh start <nom>   # Démarrer un test
./scripts/experimental.sh status        # Voir le statut
./scripts/experimental.sh validate      # Valider et merger
./scripts/experimental.sh rollback      # Annuler le test
./scripts/experimental.sh list          # Historique
```

### `./scripts/veille.sh` - Veille
```bash
./scripts/veille.sh           # Résumé rapide
./scripts/veille.sh open      # Ouvrir les sources
./scripts/veille.sh version   # Versions actuelles
```

### `./scripts/note.sh` - Notes rapides
```bash
./scripts/note.sh tip "message"        # Ajouter un tip
./scripts/note.sh todo "message"       # Ajouter au backlog
./scripts/note.sh veille "message"     # Note de veille
./scripts/note.sh changelog "message"  # Entrée changelog
```

## Workflows

### Tester une nouveauté Claude Code
1. `./scripts/veille.sh` pour voir les nouveautés
2. `./scripts/experimental.sh start feature-name`
3. Modifier la config dans ce dépôt
4. `./install.sh` pour appliquer
5. Tester sur un projet non-critique
6. `./scripts/experimental.sh validate` ou `rollback`

### Mise à jour de la config
1. Modifier les fichiers dans ce dépôt
2. `./install.sh --dry-run` pour vérifier
3. `./install.sh --backup` pour appliquer
4. `git add -A && git commit && git push`

### Ajouter une note rapidement
```bash
./scripts/note.sh tip "Ne pas oublier --resume"
./scripts/note.sh todo "Tester le nouveau hook"
```

## Conventions

### Settings (settings.json)
- Permissions: format `"Tool pattern"` (ex: `"Git *"`)
- Hooks: organisés par événement (`Stop`, `Notification`)
- Mode par défaut: `acceptEdits`

### Skills (nouveau format)
- Un répertoire par skill dans `skills/`
- Chaque skill contient un fichier `SKILL.md` avec frontmatter YAML
- Frontmatter supporté: `name`, `description`, `disable-model-invocation`, `allowed-tools`, `context`, `agent`, `argument-hint`
- Fichiers de support optionnels (templates, scripts, exemples)

### Agents
- Un fichier `.md` par agent dans `agents/`
- Définir le rôle, outils, et exemples d'utilisation

## Documentation

| Fichier | Usage |
|---------|-------|
| `docs/tips.md` | Trucs à ne pas oublier |
| `docs/usage.md` | Guide personnel |
| `docs/changelog.md` | Historique des modifs |
| `docs/backlog.md` | Idées à tester |
| `docs/veille.md` | Suivi des nouveautés |
