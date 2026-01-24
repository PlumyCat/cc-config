---
name: veille
description: Veille technologique Claude Code - versions, sources, YouTube transcripts et analyse des nouveautés
argument-hint: "[youtube|analyze|items|open|version]"
allowed-tools: Bash, Read, Write, WebFetch
context:
  - "~/cc-config/docs/veille.md"
---

# Veille des nouveautés Claude Code

Workflow complet de veille technologique : sources, vidéos YouTube et analyse.

## Actions disponibles

### 1. Résumé rapide (défaut)
```bash
~/cc-config/scripts/veille.sh
```
Affiche versions, sources et nouveautés en attente.

### 2. Lancer YouTube Veille
```bash
~/cc-config/scripts/veille.sh youtube
```
- Démarre le serveur http://localhost:3000
- Ouvre l'interface pour gérer chaînes et transcriptions

### 3. Voir les items de veille
```bash
~/cc-config/scripts/veille.sh items
```
Liste les features découvertes avec leur statut (🆕 discovered, 🧪 testing, ✅ applied, ❌ rejected)

### 4. Analyser les transcriptions (Claude)

Quand l'utilisateur demande d'analyser les nouveautés :

1. **Vérifier les items existants** dans la table `veille_items` :
   ```bash
   cd ~/projects/youtube-veille && node -e "
   const Database = require('better-sqlite3');
   const db = new Database('./data/youtube-veille.db');
   const items = db.prepare('SELECT title, status FROM veille_items').all();
   console.log(JSON.stringify(items));
   "
   ```

2. **Lire les transcriptions récentes** :
   ```bash
   cd ~/projects/youtube-veille && node -e "
   const Database = require('better-sqlite3');
   const db = new Database('./data/youtube-veille.db');
   const rows = db.prepare(\`
     SELECT v.id, v.title, t.content
     FROM transcripts t
     JOIN videos v ON t.video_id = v.id
     ORDER BY t.created_at DESC
     LIMIT 5
   \`).all();
   console.log(JSON.stringify(rows));
   "
   ```

3. **Extraire les points clés** (ignorer ceux déjà dans veille_items) :
   - Nouvelles fonctionnalités Claude Code
   - Bonnes pratiques mentionnées
   - Tips et astuces

4. **Ajouter les nouveaux items** à la DB :
   ```bash
   ~/cc-config/scripts/veille.sh add "Nom de la feature" "youtube"
   ```

5. **Mettre à jour veille.md** avec le rapport

### 5. Marquer un item comme appliqué
```bash
~/cc-config/scripts/veille.sh mark <id> applied
```
Statuts possibles : `discovered`, `testing`, `applied`, `rejected`

### 6. Ouvrir les sources web
```bash
~/cc-config/scripts/veille.sh open
```

## Sources officielles

| Source | URL |
|--------|-----|
| Changelog officiel | https://docs.anthropic.com/en/docs/claude-code/changelog |
| GitHub Releases | https://github.com/anthropics/claude-code/releases |
| Blog Anthropic | https://www.anthropic.com/news |
| npm | https://www.npmjs.com/package/@anthropic-ai/claude-code |

## Chaînes YouTube (configurées dans youtube-veille)

| Chaîne | Focus |
|--------|-------|
| Anthropic | Officiel |
| AI Explained | News AI |
| Matthew Berman | Reviews outils AI |
| All About AI | Demos pratiques |
| Melvyn X (FR) | Dev & IA |
| Benjamin Code (FR) | Dev & IA |

## Workflow type

```
/veille youtube          # Ouvrir l'app, transcrire des vidéos
/veille analyze          # Analyser et ajouter à la DB
/veille items            # Voir les features découvertes
/veille mark 3 applied   # Marquer comme appliqué
```

## Base de données

La DB SQLite `~/projects/youtube-veille/data/youtube-veille.db` contient :
- `channels` : Chaînes suivies
- `videos` : Vidéos avec statut (new/transcribed/read)
- `transcripts` : Contenu des transcriptions
- `veille_items` : Features découvertes avec statut de suivi
