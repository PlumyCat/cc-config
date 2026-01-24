---
name: veille
description: Veille technologique Claude Code - versions, sources, YouTube transcripts et analyse des nouveautés
argument-hint: "[youtube|analyze|open|version]"
allowed-tools: Bash, Read, Write, WebFetch
context:
  - "~/cc-config/docs/veille.md"
  - "~/projects/youtube-veille/data/youtube-veille.db"
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

### 3. Voir les transcriptions
```bash
~/cc-config/scripts/veille.sh transcripts
```

### 4. Analyser les transcriptions (Claude)

Quand l'utilisateur demande d'analyser les nouveautés :

1. **Lire les transcriptions récentes** depuis la DB SQLite :
   ```sql
   SELECT v.title, v.id, t.content
   FROM transcripts t
   JOIN videos v ON t.video_id = v.id
   WHERE v.status IN ('transcribed', 'read')
   ORDER BY t.created_at DESC
   LIMIT 5;
   ```

2. **Extraire les points clés** de chaque transcription :
   - Nouvelles fonctionnalités Claude Code
   - Bonnes pratiques mentionnées
   - Tips et astuces
   - Changements d'API ou de comportement

3. **Créer un rapport de veille** dans `~/cc-config/docs/veille.md` :
   - Date et source (titre vidéo)
   - Points clés résumés
   - Actions à tester (si pertinent)

4. **Proposer les prochaines étapes** :
   - Ajouter au backlog les features à tester
   - Créer une branche expérimentale si nécessaire
   - Documenter dans CLAUDE.md si utile

### 5. Ouvrir les sources web
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
| Prompt Engineering | Tutoriels |
| All About AI | Demos pratiques |
| Alex so yes (FR) | Dev & IA |
| Melvyn X (FR) | Dev & IA |
| Benjamin Code (FR) | Dev & IA |

## Workflow type

```
/veille youtube          # Ouvrir l'app, ajouter vidéos, transcrire
/veille analyze          # Analyser les transcripts et documenter
/veille                  # Vérifier versions et sources
```

## Base de données

La DB SQLite `~/projects/youtube-veille/data/youtube-veille.db` contient :
- `channels` : Chaînes suivies
- `videos` : Vidéos avec statut (new/transcribed/read)
- `transcripts` : Contenu des transcriptions
