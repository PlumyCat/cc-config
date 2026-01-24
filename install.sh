#!/bin/bash
#
# Script d'installation de la configuration Claude Code
# Usage: ./install.sh [--dry-run] [--backup] [--mcp]
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
BACKUP_DIR="$CLAUDE_DIR/backups/$(date +%Y%m%d_%H%M%S)"

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

DRY_RUN=false
DO_BACKUP=false
DO_MCP=false

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --backup)
            DO_BACKUP=true
            shift
            ;;
        --mcp)
            DO_MCP=true
            shift
            ;;
        -h|--help)
            echo "Usage: $0 [--dry-run] [--backup] [--mcp]"
            echo "  --dry-run  Affiche les actions sans les exécuter"
            echo "  --backup   Sauvegarde la config existante avant installation"
            echo "  --mcp      Installe aussi la config MCP (nécessite mcp-secrets.env)"
            exit 0
            ;;
        *)
            echo -e "${RED}Option inconnue: $1${NC}"
            exit 1
            ;;
    esac
done

log() {
    echo -e "${GREEN}[INSTALL]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
    exit 1
}

run() {
    if [ "$DRY_RUN" = true ]; then
        echo -e "${YELLOW}[DRY-RUN]${NC} $1"
    else
        eval "$1"
    fi
}

# Validate directory is safe (exists, is a directory, not a symlink)
validate_dir() {
    local dir="$1"
    local name="$2"
    if [ ! -e "$dir" ]; then
        warn "Directory does not exist: $dir"
        return 1
    fi
    if [ -L "$dir" ]; then
        error "Security: $name is a symlink, refusing to process: $dir"
    fi
    if [ ! -d "$dir" ]; then
        error "Security: $name is not a directory: $dir"
    fi
    return 0
}

# Vérifier que le dossier Claude existe
if [ ! -d "$CLAUDE_DIR" ]; then
    error "Le dossier $CLAUDE_DIR n'existe pas. Claude Code est-il installé?"
fi

# Backup si demandé
if [ "$DO_BACKUP" = true ]; then
    log "Création du backup dans $BACKUP_DIR"
    run "mkdir -p '$BACKUP_DIR'"
    [ -f "$CLAUDE_DIR/settings.json" ] && run "cp '$CLAUDE_DIR/settings.json' '$BACKUP_DIR/'"
    [ -d "$CLAUDE_DIR/skills" ] && run "cp -r '$CLAUDE_DIR/skills' '$BACKUP_DIR/'"
    [ -d "$CLAUDE_DIR/agents" ] && run "cp -r '$CLAUDE_DIR/agents' '$BACKUP_DIR/'"
    [ -d "$CLAUDE_DIR/hooks" ] && run "cp -r '$CLAUDE_DIR/hooks' '$BACKUP_DIR/'"
fi

log "Installation de la configuration Claude Code..."

# Créer les dossiers nécessaires
log "Création des dossiers..."
run "mkdir -p '$CLAUDE_DIR/skills'"
run "mkdir -p '$CLAUDE_DIR/agents'"
run "mkdir -p '$CLAUDE_DIR/hooks'"

# Copier settings.json
if [ -f "$SCRIPT_DIR/settings/settings.json" ]; then
    log "Installation de settings.json..."
    run "cp '$SCRIPT_DIR/settings/settings.json' '$CLAUDE_DIR/settings.json'"
fi

# Copier les skills (nouvelle structure)
if [ -d "$SCRIPT_DIR/skills" ] && [ "$(ls -A $SCRIPT_DIR/skills 2>/dev/null)" ]; then
    log "Installation des skills..."
    for skill_dir in "$SCRIPT_DIR/skills/"*/; do
        # Skip if glob didn't match anything
        [ -d "$skill_dir" ] || continue
        # Validate directory is safe
        if ! validate_dir "$skill_dir" "skill"; then
            continue
        fi
        skill_name=$(basename "$skill_dir")
        # Validate skill name (alphanumeric, dash, underscore only)
        if [[ ! "$skill_name" =~ ^[a-zA-Z0-9_-]+$ ]]; then
            warn "Skipping invalid skill name: $skill_name"
            continue
        fi
        run "mkdir -p '$CLAUDE_DIR/skills/$skill_name'"
        run "cp -r '$skill_dir'* '$CLAUDE_DIR/skills/$skill_name/'"
    done
fi

# Copier les agents
if [ -d "$SCRIPT_DIR/agents" ] && [ "$(ls -A $SCRIPT_DIR/agents 2>/dev/null)" ]; then
    log "Installation des agents..."
    # Copy only .md files, skip symlinks
    for agent_file in "$SCRIPT_DIR/agents/"*.md; do
        [ -f "$agent_file" ] || continue
        if [ -L "$agent_file" ]; then
            warn "Skipping symlink: $agent_file"
            continue
        fi
        run "cp '$agent_file' '$CLAUDE_DIR/agents/'"
    done
fi

# Copier les hooks
if [ -d "$SCRIPT_DIR/hooks" ] && [ "$(ls -A $SCRIPT_DIR/hooks 2>/dev/null)" ]; then
    log "Installation des hooks..."
    for hook_file in "$SCRIPT_DIR/hooks/"*; do
        [ -f "$hook_file" ] || continue
        if [ -L "$hook_file" ]; then
            warn "Skipping symlink: $hook_file"
            continue
        fi
        run "cp '$hook_file' '$CLAUDE_DIR/hooks/'"
    done
    run "chmod +x '$CLAUDE_DIR/hooks/'* 2>/dev/null || true"
fi

# Copier les scripts
if [ -d "$SCRIPT_DIR/scripts" ] && [ "$(ls -A $SCRIPT_DIR/scripts 2>/dev/null)" ]; then
    log "Installation des scripts..."
    for script in "$SCRIPT_DIR/scripts/"*; do
        [ -f "$script" ] && run "cp '$script' '$CLAUDE_DIR/' && chmod +x '$CLAUDE_DIR/$(basename $script)'"
    done
fi

# Installer MCP si demandé
if [ "$DO_MCP" = true ]; then
    log "Installation de la config MCP..."
    if [ "$DRY_RUN" = true ]; then
        run "$SCRIPT_DIR/scripts/mcp-install.sh --check"
    else
        run "$SCRIPT_DIR/scripts/mcp-install.sh"
    fi
fi

log "Installation terminée!"

# Afficher un résumé
echo ""
echo "=== Résumé ==="
echo "Settings:  $(ls $SCRIPT_DIR/settings/*.json 2>/dev/null | wc -l) fichier(s)"
echo "Skills:    $(ls -d $SCRIPT_DIR/skills/*/ 2>/dev/null | wc -l) skill(s)"
echo "Agents:    $(ls $SCRIPT_DIR/agents/*.md 2>/dev/null | wc -l) fichier(s)"
echo "Hooks:     $(ls $SCRIPT_DIR/hooks/* 2>/dev/null | wc -l) fichier(s)"
echo "Scripts:   $(ls $SCRIPT_DIR/scripts/* 2>/dev/null | wc -l) fichier(s)"

echo ""
echo "Redémarrez Claude Code pour appliquer les changements."
