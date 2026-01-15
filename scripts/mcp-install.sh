#!/bin/bash
#
# Installe la config MCP en substituant les variables d'environnement
# Usage: ./mcp-install.sh [--check]
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
SECRETS_FILE="$HOME/.claude/mcp-secrets.env"
TEMPLATE_FILE="$PROJECT_DIR/settings/mcp-servers.json"
CLAUDE_JSON="$HOME/.claude.json"

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

log() { echo -e "${GREEN}[MCP]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

# Vérifier le fichier de secrets
check_secrets() {
    if [ ! -f "$SECRETS_FILE" ]; then
        warn "Fichier de secrets non trouvé: $SECRETS_FILE"
        echo ""
        echo "Crée-le avec:"
        echo "  cp $PROJECT_DIR/settings/.env.example $SECRETS_FILE"
        echo "  nano $SECRETS_FILE  # Remplir les valeurs"
        echo ""
        return 1
    fi
    return 0
}

# Charger les secrets
load_secrets() {
    if [ -f "$SECRETS_FILE" ]; then
        set -a
        source "$SECRETS_FILE"
        set +a
        log "Secrets chargés depuis $SECRETS_FILE"
    fi
}

# Substituer les variables dans le template
substitute_vars() {
    local content=$(cat "$TEMPLATE_FILE")

    # Substituer ${VAR} par la valeur de $VAR
    content=$(echo "$content" | envsubst)

    echo "$content"
}

# Mettre à jour ~/.claude.json avec la nouvelle config MCP
update_claude_json() {
    local mcp_config="$1"

    if [ ! -f "$CLAUDE_JSON" ]; then
        error "Fichier $CLAUDE_JSON non trouvé"
    fi

    # Backup
    cp "$CLAUDE_JSON" "$CLAUDE_JSON.bak"

    # Mettre à jour mcpServers dans le fichier JSON
    local tmp_file=$(mktemp)
    jq --argjson mcp "$mcp_config" '.mcpServers = $mcp' "$CLAUDE_JSON" > "$tmp_file"
    mv "$tmp_file" "$CLAUDE_JSON"

    log "Config MCP mise à jour dans $CLAUDE_JSON"
}

# Mode check: vérifie juste que tout est prêt
if [ "$1" = "--check" ]; then
    echo "Vérification de la config MCP..."
    echo ""

    echo -n "Template: "
    [ -f "$TEMPLATE_FILE" ] && echo -e "${GREEN}OK${NC}" || echo -e "${RED}MANQUANT${NC}"

    echo -n "Secrets:  "
    [ -f "$SECRETS_FILE" ] && echo -e "${GREEN}OK${NC}" || echo -e "${YELLOW}MANQUANT${NC}"

    echo -n "claude.json: "
    [ -f "$CLAUDE_JSON" ] && echo -e "${GREEN}OK${NC}" || echo -e "${RED}MANQUANT${NC}"

    echo ""
    if check_secrets; then
        log "Prêt pour l'installation"
    fi
    exit 0
fi

# Installation
log "Installation de la config MCP..."

if ! check_secrets; then
    exit 1
fi

load_secrets

# Générer la config avec les variables substituées
mcp_config=$(substitute_vars)

# Valider le JSON
if ! echo "$mcp_config" | jq . > /dev/null 2>&1; then
    error "Config MCP invalide après substitution"
fi

# Mettre à jour
update_claude_json "$mcp_config"

log "Installation terminée!"
echo ""
warn "Redémarre Claude Code pour appliquer les changements"
