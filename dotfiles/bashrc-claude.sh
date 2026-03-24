# =============================================================================
# Claude Code - Configuration Bash
# Source: cc-config/dotfiles/bashrc-claude.sh
# Installation: ajouté automatiquement par install.sh --bashrc
# =============================================================================

# Send SIGHUP to child processes when shell exits (prevents orphan Claude processes)
shopt -s huponexit

# Raccourcis Claude Code - sans tmux
alias cc='claude --dangerously-skip-permissions'
alias ccc='claude --dangerously-skip-permissions --continue'
alias ccr='claude --dangerously-skip-permissions --resume'

# Raccourcis Claude Code - avec tmux (pour Agent Teams)
cc-t() {
    if [ -n "$TMUX" ]; then
        claude --dangerously-skip-permissions "$@"
    else
        tmux new-session -s "claude-$$" "claude --dangerously-skip-permissions $*"
    fi
}
ccc-t() {
    if [ -n "$TMUX" ]; then
        claude --dangerously-skip-permissions --continue "$@"
    else
        tmux new-session -s "claude-$$" "claude --dangerously-skip-permissions --continue $*"
    fi
}
ccr-t() {
    if [ -n "$TMUX" ]; then
        claude --dangerously-skip-permissions --resume "$@"
    else
        tmux new-session -s "claude-$$" "claude --dangerously-skip-permissions --resume $*"
    fi
}
alias claude-dev='claude --dangerously-skip-permissions --max-turns 10'
alias claude-safe='claude --permission-mode default'

# Utilitaires Claude Code
alias cc-usage='npx claude-code-usage@latest'
alias cc-logs='ls -lt ~/.claude/projects/*//*.jsonl 2>/dev/null | head -20 || echo "Aucun log trouvé"'
alias cc-doctor='claude doctor'
alias cc-mcp='claude mcp list'

# Raccourcis de développement
alias cc-python='claude --dangerously-skip-permissions --append-system-prompt "Use python-expert agent proactively"'
alias cc-ts='claude --dangerously-skip-permissions --append-system-prompt "Use typescript-expert agent proactively"'

# Fonctions utiles
ccproject() {
    if [[ -f ".claude/settings.json" ]]; then
        echo "📋 Using project settings"
        claude --dangerously-skip-permissions
    else
        echo "⚠️  No project settings found, using global settings"
        claude --dangerously-skip-permissions
    fi
}

cchelp() {
    echo "🤖 Claude Code - Raccourcis Disponibles:"
    echo ""
    echo "  cc          - Claude Code en mode YOLO"
    echo "  ccc         - Continue la dernière conversation en YOLO"
    echo "  ccr         - Resume une session spécifique"
    echo "  cc-t        - Claude Code en mode YOLO (tmux)"
    echo "  ccc-t       - Continue en YOLO (tmux)"
    echo "  ccr-t       - Resume une session (tmux)"
    echo "  claude-dev  - Mode développement (max 10 turns)"
    echo "  claude-safe - Mode sécurisé (demande permissions)"
    echo ""
    echo "  cc-usage    - Vérifier l'usage quotidien"
    echo "  cc-logs     - Voir les sessions récentes"
    echo "  cc-doctor   - Diagnostic Claude Code"
    echo "  cc-mcp      - Lister les serveurs MCP"
    echo ""
    echo "  cc-python   - Claude avec agent Python actif"
    echo "  cc-ts       - Claude avec agent TypeScript actif"
    echo ""
    echo "  ccproject   - Lance Claude avec détection projet"
    echo "  cchelp      - Affiche cette aide"
}

# Export des variables d'environnement Claude Code
export CLAUDE_CODE_ENABLE_TELEMETRY=1
export USE_BUILTIN_RIPGREP=0
export BASH_DEFAULT_TIMEOUT_MS=30000
export CLAUDE_CODE_DISABLE_TERMINAL_TITLE=0
export MAX_MCP_OUTPUT_TOKENS=50000

echo "✅ Claude Code aliases loaded! Type 'cchelp' for available commands."

# Claude secrets (clés API, tokens, etc.)
[ -f ~/.claude_secrets ] && source ~/.claude_secrets
