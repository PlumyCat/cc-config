#!/bin/bash
#
# Ajout rapide de notes dans la documentation
# Usage: ./note.sh <type> "message"
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOCS_DIR="$(dirname "$SCRIPT_DIR")/docs"

GREEN='\033[0;32m'
NC='\033[0m'

usage() {
    cat << EOF
Usage: $0 <type> "message"

Types:
  tip       Ajoute un tip dans tips.md
  todo      Ajoute un item dans le backlog
  veille    Ajoute une note de veille
  changelog Ajoute une entrée au changelog

Examples:
  $0 tip "Utiliser --resume pour reprendre une conversation"
  $0 todo "Tester le nouveau hook pre-commit"
  $0 veille "Nouvelle feature: support des images"
EOF
}

add_tip() {
    local msg="$1"
    local file="$DOCS_DIR/tips.md"
    local date=$(date +"%Y-%m-%d %H:%M")

    # Ajouter avant la dernière mise à jour
    sed -i "/^\*Dernière mise à jour/i - $msg\n" "$file" 2>/dev/null || \
        echo -e "\n- $msg" >> "$file"

    echo -e "${GREEN}[TIP]${NC} Ajouté: $msg"
}

add_todo() {
    local msg="$1"
    local file="$DOCS_DIR/backlog.md"

    # Ajouter dans la section Notes
    echo -e "\n- [ ] $msg ($(date +%Y-%m-%d))" >> "$file"

    echo -e "${GREEN}[TODO]${NC} Ajouté au backlog: $msg"
}

add_veille() {
    local msg="$1"
    local file="$DOCS_DIR/veille.md"
    local date=$(date +"%Y-%m-%d %H:%M")

    echo -e "\n### Note $(date +%Y-%m-%d)\n- $msg" >> "$file"

    echo -e "${GREEN}[VEILLE]${NC} Note ajoutée: $msg"
}

add_changelog() {
    local msg="$1"
    local file="$DOCS_DIR/changelog.md"
    local date=$(date +%Y-%m-%d)

    # Créer une nouvelle entrée
    local entry="## [$date] - Quick update\n\n### Modifié\n- $msg\n"

    # Insérer après la ligne "---" (après le format)
    sed -i "/^---$/a\\
\\
$entry" "$file" 2>/dev/null || echo -e "\n$entry" >> "$file"

    echo -e "${GREEN}[CHANGELOG]${NC} Entrée ajoutée: $msg"
}

# Main
type="${1:-}"
msg="${2:-}"

[ -z "$type" ] && { usage; exit 0; }
[ -z "$msg" ] && { echo "Erreur: message requis"; usage; exit 1; }

case "$type" in
    tip)       add_tip "$msg" ;;
    todo)      add_todo "$msg" ;;
    veille)    add_veille "$msg" ;;
    changelog) add_changelog "$msg" ;;
    *)         echo "Type inconnu: $type"; usage; exit 1 ;;
esac
