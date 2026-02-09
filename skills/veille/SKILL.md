---
name: veille
description: Affiche les informations de veille Claude Code, versions actuelles et sources a consulter. Inclut la veille YouTube avec videos et transcripts. Utiliser quand on parle de nouveautes, mises a jour, changelog, ou veille YouTube.
allowed-tools: Bash, Read
context:
  - "~/cc-config/docs/veille.md"
---

# Veille des nouveautes Claude Code + YouTube

Affiche les informations de veille et les sources a consulter, incluant la veille YouTube.

## Actions

### Resume complet (defaut)

1. Executer le script de veille Claude Code :
```bash
~/cc-config/scripts/veille.sh
```

2. Recuperer les dernieres videos YouTube a transcrire :
```bash
curl -s -u "$(cat ~/.claude/.veille-auth)" "https://veille-eric.francecentral.cloudapp.azure.com/api/videos?status=new" | python3 -c "
import json, sys
videos = json.load(sys.stdin)[:10]
for v in videos:
    mins = v['duration'] // 60
    status = 'NEW' if v['status'] == 'new' else v['status'].upper()
    print(f'  [{status}] {v[\"channelName\"]} - {v[\"title\"]} ({mins}min)')
"
```

3. Recuperer les videos recemment transcrites :
```bash
curl -s -u "$(cat ~/.claude/.veille-auth)" "https://veille-eric.francecentral.cloudapp.azure.com/api/videos?status=transcribed" | python3 -c "
import json, sys
videos = json.load(sys.stdin)[:5]
for v in videos:
    mins = v['duration'] // 60
    print(f'  [TRANSCRIT] {v[\"channelName\"]} - {v[\"title\"]} ({mins}min) - ID: {v[\"id\"]}')
"
```

4. Afficher un resume combine avec les deux sources.

### Ouvrir les sources
```bash
~/cc-config/scripts/veille.sh open
```

### Ouvrir YouTube Veille dans le navigateur
```bash
xdg-open "https://$(cat ~/.claude/.veille-auth)@veille-eric.francecentral.cloudapp.azure.com" 2>/dev/null &
```

### Juste les versions
```bash
~/cc-config/scripts/veille.sh version
```

### Veille YouTube uniquement

Lister les videos :
```bash
curl -s -u "$(cat ~/.claude/.veille-auth)" "https://veille-eric.francecentral.cloudapp.azure.com/api/videos?status=new"
```

### Lire un transcript
```bash
curl -s -u "$(cat ~/.claude/.veille-auth)" "https://veille-eric.francecentral.cloudapp.azure.com/api/transcribe?videoId=VIDEO_ID"
```

### Lister les chaines suivies
```bash
curl -s -u "$(cat ~/.claude/.veille-auth)" "https://veille-eric.francecentral.cloudapp.azure.com/api/channels"
```

### Afficher les notes de veille
Lire `~/cc-config/docs/veille.md` pour voir l'historique complet.

## YouTube Veille - API

Base URL : `https://veille-eric.francecentral.cloudapp.azure.com`
Auth : Basic Auth (`$(cat ~/.claude/.veille-auth)`)

| Endpoint | Description |
|----------|-------------|
| `GET /api/videos` | Liste toutes les videos |
| `GET /api/videos?status=new` | Videos a transcrire |
| `GET /api/videos?status=transcribed` | Videos transcrites |
| `GET /api/videos?status=read` | Videos lues |
| `GET /api/videos/{id}` | Details d'une video |
| `GET /api/channels` | Chaines suivies |
| `GET /api/transcribe?videoId={id}` | Recuperer le transcript |

### Structure d'une video

```json
{
  "id": "VIDEO_YT_ID",
  "channelId": "CHANNEL_ID",
  "title": "Titre de la video",
  "channelName": "Nom de la chaine",
  "publishedAt": "2026-02-06T17:00:38.000Z",
  "duration": 1294,
  "status": "new|transcribed|read",
  "hasTranscript": true
}
```

### Structure d'un transcript

```json
{
  "videoId": "VIDEO_YT_ID",
  "content": "Texte complet du transcript...",
  "source": "youtube_captions",
  "segmentsCount": 1,
  "createdAt": "2026-02-07T05:34:35.000Z"
}
```

## Sources officielles Claude Code

| Source | URL |
|--------|-----|
| Changelog officiel | https://docs.anthropic.com/en/docs/claude-code/changelog |
| GitHub Releases | https://github.com/anthropics/claude-code/releases |
| Blog Anthropic | https://www.anthropic.com/news |
| Discord Anthropic | https://discord.gg/anthropic |
| npm | https://www.npmjs.com/package/@anthropic-ai/claude-code |

## Sources communautaires

| Source | URL |
|--------|-----|
| Reddit r/ClaudeAI | https://reddit.com/r/ClaudeAI |
| Twitter/X #ClaudeCode | https://x.com/search?q=claudecode |
| GitHub Issues | https://github.com/anthropics/claude-code/issues |

## Documentation complete

Le fichier `~/cc-config/docs/veille.md` (charge en contexte) contient :
- Historique des nouveautes testees et adoptees
- Notes de veille detaillees
- Process de veille hebdomadaire
- Documentation BMAD Method
