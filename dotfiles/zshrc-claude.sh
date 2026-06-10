# =============================================================================
# Codex CLI - Configuration Zsh (macOS)
# Source: cc-config/dotfiles/zshrc-claude.sh
# Installation: ajoute automatiquement par install.sh --shell
# =============================================================================

# Zsh equivalent de huponexit: envoyer SIGHUP aux jobs en arriere-plan a la sortie
setopt HUP

# Raccourcis Codex CLI - sans tmux
alias cc='codex --dangerously-bypass-approvals-and-sandbox'
alias ccc='codex resume --last --dangerously-bypass-approvals-and-sandbox'
alias ccr='codex resume --dangerously-bypass-approvals-and-sandbox'

# Raccourcis Codex CLI - avec tmux
cc-t() {
    if [ -n "$TMUX" ]; then
        codex --dangerously-bypass-approvals-and-sandbox "$@"
    else
        tmux new-session -s "codex-$$" -- codex --dangerously-bypass-approvals-and-sandbox "$@"
    fi
}
ccc-t() {
    if [ -n "$TMUX" ]; then
        codex resume --last --dangerously-bypass-approvals-and-sandbox "$@"
    else
        tmux new-session -s "codex-$$" -- codex resume --last --dangerously-bypass-approvals-and-sandbox "$@"
    fi
}
ccr-t() {
    if [ -n "$TMUX" ]; then
        codex resume --dangerously-bypass-approvals-and-sandbox "$@"
    else
        tmux new-session -s "codex-$$" -- codex resume --dangerously-bypass-approvals-and-sandbox "$@"
    fi
}

alias codex-safe='codex --ask-for-approval on-request --sandbox workspace-write'
alias codex-yolo='codex --dangerously-bypass-approvals-and-sandbox'

# Utilitaires Codex CLI
alias cc-logs='find ~/.codex/sessions -name "*.jsonl" -type f -print 2>/dev/null | xargs ls -lt 2>/dev/null | head -20 || echo "Aucun log trouve"'
alias cc-doctor='codex doctor'
alias cc-mcp='codex mcp list'
alias cc-app='codex app'
alias cc-sessions='codex resume --all'

# Fonctions utiles
ccproject() {
    if [[ -f ".codex/config.toml" || -f "AGENTS.md" ]]; then
        echo "Using project Codex context"
    else
        echo "No project Codex context found, using global config"
    fi
    codex --dangerously-bypass-approvals-and-sandbox
}

cchelp() {
    echo "Codex CLI - Raccourcis disponibles:"
    echo ""
    echo "  cc           - Codex en mode YOLO"
    echo "  ccc          - Continue la derniere session en YOLO"
    echo "  ccr          - Resume une session specifique en YOLO"
    echo "  cc-t         - Codex en mode YOLO (tmux)"
    echo "  ccc-t        - Continue la derniere session (tmux)"
    echo "  ccr-t        - Resume une session (tmux)"
    echo "  codex-safe   - Mode securise avec approbations"
    echo "  codex-yolo   - Alias explicite du mode YOLO"
    echo ""
    echo "  cc-logs      - Voir les sessions recentes"
    echo "  cc-doctor    - Diagnostic Codex"
    echo "  cc-mcp       - Lister les serveurs MCP"
    echo "  cc-app       - Ouvrir Codex Desktop"
    echo "  cc-sessions  - Lister toutes les sessions resumables"
    echo ""
    echo "  ccproject    - Lance Codex avec detection projet"
    echo "  cchelp       - Affiche cette aide"
}

# Exports utiles pour Codex
export CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
export USE_BUILTIN_RIPGREP=0
export BASH_DEFAULT_TIMEOUT_MS=30000
export MAX_MCP_OUTPUT_TOKENS=50000

echo "Codex CLI aliases loaded. Type 'cchelp' for available commands."

# Secrets (cles API, tokens, etc.)
[ -f ~/.codex_secrets ] && source ~/.codex_secrets
[ -f ~/.claude_secrets ] && source ~/.claude_secrets
