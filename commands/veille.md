# /veille - Veille des nouveautes Claude Code

Affiche les informations de veille et les sources a consulter, incluant la veille YouTube.

## Instructions

### 1. Veille Claude Code (versions et sources)

Execute le script de veille :
```bash
~/cc-config/scripts/veille.sh
```

Affiche un resume des informations :
- Version actuelle de Claude Code
- Derniere version disponible sur npm
- Sources de veille (changelog, GitHub, Discord)

Si l'utilisateur demande d'ouvrir les sources :
```bash
~/cc-config/scripts/veille.sh open
```

### 2. Veille YouTube (videos et transcripts)

Interroge l'API YouTube Veille pour afficher les dernieres videos :

```bash
# Videos recentes a transcrire
curl -s -u "$(cat ~/.claude/.veille-auth)" "https://veille-eric.francecentral.cloudapp.azure.com/api/videos?status=new" | python3 -c "
import json, sys
videos = json.load(sys.stdin)[:10]
for v in videos:
    mins = v['duration'] // 60
    print(f\"  [{v['status']}] {v['channelName']} - {v['title']} ({mins}min)\")
"

# Videos transcrites
curl -s -u "$(cat ~/.claude/.veille-auth)" "https://veille-eric.francecentral.cloudapp.azure.com/api/videos?status=transcribed"
```

### 3. Resume combine

Par defaut, `/veille` affiche :
1. Les versions Claude Code (script veille.sh)
2. Les 5 dernieres videos YouTube a transcrire
3. Les videos recemment transcrites (prets a lire)
4. Propose de consulter `docs/veille.md` pour les notes completes
5. Propose d'ouvrir l'app YouTube Veille dans le navigateur

## Options

- `/veille` - Resume complet (Claude Code + YouTube)
- `/veille open` - Ouvrir les sources dans le navigateur
- `/veille version` - Juste les versions Claude Code
- `/veille youtube` - Uniquement la veille YouTube (videos recentes + transcripts)
- `/veille transcript VIDEO_ID` - Afficher un transcript specifique
