# Claude Code Configuration - cc-config

Ce dépôt contient la configuration personnelle de Claude Code pour un usage professionnel.

## Structure du projet

```
cc-config/
├── settings/           # Configuration principale (settings.json)
├── commands/           # Commandes slash personnalisées (.md)
├── agents/             # Agents spécialisés (.md)
├── hooks/              # Scripts de hooks (notifications, etc.)
├── scripts/            # Scripts utilitaires (statusline, etc.)
├── docs/               # Documentation additionnelle
├── install.sh          # Script d'installation
└── CLAUDE.md           # Ce fichier
```

## Conventions

### Settings (settings.json)
- Les permissions utilisent le format `"Tool pattern"` (ex: `"Git *"`)
- Les hooks sont organisés par événement (`Stop`, `Notification`)
- `defaultMode: "acceptEdits"` pour un workflow fluide

### Commands (commandes slash)
- Un fichier `.md` par commande dans `commands/`
- Nom du fichier = nom de la commande (sans le `/`)
- Format: description en markdown avec instructions pour Claude

### Agents
- Un fichier `.md` par agent dans `agents/`
- Définir clairement le rôle et les outils disponibles
- Inclure des exemples d'utilisation

### Hooks
- Scripts exécutables dans `hooks/`
- Supporter les modes SSH et desktop
- Logger dans `/tmp/claude-notifications/` si en SSH

## Installation

```bash
# Installation standard
./install.sh

# Voir ce qui serait fait sans exécuter
./install.sh --dry-run

# Avec backup de la config existante
./install.sh --backup
```

## Workflow de mise à jour

1. Modifier les fichiers dans ce dépôt
2. Tester avec `./install.sh --dry-run`
3. Installer avec `./install.sh --backup`
4. Commit et push les changements

## Bonnes pratiques

- Toujours faire un backup avant modification majeure
- Versionner tous les changements avec git
- Documenter les changements dans les commits
- Tester les nouvelles commands/agents avant de les intégrer

## Fichiers importants

| Fichier | Description |
|---------|-------------|
| `settings/settings.json` | Config principale Claude Code |
| `hooks/notifications.py` | Hook de notifications desktop/SSH |
| `scripts/statusline.sh` | Script de la barre de statut |
