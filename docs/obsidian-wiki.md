# Obsidian Wiki — Memory pour Claude Code

> Pattern LLM Wiki (Karpathy) + plugin claude-obsidian (AgriciDaniel) pour transformer Obsidian en mémoire persistante et cross-référencée par projet.

## Pourquoi

Claude Code n'a pas de mémoire entre sessions. Pour les projets riches en docs (specs, stories, décisions, comptes-rendus), recharger le contexte coûte des tokens et reste partiel. Le pattern wiki :

- **Ingère** les sources brutes une fois → crée 8-15 pages de wiki par source (entités, concepts, décisions, cross-refs)
- **Query** lit d'abord `hot.md` (cache 500 mots) puis `index.md` puis les pages → ~10× moins de tokens qu'un grep
- **Lint** détecte orphelins, dead links, sections vides

Gain mesuré par les premiers retours : 60-90% de tokens économisés sur les recherches répétées.

---

## Architecture des dossiers

### Vaults (un par projet)

```
~/projects/memories/                  ← parent NON-git, juste un dossier
├── veille-rd/                        ← repo git indépendant (mode E Research)
│   ├── .git/
│   ├── .obsidian/                    ← config Obsidian (plugins, snippets)
│   ├── wiki/                         ← le wiki proprement dit
│   │   ├── index.md                  ← catalogue navigable
│   │   ├── hot.md                    ← cache ~500 mots, contexte récent
│   │   ├── log.md                    ← journal append-only
│   │   ├── overview.md               ← vue d'ensemble
│   │   ├── domains/                  ← un dossier par grand thème
│   │   ├── entities/                 ← personnes, repos, outils
│   │   ├── concepts/                 ← idées, patterns
│   │   ├── sources/                  ← références à des docs externes
│   │   └── meta/                     ← sessions, décisions, notes méta
│   └── .raw/                         ← sources brutes à ingérer (transcripts, articles)
└── bot-front/                        ← autre vault, autre projet
    └── ... (même structure)
```

**Règle d'or** : un vault est **hors** du repo du projet code.
- ❌ `~/projects/bot-front/wiki/` (mélange code et mémoire)
- ✅ `~/projects/memories/bot-front/` (séparé)

### Lien projet code → vault

Chaque projet code a un `CLAUDE.md` qui pointe vers son vault :

```markdown
# <projet> — Memory Pointer
- Vault: `~/projects/memories/<projet>/`
- Read `wiki/hot.md` at session start
- Don't run /claude-obsidian:wiki here (would scaffold a new vault)
```

### Repos GitHub

Chaque vault peut être un repo privé indépendant (recommandé pour backup) :
- `memories-veille-rd` → veille R&D Claude Code
- `memories-bot-front` → projet bot-front
- (futurs vaults : un repo privé chacun)

---

## Installation (sur une nouvelle machine ou pour un nouveau vault)

### Prérequis

```bash
brew install --cask obsidian       # si pas déjà installé
brew install util-linux             # pour `flock` (DragonScale Mechanism 2)
echo 'export PATH="/opt/homebrew/opt/util-linux/bin:$PATH"' >> ~/.zshrc
```

### Premier vault (et plugin Claude Code)

```bash
# 1. Cloner comme vault
mkdir -p ~/projects/memories && cd ~/projects/memories
git clone https://github.com/AgriciDaniel/claude-obsidian <nom-vault>
cd <nom-vault> && bash bin/setup-vault.sh

# 2. (Optionnel) Init git clean pour ne pas pousser l'historique upstream
rm -rf .git && git init -b main
git add -A && git commit -m "init: vault scaffold"

# 3. (Optionnel) Repo GitHub privé
gh repo create memories-<nom-vault> --private --source=. --remote=origin --push

# 4. Plugin Claude Code (une seule fois pour tous les vaults)
claude plugin marketplace add AgriciDaniel/claude-obsidian
claude plugin install claude-obsidian@claude-obsidian-marketplace
```

### Côté Obsidian (UI, par vault)

1. Manage Vaults → **Open folder as vault** → choisir le dossier
2. **Trust author and enable plugins**
3. Settings → Community plugins → Browse → installer :
   - **Local REST API** (obligatoire pour le MCP)
   - Templater, Obsidian Git, Dataview (recommandés)
4. Settings → Local REST API → **toggle "Enable Non-encrypted (HTTP) Server"** (port 27123)
5. Copier l'API Key affichée

### MCP Claude Code (une seule fois, puis partagé)

**Premier vault** :

```bash
echo 'export OBSIDIAN_API_KEY="<clé du plugin>"' >> ~/.zshrc
source ~/.zshrc

claude mcp add --transport http --scope user obsidian \
  "http://127.0.0.1:27123/mcp/" \
  --header "Authorization: Bearer $OBSIDIAN_API_KEY"
```

**Vaults suivants** — le plugin REST API génère une clé par vault, **on force la même clé partout** :

```bash
# Quitter Obsidian d'abord (libère data.json)
pkill -x Obsidian && sleep 2

# Copier la clé du premier vault dans le nouveau
SHARED_KEY=$(jq -r .apiKey ~/projects/memories/<vault-existant>/.obsidian/plugins/obsidian-local-rest-api/data.json)
jq --arg k "$SHARED_KEY" '.apiKey = $k' \
  ~/projects/memories/<nouveau-vault>/.obsidian/plugins/obsidian-local-rest-api/data.json \
  > /tmp/d.json && mv /tmp/d.json ~/projects/memories/<nouveau-vault>/.obsidian/plugins/obsidian-local-rest-api/data.json
```

### Bootstrap du vault

```bash
cd ~/projects/memories/<nom-vault> && claude
```

Dans la session : `/claude-obsidian:wiki` puis répondre à *"What is this vault for?"* avec une description claire (mode B/C/D/E + sources principales + objectif).

### CLAUDE.md du projet code

Créer `~/projects/<projet>/CLAUDE.md` qui pointe vers le vault (cf. exemple dans `~/projects/bot-front/CLAUDE.md`).

---

## Usage quotidien

### Démarrage d'une session

1. **Switcher le vault actif dans Obsidian** au projet sur lequel tu vas bosser (sélecteur en bas à gauche)
2. Le hook `SessionStart` (`~/.claude/scripts/obsidian-autostart.sh`) lance Obsidian si pas déjà ouvert, et attend que le port 27123 réponde (~2.5s)
3. Le `CLAUDE.md` du projet dit à Claude de lire `wiki/hot.md` au démarrage

### Les 6 commandes essentielles

| Commande | Quand | Effet |
|----------|-------|-------|
| `ingest <fichier>` | Nouveau doc/source à ajouter à la mémoire | Crée 8-15 pages, met à jour index/log/hot |
| `ingest all in .raw/` | Batch initial ou rattrapage | Idem en boucle sur tout `.raw/` |
| `what do you know about <X>?` | Question sur un concept déjà ingéré | Lit hot → index → pages, répond avec wikilinks |
| `/claude-obsidian:save` | Bonne conversation à archiver | Note structurée filée dans le vault |
| `/claude-obsidian:autoresearch <sujet>` | Recherche web + ingestion auto | Boucle web→fetch→synth→file |
| `lint the wiki` | Hebdo / après gros ingest | Détecte orphelins, dead links, gaps |

### Où déposer les sources à ingérer

- **`<vault>/.raw/`** : tu y déposes les fichiers à ingérer (transcripts, PDF, articles MD, etc.)
- L'ingest peut aussi pointer un chemin absolu hors vault : `ingest /Users/ericfer/projects/bot-front/docs/prd.md`

### Rythme conseillé

- **Au quotidien** : `what do you know about...` quand tu as besoin de retrouver du contexte ; `/save` à la fin d'une session importante
- **Quand tu rencontres une nouvelle source** (compte-rendu, ADR, doc client) : `ingest <fichier>`
- **1×/semaine** : `lint the wiki` pour la maintenance ; `wiki-fold` si le log dépasse 50 entrées

---

## Multi-vaults — savoir où on est

**Limite structurelle** : le plugin Local REST API ne sert qu'**un seul vault à la fois** — celui actif dans Obsidian.

Conséquence : avant de bosser sur un projet, **switcher le vault actif** dans Obsidian. Sinon Claude écrit/lit dans le mauvais vault.

Reflexes :
- Au démarrage de session Claude Code sur projet X → vérifier que le vault X est ouvert dans Obsidian
- En cas de doute : `curl -s -H "Authorization: Bearer $OBSIDIAN_API_KEY" http://127.0.0.1:27123/vault/` montre le contenu du vault actif

---

## Troubleshooting rapide

| Symptôme | Cause probable | Fix |
|----------|----------------|-----|
| `obsidian: ✗ Failed to connect` dans `claude mcp list` | Obsidian fermé ou plugin REST API désactivé | Lancer Obsidian, vérifier Settings → Local REST API |
| `401 Authorization required` sur endpoint | Clé MCP ≠ clé du vault actif | Synchroniser les clés (voir section Installation) |
| Réponse mentionne des pages d'un autre vault | Mauvais vault actif dans Obsidian | Switcher de vault dans Obsidian, relancer Claude Code |
| `Failed to connect` sur HTTPS 27124 | Cert auto-signé refusé | Utiliser HTTP 27123 (toggle "Enable Non-encrypted HTTP Server" du plugin) |
| Pages ingérées sans `address:` frontmatter | `flock` absent | `brew install util-linux` + PATH `bin` (pas `sbin`) |
| Hook auto-start Obsidian ne lance rien | Permission ou Obsidian pas installé | `tail /tmp/obsidian-autostart.log` pour debug |

---

## Rollback

Désactivation rapide (réversible) :

```bash
claude plugin disable claude-obsidian        # désactive sans supprimer
claude mcp remove -s user obsidian            # MCP off partout
```

Rollback complet :

```bash
claude plugin uninstall claude-obsidian
claude plugin marketplace remove claude-obsidian-marketplace
claude mcp remove -s user obsidian
# Vaults sur disque : tu décides quand supprimer ~/projects/memories/
# OBSIDIAN_API_KEY dans ~/.zshrc : inoffensive, peut rester
```

Backups conservés en local :
- `~/.claude/settings.json.bak.pre-obsidian-autostart`
- `~/Library/Application Support/obsidian/obsidian.json.bak.*`

---

## Références

- Plan d'installation : `~/.claude/plans/linked-yawning-prism.md`
- Note d'install détaillée (decisions + frictions) : `~/projects/memories/veille-rd/wiki/meta/2026-05-26-claude-obsidian-install-macos.md`
- Tableau de bord éval : `~/projects/memories/veille-rd/wiki/_eval.md`
- Pattern Karpathy : https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
- Plugin claude-obsidian : https://github.com/AgriciDaniel/claude-obsidian
