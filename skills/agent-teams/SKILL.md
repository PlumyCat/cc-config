---
name: agent-teams
description: "Reference pour configurer et utiliser Agent Teams (multi-agents paralleles natifs)"
disable-model-invocation: true
---

# Agent Teams - Guide de reference

Feature experimentale Opus 4.6 permettant d'orchestrer plusieurs agents Claude en parallele.

## Activation

Dans `settings.json` > `env` :
```json
"CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1"
```

## Concepts

- **Lead agent** : orchestre, decoupe les taches et dispatche aux teammates
- **Teammates** : agents autonomes executant les taches en parallele
- **Mailbox** : communication inter-agents
- **Shared task list** : taches avec dependances (DAG)

## Configuration d'une team

Stockage : `~/.claude/teams/{name}/config.json`

Creer une team via la commande `/teams` ou manuellement :
```json
{
  "name": "my-team",
  "teammates": [
    { "name": "backend", "description": "Backend API development" },
    { "name": "frontend", "description": "Frontend UI development" },
    { "name": "tests", "description": "Test writing and validation" }
  ]
}
```

## Commandes clavier

| Raccourci | Action |
|-----------|--------|
| `Shift+Tab` | **Delegate mode** - le lead ne code pas, coordination only |
| `Shift+Up` | Naviguer vers le teammate precedent |
| `Shift+Down` | Naviguer vers le teammate suivant |

## Modes d'affichage

- **In-process** : navigation entre agents avec Shift+Up/Down
- **Split panes** : affichage simultane via tmux ou iTerm2

## Hooks disponibles

| Hook | Description | Exit codes |
|------|-------------|------------|
| `TeammateIdle` | Quand un teammate finit sa tache | `0` = OK, `2` = keep working |
| `TaskCompleted` | Quand une tache est terminee | `0` = accept, `2` = reject |

## Best practices

1. **5-6 taches par teammate** maximum pour une bonne performance
2. **Fichiers separes par teammate** - eviter les conflits de merge
3. **Commencer par un review** - le lead analyse le codebase avant de distribuer
4. **Plan approval** - exiger validation du plan avant implementation
5. **Delegate mode** par defaut pour le lead (Shift+Tab)

## Cas d'usage types

- **Code review parallele** : chaque teammate review un module different
- **Debug par hypotheses** : chaque teammate teste une hypothese concurrente
- **Feature cross-layer** : backend + frontend + tests en parallele
- **Refactoring large-scale** : decoupe par module/domaine

## Limitations actuelles

- Pas de `/resume` pour les teams
- 1 team par session maximum
- Pas de nested teams (team dans une team)
- Split panes uniquement avec tmux ou iTerm2
- Cout tokens ~5x pour 5 agents (chaque agent a son propre contexte)

## Difference avec les subagents

Les teammates **communiquent entre eux** via la mailbox et la task list partagee. Les subagents classiques ne font que retourner un resultat au caller.

## Ressources

- [Documentation officielle](https://code.claude.com/docs/en/agent-teams)
- [Video Melvynx](https://www.youtube.com/watch?v=LuB6ZJI1wYo)
- [Video Bart](https://www.youtube.com/watch?v=VWngYUC63po)
