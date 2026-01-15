#!/bin/bash
#
# Gestion du workflow expérimental pour tester les nouveautés
# Usage: ./experimental.sh <command> [args]
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
CLAUDE_DIR="$HOME/.claude"
EXPERIMENTAL_DIR="$PROJECT_DIR/experimental"

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log() { echo -e "${GREEN}[EXP]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }
info() { echo -e "${BLUE}[INFO]${NC} $1"; }

usage() {
    cat << EOF
Usage: $0 <command> [args]

Commands:
  start <nom>      Démarre une session expérimentale
                   Crée une branche git et un dossier pour les tests

  status           Affiche le statut de la session en cours

  validate         Valide l'expérimentation et merge dans main
                   Copie les fichiers testés dans la config principale

  rollback         Annule l'expérimentation et revient à main
                   Supprime les changements non validés

  list             Liste les expérimentations passées

Examples:
  $0 start new-hook-feature
  $0 validate
  $0 rollback
EOF
}

# Vérifier si on est dans une session expérimentale
is_experimental() {
    local branch=$(git -C "$PROJECT_DIR" branch --show-current 2>/dev/null)
    [[ "$branch" == exp/* ]]
}

get_current_exp() {
    git -C "$PROJECT_DIR" branch --show-current 2>/dev/null | sed 's|^exp/||'
}

cmd_start() {
    local name="$1"
    [ -z "$name" ] && error "Usage: $0 start <nom>"

    if is_experimental; then
        error "Session expérimentale déjà en cours: $(get_current_exp)\nUtilise 'validate' ou 'rollback' d'abord."
    fi

    log "Démarrage de l'expérimentation: $name"

    # Créer la branche
    git -C "$PROJECT_DIR" checkout -b "exp/$name"

    # Créer le dossier experimental si besoin
    mkdir -p "$EXPERIMENTAL_DIR"

    # Créer un fichier de notes pour cette expérimentation
    cat > "$EXPERIMENTAL_DIR/current.md" << EOF
# Expérimentation: $name

**Démarrée le:** $(date +"%Y-%m-%d %H:%M")

## Objectif

<!-- Décris ce que tu veux tester -->


## Changements à tester

- [ ]

## Notes

<!-- Notes pendant les tests -->


## Résultat

<!-- À remplir avant validate/rollback -->
- [ ] Succès
- [ ] Échec

**Raison:**

EOF

    log "Session expérimentale '$name' créée"
    info "Fichier de notes: $EXPERIMENTAL_DIR/current.md"
    info "Branche: exp/$name"
    echo ""
    warn "N'oublie pas de documenter tes tests dans current.md"
}

cmd_status() {
    if ! is_experimental; then
        info "Pas de session expérimentale en cours"
        info "Branche actuelle: $(git -C "$PROJECT_DIR" branch --show-current)"
        return
    fi

    local exp_name=$(get_current_exp)
    log "Session en cours: $exp_name"

    echo ""
    info "Fichiers modifiés:"
    git -C "$PROJECT_DIR" status --short

    if [ -f "$EXPERIMENTAL_DIR/current.md" ]; then
        echo ""
        info "Notes de l'expérimentation:"
        head -20 "$EXPERIMENTAL_DIR/current.md"
    fi
}

cmd_validate() {
    if ! is_experimental; then
        error "Pas de session expérimentale en cours"
    fi

    local exp_name=$(get_current_exp)
    log "Validation de l'expérimentation: $exp_name"

    # Archiver les notes
    if [ -f "$EXPERIMENTAL_DIR/current.md" ]; then
        mkdir -p "$EXPERIMENTAL_DIR/archive"
        mv "$EXPERIMENTAL_DIR/current.md" "$EXPERIMENTAL_DIR/archive/${exp_name}_$(date +%Y%m%d).md"
    fi

    # Commit les changements
    git -C "$PROJECT_DIR" add -A
    git -C "$PROJECT_DIR" commit -m "exp($exp_name): Validated experimental changes" || true

    # Merge dans main
    git -C "$PROJECT_DIR" checkout main
    git -C "$PROJECT_DIR" merge "exp/$exp_name" --no-ff -m "Merge exp/$exp_name: Validated"

    # Supprimer la branche expérimentale
    git -C "$PROJECT_DIR" branch -d "exp/$exp_name"

    log "Expérimentation '$exp_name' validée et mergée dans main"
    warn "Pense à lancer './install.sh' pour appliquer les changements"
}

cmd_rollback() {
    if ! is_experimental; then
        error "Pas de session expérimentale en cours"
    fi

    local exp_name=$(get_current_exp)
    warn "Annulation de l'expérimentation: $exp_name"

    # Archiver les notes avec statut échec
    if [ -f "$EXPERIMENTAL_DIR/current.md" ]; then
        mkdir -p "$EXPERIMENTAL_DIR/archive"
        mv "$EXPERIMENTAL_DIR/current.md" "$EXPERIMENTAL_DIR/archive/${exp_name}_$(date +%Y%m%d)_ROLLBACK.md"
    fi

    # Revenir à main et supprimer la branche
    git -C "$PROJECT_DIR" checkout main
    git -C "$PROJECT_DIR" branch -D "exp/$exp_name"

    log "Expérimentation '$exp_name' annulée"
}

cmd_list() {
    info "Expérimentations archivées:"
    if [ -d "$EXPERIMENTAL_DIR/archive" ]; then
        ls -la "$EXPERIMENTAL_DIR/archive/"
    else
        echo "  (aucune)"
    fi

    echo ""
    info "Branches expérimentales:"
    git -C "$PROJECT_DIR" branch --list 'exp/*' || echo "  (aucune)"
}

# Main
case "${1:-}" in
    start)    cmd_start "$2" ;;
    status)   cmd_status ;;
    validate) cmd_validate ;;
    rollback) cmd_rollback ;;
    list)     cmd_list ;;
    -h|--help|"") usage ;;
    *)        error "Commande inconnue: $1" ;;
esac
