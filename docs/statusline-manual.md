# Manuel Claude Code Statusline Pro (ccsp)

Guide en français pour personnaliser ta barre de statut Claude Code.

**Projet:** [github.com/Wangnov/claude-code-statusline-pro](https://github.com/Wangnov/claude-code-statusline-pro)

---

## Installation rapide

Dans `~/.claude/settings.json` :

```json
{
  "statusLine": {
    "type": "command",
    "command": "npx ccsp@latest"
  }
}
```

---

## Composants disponibles

| Lettre | Composant | Description |
| ------ | --------- | ----------- |
| **P** | Project | Nom du projet/dossier |
| **M** | Model | Modèle Claude (S4, O4, H3.5...) |
| **B** | Branch | Branche Git + statut |
| **T** | Tokens | Utilisation tokens + barre de progression |
| **U** | Usage | Coût en $ de la session |
| **S** | Status | État (Ready, Thinking, Error) |

### Exemples de presets

```bash
# Tous les composants (par défaut)
npx ccsp@latest --preset PMBTUS

# Minimaliste : juste modèle et tokens
npx ccsp@latest --preset MT

# Sans le coût
npx ccsp@latest --preset PMBTS
```

---

## Thèmes

| Thème | Description | Prérequis |
| ----- | ----------- | --------- |
| `classic` | Séparateurs `\|`, compatible partout | Aucun |
| `powerline` | Flèches connectées, moderne | Nerd Font |
| `capsule` | Style capsule arrondi | Nerd Font |

```bash
npx ccsp@latest --theme powerline
npx ccsp@latest --theme classic
npx ccsp@latest --theme capsule
```

---

## Modes d'icônes

```bash
# Forcer les emojis (recommandé si pas de Nerd Font)
npx ccsp@latest --force-emoji

# Forcer Nerd Font (si installé)
npx ccsp@latest --force-nerd-font

# Forcer texte pur (compatibilité max)
npx ccsp@latest --force-text
```

---

## Configuration avancée

### Initialiser la config

```bash
# Config pour le projet actuel
npx ccsp@latest config init

# Config globale (tous les projets)
npx ccsp@latest config init -g

# Avec les templates de widgets
npx ccsp@latest config init -w
```

### Emplacement des fichiers

| Niveau | Chemin | Priorité |
| ------ | ------ | -------- |
| Projet | `~/.claude/projects/{hash}/statusline-pro/config.toml` | Haute |
| Global | `~/.claude/statusline-pro/config.toml` | Basse |

---

## Options du composant Usage (coût $)

### Modes de calcul

| Mode | Description |
| ---- | ----------- |
| `session` | Coût depuis l'ouverture de Claude Code (reset avec `/clear`) |
| `conversation` | Coût cumulé de toute la conversation (persiste entre sessions) |

### Configuration dans config.toml

```toml
[components.usage]
enabled = true
precision = 2              # Nombre de décimales
display_mode = "session"   # ou "conversation"
show_lines_added = true    # Afficher lignes ajoutées
show_lines_removed = false # Afficher lignes supprimées
```

### Formule de calcul du coût

```
cost = (inputTokens × inputPrice + outputTokens × outputPrice + cacheTokens × cachePrice) / 200_000
```

**Note:** Le calcul peut différer de la commande `/cost` car ils utilisent des logiques et plages de temps différentes.

---

## Options du composant Tokens

### Configuration dans config.toml

```toml
[components.tokens]
enabled = true
show_gradient = true       # Barre colorée dégradée
show_progress_bar = true   # Afficher la barre
show_percentage = true     # Afficher le %
show_raw_numbers = false   # Afficher "150k/200k"
progress_width = 15        # Largeur de la barre

[components.tokens.thresholds]
warning = 60   # Jaune à 60%
danger = 85    # Rouge à 85%
critical = 95  # 🔥 à 95%
```

### Formule de calcul des tokens

```
contextUsedTokens = input_tokens + cache_creation_input_tokens + cache_read_input_tokens + output_tokens
```

---

## Exemple de configuration complète

Dans `~/.claude/statusline-pro/config.toml` :

```toml
# Composants à afficher
preset = "PMBTUS"

# Thème
theme = "classic"

# Langue (zh = chinois, en = anglais)
language = "en"

# Terminal
[terminal]
force_emoji = true      # Forcer les emojis
force_nerd_font = false
force_text = false

# Style
[style]
separator = "|"
enable_colors = true
compact_mode = false
max_width = 120

# Tokens
[components.tokens]
show_gradient = true
show_progress_bar = true
show_percentage = true
progress_width = 15

[components.tokens.thresholds]
warning = 60
danger = 85
critical = 95

# Usage (coût)
[components.usage]
enabled = true
precision = 2
display_mode = "conversation"  # Pour voir le coût total
show_lines_added = true

# Stockage
[storage]
enableConversationTracking = true
enableCostPersistence = true
autoCleanupDays = 30
```

---

## Dépannage

### Icônes en carrés/caractères bizarres

```bash
# Utiliser les emojis à la place
npx ccsp@latest --force-emoji
```

### Couleurs qui ne s'affichent pas

```bash
# Désactiver les couleurs
npx ccsp@latest --no-color
```

### Tester la statusline

```bash
# Test basique
echo '{"model":{"id":"claude-sonnet-4"}}' | npx ccsp@latest

# Test avec options
echo '{"model":{"id":"claude-sonnet-4"}}' | npx ccsp@latest --preset MT --theme classic
```

### Valider la config

```bash
npx ccsp@latest validate
```

---

## Commandes utiles

| Commande | Description |
| -------- | ----------- |
| `npx ccsp@latest --version` | Version installée |
| `npx ccsp@latest config init` | Initialiser la config |
| `npx ccsp@latest config init -g` | Config globale |
| `npx ccsp@latest validate` | Valider la config |
| `npx ccsp@latest --help` | Aide complète |

---

## Ma configuration actuelle

Dans `~/.claude/settings.json` :

```json
{
  "statusLine": {
    "type": "command",
    "command": "npx ccsp@latest"
  }
}
```

Pour personnaliser, crée `~/.claude/statusline-pro/config.toml` avec les options ci-dessus.

---

## Ressources

- [README officiel](https://github.com/Wangnov/claude-code-statusline-pro)
- [Template de config](https://github.com/Wangnov/claude-code-statusline-pro/blob/main/configs/config.template.toml)
- [Issues GitHub](https://github.com/Wangnov/claude-code-statusline-pro/issues)
