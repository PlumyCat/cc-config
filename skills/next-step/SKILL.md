---
name: next-step
description: Rappelle et propose des axes de prochaine action a la fin des tours de conversation. A utiliser pour les hooks Stop/fin de tour, les reponses de cloture, et les situations ou l'utilisateur risque de revenir plus tard sans se souvenir de la suite.
allowed-tools: Bash, Read
---

# Next Step

Donne a l'utilisateur une ou plusieurs pistes concretes pour reprendre facilement le fil au prochain tour.

## Regle de sortie

A la fin d'une reponse de cloture, ajoute un court bloc `Next steps` si la suite n'est pas deja explicite dans la reponse.

- Propose 1 a 3 actions maximum.
- Priorise les actions qui suivent naturellement du travail effectue: tester, relire le diff, installer, commit, ouvrir une PR, verifier un service, reprendre un ticket, documenter une decision.
- Si plusieurs directions sont plausibles, donne des axes distincts plutot qu'une seule injonction.
- Si aucun contexte concret n'est disponible, propose une reprise generale: demander un resume, demander de continuer, ou transformer les decisions en note/ticket.
- Reste bref; ce bloc doit aider la reprise, pas rouvrir toute l'analyse.

## Hook associe

Le hook global `next_steps.py` est installe sur l'evenement `Stop`.

Il sert de filet de securite quand une reponse se termine sans prochaines actions visibles:

```bash
~/.codex/hooks/next_steps.py
~/.claude/hooks/next_steps.py
```

Si le hook ne trouve pas de contexte specifique, il imprime une suggestion generale de reprise.
