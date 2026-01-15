# /quota - Monitoring du quota Anthropic

Affiche l'usage de ton compte Anthropic via l'API Admin.

## Instructions

Exécute le script de quota :

```bash
~/cc-config/scripts/quota.sh
```

## Prérequis

Ce script nécessite une **clé Admin Anthropic** (pas une clé API normale).

### Obtenir une clé Admin

1. Va sur https://console.anthropic.com/settings/admin-keys
2. Crée une nouvelle clé Admin (commence par `sk-ant-admin-...`)
3. Sauvegarde-la dans `~/.claude/anthropic-admin.key` :
   ```bash
   echo 'sk-ant-admin-...' > ~/.claude/anthropic-admin.key
   chmod 600 ~/.claude/anthropic-admin.key
   ```

## Ce qui est affiché

- **Dernières 24h** : tokens input/cached/output
- **7 derniers jours** : total + détail par jour

## Limitation

L'API Usage montre la **consommation passée**, pas le **quota restant en temps réel**.
Pour le rate limit actuel, consulte : https://console.anthropic.com/settings/limits
