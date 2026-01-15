# /veille - Veille des nouveautés Claude Code

Affiche les informations de veille et les sources à consulter.

## Instructions

1. Exécute le script de veille :
   ```bash
   ~/cc-config/scripts/veille.sh
   ```

2. Affiche un résumé des informations :
   - Version actuelle de Claude Code
   - Dernière version disponible sur npm
   - Sources de veille (changelog, GitHub, Discord)

3. Si l'utilisateur demande d'ouvrir les sources :
   ```bash
   ~/cc-config/scripts/veille.sh open
   ```

4. Propose de consulter le fichier `docs/veille.md` pour voir :
   - Les nouveautés en attente de test
   - Les features déjà adoptées
   - Les notes de veille

## Options

- `/veille` - Résumé rapide
- `/veille open` - Ouvrir les sources dans le navigateur
- `/veille version` - Juste les versions
