# =============================================================================
# Claude Code + Codex CLI - Configuration Bash
# Source: cc-config/dotfiles/bashrc-claude.sh
# Installation: ajouté automatiquement par install.sh --shell (fallback bash)
#
# Convention :
#   cc*  -> Claude Code   (cc, ccc, ccr)
#   cx*  -> Codex CLI     (cx, cxc, cxr)
# Les deux outils sont disponibles en parallèle (utile quand l'un est dégradé).
# =============================================================================

# Send SIGHUP to child processes when shell exits (prevents orphan processes)
shopt -s huponexit

# -----------------------------------------------------------------------------
# Claude Code  (cc*)
# -----------------------------------------------------------------------------
alias cc='claude --dangerously-skip-permissions'
alias ccc='claude --dangerously-skip-permissions --continue'
alias ccr='claude --dangerously-skip-permissions --resume'

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

alias claude-safe='claude --permission-mode default'
alias claude-yolo='claude --dangerously-skip-permissions'

# Utilitaires Claude Code
alias cc-usage='npx claude-code-usage@latest'
alias cc-logs='ls -lt ~/.claude/projects/*/*.jsonl 2>/dev/null | head -20 || echo "Aucun log trouvé"'
alias cc-doctor='claude doctor'
alias cc-mcp='claude mcp list'
alias cc-python='claude --dangerously-skip-permissions --append-system-prompt "Use python-expert agent proactively"'
alias cc-ts='claude --dangerously-skip-permissions --append-system-prompt "Use typescript-expert agent proactively"'

# -----------------------------------------------------------------------------
# Codex CLI  (cx*)
# -----------------------------------------------------------------------------
alias cx='codex --dangerously-bypass-approvals-and-sandbox'
alias cxc='codex resume --last --dangerously-bypass-approvals-and-sandbox'
alias cxr='codex resume --dangerously-bypass-approvals-and-sandbox'

cx-t() {
    if [ -n "$TMUX" ]; then
        codex --dangerously-bypass-approvals-and-sandbox "$@"
    else
        tmux new-session -s "codex-$$" "codex --dangerously-bypass-approvals-and-sandbox $*"
    fi
}
cxc-t() {
    if [ -n "$TMUX" ]; then
        codex resume --last --dangerously-bypass-approvals-and-sandbox "$@"
    else
        tmux new-session -s "codex-$$" "codex resume --last --dangerously-bypass-approvals-and-sandbox $*"
    fi
}
cxr-t() {
    if [ -n "$TMUX" ]; then
        codex resume --dangerously-bypass-approvals-and-sandbox "$@"
    else
        tmux new-session -s "codex-$$" "codex resume --dangerously-bypass-approvals-and-sandbox $*"
    fi
}

alias codex-safe='codex --ask-for-approval on-request --sandbox workspace-write'
alias codex-yolo='codex --dangerously-bypass-approvals-and-sandbox'

# Utilitaires Codex CLI
alias cx-logs='find ~/.codex/sessions -name "*.jsonl" -type f -print 2>/dev/null | xargs ls -lt 2>/dev/null | head -20 || echo "Aucun log trouvé"'
alias cx-doctor='codex doctor'
alias cx-mcp='codex mcp list'
alias cx-app='codex app'
alias cx-sessions='codex resume --all'

# -----------------------------------------------------------------------------
# Fonctions
# -----------------------------------------------------------------------------
ccproject() {
    if [[ -f ".claude/settings.json" ]]; then
        echo "Using project Claude settings"
    else
        echo "No project Claude settings found, using global settings"
    fi
    claude --dangerously-skip-permissions
}

cxproject() {
    if [[ -f ".codex/config.toml" || -f "AGENTS.md" ]]; then
        echo "Using project Codex context"
    else
        echo "No project Codex context found, using global config"
    fi
    codex --dangerously-bypass-approvals-and-sandbox
}

cchelp() {
    echo "Claude Code + Codex - Raccourcis disponibles:"
    echo ""
    echo "  -- Claude Code (cc*) --"
    echo "  cc           - Claude Code en mode YOLO"
    echo "  ccc          - Continue la dernière conversation en YOLO"
    echo "  ccr          - Resume une session spécifique en YOLO"
    echo "  cc-t/ccc-t/ccr-t - Idem en tmux (Agent Teams)"
    echo "  claude-safe  - Mode sécurisé (demande permissions)"
    echo "  cc-usage     - Vérifier l'usage quotidien"
    echo "  cc-logs      - Voir les sessions récentes"
    echo "  cc-doctor    - Diagnostic Claude Code"
    echo "  cc-mcp       - Lister les serveurs MCP (Claude)"
    echo "  cc-python    - Claude avec agent Python actif"
    echo "  cc-ts        - Claude avec agent TypeScript actif"
    echo "  ccproject    - Lance Claude avec détection projet"
    echo ""
    echo "  -- Codex CLI (cx*) --"
    echo "  cx           - Codex en mode YOLO"
    echo "  cxc          - Continue la dernière session en YOLO"
    echo "  cxr          - Resume une session spécifique en YOLO"
    echo "  cx-t/cxc-t/cxr-t - Idem en tmux"
    echo "  codex-safe   - Mode sécurisé avec approbations"
    echo "  cx-logs      - Voir les sessions récentes"
    echo "  cx-doctor    - Diagnostic Codex"
    echo "  cx-mcp       - Lister les serveurs MCP (Codex)"
    echo "  cx-app       - Ouvrir Codex Desktop"
    echo "  cx-sessions  - Lister toutes les sessions resumables"
    echo "  cxproject    - Lance Codex avec détection projet"
    echo ""
    echo "  cchelp       - Affiche cette aide"
}

# -----------------------------------------------------------------------------
# Exports communs
# -----------------------------------------------------------------------------
export CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
export CLAUDE_CODE_ENABLE_TELEMETRY=1
export CLAUDE_CODE_DISABLE_TERMINAL_TITLE=0
export USE_BUILTIN_RIPGREP=0
export BASH_DEFAULT_TIMEOUT_MS=30000
export MAX_MCP_OUTPUT_TOKENS=50000

echo "Claude Code + Codex aliases loaded. Type 'cchelp' for available commands."

# Secrets (clés API, tokens, etc.)
[ -f ~/.codex_secrets ] && source ~/.codex_secrets
[ -f ~/.claude_secrets ] && source ~/.claude_secrets
