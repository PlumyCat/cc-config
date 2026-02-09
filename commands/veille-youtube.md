# /veille-youtube - YouTube Veille

Ouvre et interagit avec l'application YouTube Veille deployee sur Azure.

## Instructions

1. Ouvre l'URL avec Basic Auth integree dans le navigateur :
   ```bash
   xdg-open "https://$(cat ~/.claude/.veille-auth)@veille-eric.francecentral.cloudapp.azure.com" 2>/dev/null &
   ```

2. Affiche un resume :
   - URL : `https://veille-eric.francecentral.cloudapp.azure.com`
   - Connexion automatique avec Basic Auth
   - Si le site ne repond pas, verifier que la VM Azure est demarree

## API disponible

Base URL : `https://veille-eric.francecentral.cloudapp.azure.com`
Auth : Basic Auth (credentials dans `~/.claude/.veille-auth`)

| Endpoint | Description |
|----------|-------------|
| `GET /api/videos` | Liste toutes les videos |
| `GET /api/videos?status=new` | Videos a transcrire |
| `GET /api/videos?status=transcribed` | Videos transcrites |
| `GET /api/videos?status=read` | Videos lues |
| `GET /api/videos/{id}` | Details d'une video |
| `GET /api/channels` | Chaines suivies |
| `GET /api/transcribe?videoId={id}` | Recuperer le transcript d'une video |

### Exemples curl

```bash
# Lister les videos a transcrire
AUTH=$(cat ~/.claude/.veille-auth)

# Lister les videos a transcrire
curl -s -u "$AUTH" "https://veille-eric.francecentral.cloudapp.azure.com/api/videos?status=new"

# Recuperer un transcript
curl -s -u "$AUTH" "https://veille-eric.francecentral.cloudapp.azure.com/api/transcribe?videoId=VIDEO_ID"

# Lister les chaines suivies
curl -s -u "$AUTH" "https://veille-eric.francecentral.cloudapp.azure.com/api/channels"

# Verifier le status du site
curl -s -o /dev/null -w "%{http_code}" -u "$AUTH" "https://veille-eric.francecentral.cloudapp.azure.com"
```

## Options

- `/veille-youtube` - Ouvre l'app dans le navigateur
- `/veille-youtube status` - Verifie que l'app est en ligne (curl)
- `/veille-youtube new` - Affiche les videos a transcrire
- `/veille-youtube transcribed` - Affiche les videos transcrites
- `/veille-youtube channels` - Liste les chaines suivies
- `/veille-youtube transcript VIDEO_ID` - Affiche le transcript d'une video
