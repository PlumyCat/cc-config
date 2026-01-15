#!/bin/bash
#
# Script de veille Claude Code
# Ouvre les sources d'information et affiche les infos utiles
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

# Couleurs
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

log() { echo -e "${GREEN}[VEILLE]${NC} $1"; }
info() { echo -e "${BLUE}[INFO]${NC} $1"; }

# URLs des sources
CHANGELOG_URL="https://docs.anthropic.com/en/docs/claude-code/changelog"
GITHUB_URL="https://github.com/anthropics/claude-code/releases"
ISSUES_URL="https://github.com/anthropics/claude-code/issues"

show_current_version() {
    echo ""
    log "Version actuelle"
    echo "─────────────────────────────────────"

    if command -v claude &> /dev/null; then
        info "Claude CLI: $(claude --version 2>/dev/null || echo 'N/A')"
    else
        info "Claude CLI: non installé"
    fi

    # Version npm si disponible
    if command -v npm &> /dev/null; then
        local latest=$(npm view @anthropic-ai/claude-code version 2>/dev/null || echo "N/A")
        info "Dernière version npm: $latest"
    fi
}

show_sources() {
    echo ""
    log "Sources de veille"
    echo "─────────────────────────────────────"
    echo "  📋 Changelog:  $CHANGELOG_URL"
    echo "  🚀 Releases:   $GITHUB_URL"
    echo "  🐛 Issues:     $ISSUES_URL"
}

open_sources() {
    echo ""
    log "Ouverture des sources dans le navigateur..."

    # Détecter la commande pour ouvrir le navigateur
    local open_cmd=""
    if command -v xdg-open &> /dev/null; then
        open_cmd="xdg-open"
    elif command -v open &> /dev/null; then
        open_cmd="open"
    fi

    if [ -n "$open_cmd" ]; then
        $open_cmd "$CHANGELOG_URL" 2>/dev/null &
        sleep 0.5
        $open_cmd "$GITHUB_URL" 2>/dev/null &
        info "Sources ouvertes dans le navigateur"
    else
        echo -e "${YELLOW}[WARN]${NC} Impossible d'ouvrir le navigateur automatiquement"
        echo "       Ouvre manuellement les URLs ci-dessus"
    fi
}

show_backlog() {
    echo ""
    log "Nouveautés en attente de test"
    echo "─────────────────────────────────────"

    local backlog="$PROJECT_DIR/docs/backlog.md"
    if [ -f "$backlog" ]; then
        # Extraire la section "Nouveautés Claude Code à explorer"
        grep -A 10 "Nouveautés Claude Code à explorer" "$backlog" 2>/dev/null | head -15 || echo "  (voir docs/backlog.md)"
    else
        echo "  (fichier backlog.md non trouvé)"
    fi
}

quick_check() {
    show_current_version
    show_sources
    show_backlog

    echo ""
    echo "─────────────────────────────────────"
    info "Commandes utiles:"
    echo "  ./scripts/veille.sh open    # Ouvrir les sources"
    echo "  ./scripts/experimental.sh start <nom>  # Tester une nouveauté"
}

usage() {
    cat << EOF
Usage: $0 [command]

Commands:
  (aucun)   Affiche un résumé de veille
  open      Ouvre les sources dans le navigateur
  version   Affiche uniquement les versions

EOF
}

case "${1:-}" in
    open)     open_sources ;;
    version)  show_current_version ;;
    -h|--help) usage ;;
    *)        quick_check ;;
esac
