#!/bin/bash
#
# Script d'installation de la configuration Claude Code
# Usage: ./install.sh [--dry-run] [--backup]
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
        -h|--help)
            echo "Usage: $0 [--dry-run] [--backup]"
            echo "  --dry-run  Affiche les actions sans les exécuter"
            echo "  --backup   Sauvegarde la config existante avant installation"
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

# Vérifier que le dossier Claude existe
if [ ! -d "$CLAUDE_DIR" ]; then
    error "Le dossier $CLAUDE_DIR n'existe pas. Claude Code est-il installé?"
fi

# Backup si demandé
if [ "$DO_BACKUP" = true ]; then
    log "Création du backup dans $BACKUP_DIR"
    run "mkdir -p '$BACKUP_DIR'"
    [ -f "$CLAUDE_DIR/settings.json" ] && run "cp '$CLAUDE_DIR/settings.json' '$BACKUP_DIR/'"
    [ -d "$CLAUDE_DIR/commands" ] && run "cp -r '$CLAUDE_DIR/commands' '$BACKUP_DIR/'"
    [ -d "$CLAUDE_DIR/agents" ] && run "cp -r '$CLAUDE_DIR/agents' '$BACKUP_DIR/'"
    [ -d "$CLAUDE_DIR/hooks" ] && run "cp -r '$CLAUDE_DIR/hooks' '$BACKUP_DIR/'"
fi

log "Installation de la configuration Claude Code..."

# Créer les dossiers nécessaires
log "Création des dossiers..."
run "mkdir -p '$CLAUDE_DIR/commands'"
run "mkdir -p '$CLAUDE_DIR/agents'"
run "mkdir -p '$CLAUDE_DIR/hooks'"

# Copier settings.json
if [ -f "$SCRIPT_DIR/settings/settings.json" ]; then
    log "Installation de settings.json..."
    run "cp '$SCRIPT_DIR/settings/settings.json' '$CLAUDE_DIR/settings.json'"
fi

# Copier les commands
if [ -d "$SCRIPT_DIR/commands" ] && [ "$(ls -A $SCRIPT_DIR/commands 2>/dev/null)" ]; then
    log "Installation des commands..."
    run "cp '$SCRIPT_DIR/commands/'*.md '$CLAUDE_DIR/commands/'"
fi

# Copier les agents
if [ -d "$SCRIPT_DIR/agents" ] && [ "$(ls -A $SCRIPT_DIR/agents 2>/dev/null)" ]; then
    log "Installation des agents..."
    run "cp '$SCRIPT_DIR/agents/'*.md '$CLAUDE_DIR/agents/'"
fi

# Copier les hooks
if [ -d "$SCRIPT_DIR/hooks" ] && [ "$(ls -A $SCRIPT_DIR/hooks 2>/dev/null)" ]; then
    log "Installation des hooks..."
    run "cp '$SCRIPT_DIR/hooks/'* '$CLAUDE_DIR/hooks/'"
    run "chmod +x '$CLAUDE_DIR/hooks/'*"
fi

# Copier les scripts
if [ -d "$SCRIPT_DIR/scripts" ] && [ "$(ls -A $SCRIPT_DIR/scripts 2>/dev/null)" ]; then
    log "Installation des scripts..."
    for script in "$SCRIPT_DIR/scripts/"*; do
        [ -f "$script" ] && run "cp '$script' '$CLAUDE_DIR/' && chmod +x '$CLAUDE_DIR/$(basename $script)'"
    done
fi

log "Installation terminée!"

# Afficher un résumé
echo ""
echo "=== Résumé ==="
echo "Settings:  $(ls $SCRIPT_DIR/settings/*.json 2>/dev/null | wc -l) fichier(s)"
echo "Commands:  $(ls $SCRIPT_DIR/commands/*.md 2>/dev/null | wc -l) fichier(s)"
echo "Agents:    $(ls $SCRIPT_DIR/agents/*.md 2>/dev/null | wc -l) fichier(s)"
echo "Hooks:     $(ls $SCRIPT_DIR/hooks/* 2>/dev/null | wc -l) fichier(s)"
echo "Scripts:   $(ls $SCRIPT_DIR/scripts/* 2>/dev/null | wc -l) fichier(s)"
