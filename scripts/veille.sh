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

start_youtube_veille() {
    local yt_dir="$HOME/projects/youtube-veille"

    if [ ! -d "$yt_dir" ]; then
        echo -e "${YELLOW}[WARN]${NC} youtube-veille non installé"
        echo "       Repo: ~/projects/youtube-veille"
        return 1
    fi

    echo ""
    log "Lancement de YouTube Veille..."

    # Vérifier si déjà en cours
    if lsof -i :3000 &>/dev/null; then
        info "Serveur déjà actif sur http://localhost:3000"
    else
        cd "$yt_dir"
        npm run dev &>/dev/null &
        sleep 2
        info "Serveur démarré sur http://localhost:3000"
    fi

    # Ouvrir dans le navigateur
    local open_cmd=""
    if command -v xdg-open &> /dev/null; then
        open_cmd="xdg-open"
    elif command -v open &> /dev/null; then
        open_cmd="open"
    fi

    if [ -n "$open_cmd" ]; then
        $open_cmd "http://localhost:3000" 2>/dev/null &
    fi
}

list_transcripts() {
    local yt_dir="$HOME/projects/youtube-veille"
    local db="$yt_dir/data/youtube-veille.db"

    if [ ! -f "$db" ]; then
        echo "  (pas de transcriptions)"
        return
    fi

    echo ""
    log "Transcriptions disponibles"
    echo "─────────────────────────────────────"

    cd "$yt_dir" && node -e "
const Database = require('better-sqlite3');
const db = new Database('./data/youtube-veille.db');
const rows = db.prepare(\`
  SELECT v.title, t.source, date(t.created_at, 'unixepoch') as date
  FROM transcripts t
  JOIN videos v ON t.video_id = v.id
  ORDER BY t.created_at DESC
  LIMIT 10
\`).all();
rows.forEach(r => console.log('  📝 ' + r.title + ' (' + r.source + ', ' + r.date + ')'));
" 2>/dev/null
}

list_veille_items() {
    local yt_dir="$HOME/projects/youtube-veille"
    local db="$yt_dir/data/youtube-veille.db"

    if [ ! -f "$db" ]; then
        echo "  (pas d'items de veille)"
        return
    fi

    echo ""
    log "Items de veille"
    echo "─────────────────────────────────────"

    cd "$yt_dir" && node -e "
const Database = require('better-sqlite3');
const db = new Database('./data/youtube-veille.db');
const rows = db.prepare(\`
  SELECT id, title, status, source, date(created_at, 'unixepoch') as date
  FROM veille_items
  ORDER BY
    CASE status
      WHEN 'discovered' THEN 1
      WHEN 'testing' THEN 2
      WHEN 'applied' THEN 3
      WHEN 'rejected' THEN 4
    END,
    created_at DESC
\`).all();
const icons = { discovered: '🆕', testing: '🧪', applied: '✅', rejected: '❌' };
rows.forEach(r => console.log('  ' + (icons[r.status] || '❓') + ' [' + r.id + '] ' + r.title + ' (' + r.source + ')'));
if (rows.length === 0) console.log('  (aucun item)');
" 2>/dev/null
}

mark_veille_item() {
    local yt_dir="$HOME/projects/youtube-veille"
    local id="$1"
    local status="$2"

    if [ -z "$id" ] || [ -z "$status" ]; then
        echo "Usage: veille.sh mark <id> <status>"
        echo "Status: discovered, testing, applied, rejected"
        return 1
    fi

    cd "$yt_dir" && node -e "
const Database = require('better-sqlite3');
const db = new Database('./data/youtube-veille.db');
const now = Math.floor(Date.now() / 1000);
const appliedAt = '$status' === 'applied' ? now : null;
db.prepare('UPDATE veille_items SET status = ?, applied_at = ? WHERE id = ?').run('$status', appliedAt, $id);
console.log('Item $id marqué comme $status');
" 2>/dev/null
}

add_veille_item() {
    local yt_dir="$HOME/projects/youtube-veille"
    local title="$1"
    local source="${2:-manual}"

    if [ -z "$title" ]; then
        echo "Usage: veille.sh add \"<title>\" [source]"
        return 1
    fi

    cd "$yt_dir" && node -e "
const Database = require('better-sqlite3');
const db = new Database('./data/youtube-veille.db');
const now = Math.floor(Date.now() / 1000);
const result = db.prepare('INSERT INTO veille_items (title, source, status, created_at) VALUES (?, ?, ?, ?)').run('$title', '$source', 'discovered', now);
console.log('Item ajouté avec ID: ' + result.lastInsertRowid);
" 2>/dev/null
}

usage() {
    cat << EOF
Usage: $0 [command]

Commands:
  (aucun)     Affiche un résumé de veille
  open        Ouvre les sources dans le navigateur
  version     Affiche uniquement les versions
  youtube     Lance youtube-veille (http://localhost:3000)
  transcripts Liste les transcriptions récentes
  items       Liste les items de veille (features découvertes)
  add <title> Ajoute un item de veille
  mark <id> <status>  Change le statut (discovered/testing/applied/rejected)

EOF
}

case "${1:-}" in
    open)        open_sources ;;
    version)     show_current_version ;;
    youtube|yt)  start_youtube_veille ;;
    transcripts) list_transcripts ;;
    items)       list_veille_items ;;
    add)         add_veille_item "$2" "$3" ;;
    mark)        mark_veille_item "$2" "$3" ;;
    -h|--help)   usage ;;
    *)           quick_check ;;
esac
