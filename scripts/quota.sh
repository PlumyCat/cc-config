#!/bin/bash
#
# Script de monitoring du quota Anthropic
# Affiche l'usage des dernières 24h et 7 jours
#
# Prérequis: Clé Admin API (sk-ant-admin-...)
# Config: ~/.claude/anthropic-admin.key ou variable ANTHROPIC_ADMIN_KEY
#

set -e

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# Fichier de clé
KEY_FILE="$HOME/.claude/anthropic-admin.key"

# Charger la clé Admin
load_key() {
    if [ -n "$ANTHROPIC_ADMIN_KEY" ]; then
        echo "$ANTHROPIC_ADMIN_KEY"
    elif [ -f "$KEY_FILE" ]; then
        cat "$KEY_FILE" | tr -d '\n'
    else
        echo ""
    fi
}

ADMIN_KEY=$(load_key)

if [ -z "$ADMIN_KEY" ]; then
    echo -e "${RED}Erreur: Clé Admin non trouvée${NC}"
    echo ""
    echo "Configure ta clé Admin Anthropic:"
    echo "  1. Va sur https://console.anthropic.com/settings/admin-keys"
    echo "  2. Crée une clé Admin (commence par sk-ant-admin-...)"
    echo "  3. Sauvegarde-la:"
    echo "     echo 'sk-ant-admin-...' > ~/.claude/anthropic-admin.key"
    echo "     chmod 600 ~/.claude/anthropic-admin.key"
    echo ""
    echo "Ou exporte la variable:"
    echo "     export ANTHROPIC_ADMIN_KEY='sk-ant-admin-...'"
    exit 1
fi

# Dates
NOW=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
TODAY_START=$(date -u +"%Y-%m-%dT00:00:00Z")
YESTERDAY=$(date -u -d "24 hours ago" +"%Y-%m-%dT%H:%M:%SZ" 2>/dev/null || date -u -v-24H +"%Y-%m-%dT%H:%M:%SZ")
WEEK_AGO=$(date -u -d "7 days ago" +"%Y-%m-%dT00:00:00Z" 2>/dev/null || date -u -v-7d +"%Y-%m-%dT00:00:00Z")

# Fonction pour formater les tokens
format_tokens() {
    local tokens=$1
    if [ "$tokens" -ge 1000000 ]; then
        echo "$(echo "scale=1; $tokens/1000000" | bc)M"
    elif [ "$tokens" -ge 1000 ]; then
        echo "$(echo "scale=1; $tokens/1000" | bc)k"
    else
        echo "$tokens"
    fi
}

# Fonction pour récupérer l'usage
get_usage() {
    local start=$1
    local end=$2
    local bucket=$3

    curl -s "https://api.anthropic.com/v1/organizations/usage_report/messages?starting_at=${start}&ending_at=${end}&bucket_width=${bucket}" \
        -H "anthropic-version: 2023-06-01" \
        -H "x-api-key: $ADMIN_KEY"
}

# Fonction pour extraire les totaux
extract_totals() {
    local json=$1

    # Extraire les tokens avec jq
    local input=$(echo "$json" | jq -r '[.data[].snapshot.uncached_input_tokens // 0] | add // 0')
    local cached=$(echo "$json" | jq -r '[.data[].snapshot.cached_input_tokens // 0] | add // 0')
    local output=$(echo "$json" | jq -r '[.data[].snapshot.output_tokens // 0] | add // 0')
    local total=$((input + cached + output))

    echo "$input $cached $output $total"
}

echo ""
echo -e "${BOLD}═══════════════════════════════════════════════════════════${NC}"
echo -e "${BOLD}              📊 Quota Anthropic - Usage API               ${NC}"
echo -e "${BOLD}═══════════════════════════════════════════════════════════${NC}"
echo ""

# Usage dernières 24h
echo -e "${CYAN}▸ Dernières 24 heures${NC}"
echo "─────────────────────────────────────────────────────────────"

USAGE_24H=$(get_usage "$YESTERDAY" "$NOW" "1h")

if echo "$USAGE_24H" | jq -e '.error' > /dev/null 2>&1; then
    ERROR_MSG=$(echo "$USAGE_24H" | jq -r '.error.message // .error')
    echo -e "${RED}Erreur API: $ERROR_MSG${NC}"
else
    read INPUT CACHED OUTPUT TOTAL <<< $(extract_totals "$USAGE_24H")

    echo -e "  Input tokens:    ${BOLD}$(format_tokens $INPUT)${NC}"
    echo -e "  Cached tokens:   ${BOLD}$(format_tokens $CACHED)${NC}"
    echo -e "  Output tokens:   ${BOLD}$(format_tokens $OUTPUT)${NC}"
    echo -e "  ${GREEN}Total:           ${BOLD}$(format_tokens $TOTAL)${NC}"
fi

echo ""

# Usage 7 derniers jours
echo -e "${CYAN}▸ 7 derniers jours${NC}"
echo "─────────────────────────────────────────────────────────────"

USAGE_7D=$(get_usage "$WEEK_AGO" "$NOW" "1d")

if echo "$USAGE_7D" | jq -e '.error' > /dev/null 2>&1; then
    ERROR_MSG=$(echo "$USAGE_7D" | jq -r '.error.message // .error')
    echo -e "${RED}Erreur API: $ERROR_MSG${NC}"
else
    read INPUT CACHED OUTPUT TOTAL <<< $(extract_totals "$USAGE_7D")

    echo -e "  Input tokens:    ${BOLD}$(format_tokens $INPUT)${NC}"
    echo -e "  Cached tokens:   ${BOLD}$(format_tokens $CACHED)${NC}"
    echo -e "  Output tokens:   ${BOLD}$(format_tokens $OUTPUT)${NC}"
    echo -e "  ${GREEN}Total:           ${BOLD}$(format_tokens $TOTAL)${NC}"

    # Détail par jour
    echo ""
    echo -e "  ${YELLOW}Détail par jour:${NC}"
    echo "$USAGE_7D" | jq -r '.data[] | "    \(.bucket_start_time | split("T")[0]): \(.snapshot.uncached_input_tokens + .snapshot.cached_input_tokens + .snapshot.output_tokens) tokens"' 2>/dev/null || true
fi

echo ""
echo "─────────────────────────────────────────────────────────────"
echo -e "${YELLOW}Note:${NC} Ces données montrent l'usage API, pas le rate limit restant."
echo -e "      Pour le rate limit en temps réel, consulte le dashboard:"
echo -e "      ${CYAN}https://console.anthropic.com/settings/limits${NC}"
echo ""
