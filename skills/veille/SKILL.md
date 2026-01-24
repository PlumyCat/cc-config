---
name: veille
description: Affiche les informations de veille Claude Code, versions actuelles et sources à consulter. Utiliser quand on parle de nouveautés, mises à jour, ou changelog.
argument-hint: "[open|version]"
allowed-tools: Bash
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
- Sources de veille (changelog, GitHub, Discord)

### Ouvrir les sources
```bash
~/cc-config/scripts/veille.sh open
```

### Juste les versions
```bash
~/cc-config/scripts/veille.sh version
```

## Documentation associée

Consulter `~/cc-config/docs/veille.md` pour voir :
- Les nouveautés en attente de test
- Les features déjà adoptées
- Les notes de veille

## Sources de veille

- [Changelog officiel](https://code.claude.com/docs/en/changelog)
- [GitHub Claude Code](https://github.com/anthropics/claude-code)
- [Discord Anthropic](https://discord.gg/anthropic)
- [npm @anthropic-ai/claude-code](https://www.npmjs.com/package/@anthropic-ai/claude-code)
