---
name: veille
description: Affiche les informations de veille Claude Code, versions actuelles et sources à consulter. Utiliser quand on parle de nouveautés, mises à jour, ou changelog.
argument-hint: "[open|version]"
allowed-tools: Bash, Read
context:
  - "~/cc-config/docs/veille.md"
---

# Veille des nouveautés Claude Code

Affiche les informations de veille et les sources à consulter.

## Actions

### Résumé rapide (défaut)
```bash
~/cc-config/scripts/veille.sh
```
- Version actuelle de Claude Code
- Dernière version disponible sur npm
- Sources de veille complètes

### Ouvrir les sources
```bash
~/cc-config/scripts/veille.sh open
```

### Juste les versions
```bash
~/cc-config/scripts/veille.sh version
```

### Afficher les notes de veille
Lire `~/cc-config/docs/veille.md` pour voir l'historique complet.

## Sources officielles

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

## Chaînes YouTube

| Chaîne | Focus |
|--------|-------|
| [Anthropic](https://www.youtube.com/@anthropic-ai) | Officiel |
| [AI Explained](https://www.youtube.com/@aiexplained-official) | News AI |
| [Matthew Berman](https://www.youtube.com/@matthew_berman) | Reviews outils AI |
| [Prompt Engineering](https://www.youtube.com/@PromptEngineering) | Tutoriels |
| [All About AI](https://www.youtube.com/@AllAboutAI) | Demos pratiques |
| [Alex so yes](https://www.youtube.com/@alexsoyes) | Dev & IA (FR) |
| [Melvyn X](https://www.youtube.com/@melvynxdev) | Dev & IA (FR) |
| [Benjamin Code](https://www.youtube.com/@BenjaminCode) | Dev & IA (FR) |

## Documentation complète

Le fichier `~/cc-config/docs/veille.md` (chargé en contexte) contient :
- Historique des nouveautés testées et adoptées
- Notes de veille détaillées
- Process de veille hebdomadaire
- Documentation BMAD Method
