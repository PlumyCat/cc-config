# Migration cc-config : Ubuntu VM → macOS

Guide de migration de la configuration Claude Code vers un nouveau Mac.

**Date** : Mars 2026
**Source** : Ubuntu VM
**Cible** : macOS (Apple Silicon / Intel)

---

## Prérequis à installer sur le Mac

### 1. Homebrew (gestionnaire de paquets macOS)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Après installation, suivre les instructions affichées pour ajouter Homebrew au PATH.

### 2. Outils de base

```bash
# Node.js (LTS) + npm
brew install node

# Python 3 + pip
brew install python

# uv (gestionnaire Python rapide, pour les MCP servers)
brew install uv

# jq (nécessaire pour mcp-install.sh)
brew install jq

# tmux (pour Agent Teams avec cc-t, ccc-t, ccr-t)
brew install tmux

# Git (macOS en a un par défaut, mais la version Homebrew est plus récente)
brew install git
```

### 3. Optionnel mais recommandé

```bash
# Docker Desktop (nécessaire pour le MCP server GitHub)
# → Télécharger depuis https://www.docker.com/products/docker-desktop/

# ruff (formatage Python, utilisé par le hook auto-format)
brew install ruff

# prettier (formatage JS/TS/JSON/MD, utilisé par le hook auto-format)
npm install -g prettier

# eslint (linting JS/TS)
npm install -g eslint
```

### 4. Claude Code

```bash
npm install -g @anthropic-ai/claude-code
```

Vérifier l'installation :

```bash
claude --version
ls ~/.claude  # doit exister
```

---

## Installation pas à pas

### Étape 1 : Cloner le repo

```bash
cd ~/projects  # ou ton dossier préféré
git clone https://github.com/PlumyCat/cc-config.git
cd cc-config
```

### Étape 2 : Dry-run pour vérifier

```bash
./install.sh --dry-run
```

Vérifier que tout semble correct.

### Étape 3 : Installation avec backup

```bash
./install.sh --backup --shell
```

Cela va :
- Sauvegarder la config existante dans `~/.claude/backups/`
- Copier settings.json, skills, agents, hooks, scripts
- Installer les aliases dans `~/.zshrc` (détecté automatiquement sur macOS)

### Étape 4 : Configurer les secrets MCP

```bash
# Créer le fichier de secrets
cp settings/.env.example ~/.claude/mcp-secrets.env

# Éditer avec tes tokens
nano ~/.claude/mcp-secrets.env
# → Remplir GITHUB_TOKEN avec un Personal Access Token GitHub
```

Puis installer la config MCP :

```bash
./install.sh --mcp
```

### Étape 5 : Activer les aliases

```bash
source ~/.zshrc
```

Vérifier avec `cchelp`.

### Ou tout d'un coup

```bash
./install.sh --full --mcp
```

---

## Différences Ubuntu vs macOS

### Ce qui fonctionne tel quel (aucune modif)

| Composant | Détail |
|-----------|--------|
| `settings/settings.json` | 100% portable |
| `hooks/notifications.py` | Détecte l'OS via `platform.system()`, utilise `osascript` sur macOS |
| `hooks/auto-format.py` | Appelle ruff/prettier, indépendant de l'OS |
| `hooks/validate-commands.py` | Python pur |
| `agents/*.md` | Fichiers Markdown, portables |
| `skills/*/SKILL.md` | Fichiers Markdown, portables |
| `scripts/experimental.sh` | Bash standard |
| `scripts/note.sh` | Bash standard |

### Ce qui a été adapté

| Composant | Changement |
|-----------|------------|
| `install.sh` | Détecte l'OS, utilise `sed -i ''` sur macOS, cible `~/.zshrc` au lieu de `~/.bashrc` |
| `dotfiles/zshrc-claude.sh` | **Nouveau fichier** — version zsh des aliases (remplace `shopt -s huponexit` par `setopt HUP`) |

### Ce qui nécessite attention manuelle

| Composant | Action requise |
|-----------|----------------|
| Symlinks dans `skills/` | Les symlinks vers `../../.agents/skills/` (context7, mermaid-diagrams, orchestration-prompts, etc.) pointent vers un dossier spécifique à ta VM. Tu peux les ignorer (le install.sh les skip) ou recréer la structure `.agents/skills/` sur le Mac |
| `scripts/veille.sh` | Fonctionne sur macOS, mais `youtube-veille` doit être installé séparément si tu l'utilises |
| `scripts/cleanup.sh` | Utilise `bc` pour les calculs — déjà présent sur macOS |
| `settings/mcp-servers.json` | Le serveur `serena` pointe vers `$HOME/serena` — installer Serena si besoin |
| Docker | Nécessaire pour le MCP server GitHub — installer Docker Desktop |

---

## Vérification post-installation

```bash
# 1. Vérifier Claude Code
claude --version

# 2. Vérifier les aliases
cchelp

# 3. Vérifier la config
cat ~/.claude/settings.json | jq .

# 4. Vérifier les skills installées
ls ~/.claude/skills/

# 5. Vérifier les agents
ls ~/.claude/agents/

# 6. Vérifier les hooks
ls -la ~/.claude/hooks/

# 7. Vérifier les MCP servers
claude mcp list

# 8. Tester les notifications
echo '{"hook_event_name": "Stop"}' | python3 ~/.claude/hooks/notifications.py
# → Doit afficher une notification macOS
```

---

## Nettoyage des symlinks cassés

Les symlinks dans `skills/` qui pointaient vers `.agents/skills/` sur la VM ne fonctionneront pas sur le Mac. Pour les nettoyer :

```bash
cd ~/projects/cc-config/skills
# Lister les symlinks
ls -la | grep "^l"
# Résultat : context7, mermaid-diagrams, orchestration-prompts,
#            ralph-tui-create-json, ralph-tui-prd, typescript-expert,
#            vercel-react-best-practices

# Option A : Supprimer les symlinks cassés du repo
git rm context7 mermaid-diagrams orchestration-prompts ralph-tui-create-json ralph-tui-prd typescript-expert vercel-react-best-practices

# Option B : Recréer la structure .agents/skills/ et y copier les skills
# (si tu veux garder ces skills globales)
```

---

## Troubleshooting

### `sed: -i requires an argument` sur macOS
→ Le `install.sh` a été mis à jour pour gérer ça automatiquement.

### Les notifications ne marchent pas
→ Vérifier que Python 3 est dans le PATH : `which python3`
→ Vérifier les permissions de notification dans Préférences Système > Notifications

### `shopt: command not found`
→ Tu es en zsh. Utiliser `zshrc-claude.sh` au lieu de `bashrc-claude.sh`. Le `install.sh --shell` le fait automatiquement.

### Docker non trouvé pour le MCP GitHub
→ Installer Docker Desktop depuis https://www.docker.com/products/docker-desktop/
→ Alternative : utiliser le `gh` CLI directement au lieu du MCP Docker

### `jq: command not found`
→ `brew install jq`
