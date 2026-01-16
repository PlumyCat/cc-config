#!/bin/bash

# Lire le JSON passé par Claude Code via stdin
input=$(cat)

# Debug: décommenter la ligne suivante pour voir le JSON reçu
# echo "$input" > /tmp/claude_statusline_debug.json

# Couleurs ANSI
GREEN='\033[01;32m'
BLUE='\033[01;34m'
YELLOW='\033[01;33m'
CYAN='\033[01;36m'
RED='\033[01;31m'
ORANGE='\033[38;5;208m'
RESET='\033[00m'
BOLD='\033[1m'

# Extraire les données du JSON avec jq
MODEL_ID=$(echo "$input" | jq -r '.model.id // "N/A"')

# Convertir l'ID du modèle en nom court
case "$MODEL_ID" in
    *opus*) MODEL="Opus" ;;
    *sonnet*) MODEL="Sonnet" ;;
    *haiku*) MODEL="Haiku" ;;
    *) MODEL="$MODEL_ID" ;;
esac

# Extraire le pourcentage d'utilisation du contexte
PERCENT_USED=$(echo "$input" | jq -r '.context_window.used_percentage // 0')
TOTAL_TOKENS=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
MAX_TOKENS=$(echo "$input" | jq -r '.context_window.context_window_size // 200000')

# User@hostname (from PS1: \u@\h)
printf "${GREEN}%s@%s${RESET}:" "$(whoami)" "$(hostname -s)"

# Current directory (from PS1: \w)
printf "${BLUE}%s${RESET}" "$(pwd)"

# Git branch si dans un repo
if git --no-optional-locks rev-parse --git-dir > /dev/null 2>&1; then
    branch=$(git --no-optional-locks symbolic-ref --short HEAD 2>/dev/null || git --no-optional-locks rev-parse --short HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        printf " ${CYAN}(${branch})${RESET}"
    fi
fi

# Convertir en entier (au cas où c'est un float ou "null")
if [ "$PERCENT_USED" = "null" ] || [ -z "$PERCENT_USED" ]; then
    PERCENT_USED=0
fi
PERCENT_USED=${PERCENT_USED%.*}  # Retirer les décimales

# Déterminer la couleur en fonction du pourcentage
if [ "$PERCENT_USED" -lt 50 ]; then
    COLOR=$GREEN
elif [ "$PERCENT_USED" -lt 80 ]; then
    COLOR=$YELLOW
else
    COLOR=$RED
fi

# Créer une barre de progression (20 caractères)
filled=$((PERCENT_USED / 5))
empty=$((20 - filled))
bar=""
for ((i=0; i<filled; i++)); do bar+="█"; done
for ((i=0; i<empty; i++)); do bar+="░"; done

# Afficher la barre et le pourcentage
printf " ${COLOR}[${bar}] ${PERCENT_USED}%%${RESET}"
printf " ${BOLD}${MODEL}${RESET}"

printf "\n"