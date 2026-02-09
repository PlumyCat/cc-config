# Agent Teams - Guide d'utilisation

> Multi-agents paralleles natifs de Claude Code (Opus 4.6, experimental)

## Qu'est-ce que c'est ?

Agent Teams permet d'orchestrer **plusieurs instances Claude Code** travaillant en parallele. Un **lead agent** coordonne le travail et des **teammates** executent les taches de maniere autonome, chacun dans son propre contexte.

**Difference avec les subagents** : les teammates communiquent **entre eux** via mailbox + task list partagee. Les subagents ne font que retourner un resultat au caller.

| | Subagents | Agent Teams |
|---|---|---|
| **Contexte** | Propre, resultat retourne au caller | Propre, completement independant |
| **Communication** | Vers le parent uniquement | Entre tous les teammates |
| **Coordination** | Le parent gere tout | Task list partagee, self-claim |
| **Cout tokens** | Plus bas (resultat resume) | Plus eleve (~5x pour 5 agents) |
| **Usage ideal** | Taches focalisees | Travail collaboratif complexe |

## Activation

Dans `settings.json` :

```json
{
  "env": {
    "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1"
  }
}
```

## Architecture

| Composant | Role |
|-----------|------|
| **Team lead** | Session principale, cree la team, coordonne |
| **Teammates** | Instances Claude Code separees, travaillent sur les taches |
| **Task list** | Liste partagee avec dependances (DAG) |
| **Mailbox** | Communication inter-agents |

Stockage local :
- **Config team** : `~/.claude/teams/{team-name}/config.json`
- **Task list** : `~/.claude/tasks/{team-name}/`

## Demarrer une team

Demander en langage naturel. Claude cree la team, spawn les teammates et coordonne :

```
Cree une agent team pour reviewer la PR #142. Spawn 3 reviewers :
- Un focus securite
- Un focus performance
- Un focus couverture de tests
Qu'ils reviewent et reportent leurs findings.
```

Autre exemple (debug par hypotheses concurrentes) :

```
Les users reportent que l'app quitte apres un message au lieu de rester connectee.
Spawn 5 teammates pour investiguer differentes hypotheses. Qu'ils debattent
entre eux pour invalider les theories des autres, comme un debat scientifique.
```

## Commandes et raccourcis clavier

| Raccourci | Action |
|-----------|--------|
| `Shift+Tab` | **Delegate mode** - le lead ne code pas, coordination only |
| `Shift+Up` | Naviguer vers le teammate precedent |
| `Shift+Down` | Naviguer vers le teammate suivant |
| `Enter` | Voir la session d'un teammate (apres selection) |
| `Escape` | Interrompre le turn d'un teammate |
| `Ctrl+T` | Toggle la task list |

## Modes d'affichage

### In-process (defaut)

Tous les teammates dans le meme terminal. Navigation avec `Shift+Up/Down`.

### Split panes

Chaque teammate dans son propre pane. Necessite **tmux** ou **iTerm2**.

Configuration dans `settings.json` :

```json
{
  "teammateMode": "in-process"
}
```

Valeurs : `"auto"` (defaut), `"in-process"`, `"tmux"`

Flag CLI pour une session :

```bash
claude --teammate-mode in-process
```

## Gestion des taches

### Etats

`pending` → `in_progress` → `completed`

Les taches peuvent avoir des **dependances** : une tache bloquee ne peut etre claimee tant que ses dependances ne sont pas terminees.

### Attribution

- **Le lead assigne** : dire au lead quelle tache donner a quel teammate
- **Self-claim** : apres avoir fini, un teammate prend la prochaine tache non-assignee et non-bloquee

Le claiming utilise du **file locking** pour eviter les race conditions.

## Delegation et plan approval

### Delegate mode

Empeche le lead de coder. Il se concentre sur l'orchestration : spawn, messaging, taches.

Activer avec `Shift+Tab` apres avoir cree la team.

Utile quand le lead commence a implementer au lieu de deleguer :

```
Attends que tes teammates finissent leurs taches avant de continuer.
```

### Plan approval

Pour les taches complexes/risquees, exiger un plan avant implementation :

```
Spawn un teammate architecte pour refactorer le module auth.
Exige une approbation du plan avant tout changement.
```

Le teammate travaille en **read-only** jusqu'a approbation. Si rejete, il revise et resoumet.

Pour influencer les criteres :

```
N'approuve que les plans qui incluent des tests.
Rejette tout plan qui modifie le schema de la base.
```

## Communication

### Types de messages

| Type | Usage |
|------|-------|
| `message` | DM vers un teammate specifique |
| `broadcast` | Message a tous (couteux, utiliser rarement) |
| `shutdown_request` | Demander a un teammate de s'arreter |

### Livraison automatique

- Les messages arrivent automatiquement au lead
- Pas besoin de poll ou check periodique
- Les teammates envoient une notification idle quand ils finissent

### Parler directement a un teammate

- **In-process** : `Shift+Up/Down` pour selectionner, puis taper
- **Split panes** : cliquer dans le pane

## Hooks

| Hook | Description | Exit codes |
|------|-------------|------------|
| `TeammateIdle` | Quand un teammate finit sa tache | `0` = OK, `2` = keep working |
| `TaskCompleted` | Quand une tache est marquee complete | `0` = accept, `2` = reject |

Exemple : empecher un teammate de s'arreter tant que les tests ne passent pas :

```json
{
  "hooks": {
    "TeammateIdle": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "./scripts/check-teammate-done.sh"
          }
        ]
      }
    ]
  }
}
```

## Permissions

Les teammates heritent des permissions du lead au spawn. On peut modifier les modes individuellement apres, mais pas au moment du spawn.

Si le lead tourne avec `--dangerously-skip-permissions`, tous les teammates aussi.

**Tip** : pre-approuver les operations courantes dans les permissions avant de spawner pour eviter trop de prompts.

## Best practices

1. **5-6 taches par teammate** pour garder tout le monde productif
2. **Fichiers separes par teammate** - eviter les conflits de merge (2 teammates sur le meme fichier = overwrites)
3. **Commencer par review/recherche** avant des taches de code (moins de risque de coordination)
4. **Delegate mode** par defaut pour le lead (`Shift+Tab`)
5. **Plan approval** pour les taches risquees
6. **Donner du contexte** dans le spawn prompt (les teammates n'heritent pas de l'historique du lead)
7. **Monitorer et corriger** - ne pas laisser tourner sans surveillance trop longtemps
8. **Taches bien dimensionnees** : ni trop petites (overhead > benefice), ni trop grosses (risque de gaspillage)

## Cas d'usage types

| Cas d'usage | Description |
|-------------|-------------|
| **Code review parallele** | Chaque teammate review sous un angle different (securite, perf, tests) |
| **Debug par hypotheses** | Chaque teammate teste une theorie, debat pour invalider celles des autres |
| **Feature cross-layer** | Backend + frontend + tests en parallele |
| **Refactoring large-scale** | Decoupe par module/domaine |
| **Recherche exploratoire** | Chaque teammate explore un aspect different d'un probleme |

## Cleanup et shutdown

### Arreter un teammate

```
Demande au teammate researcher de s'arreter.
```

Le teammate peut approuver ou rejeter avec explication.

### Nettoyer la team

```
Clean up the team
```

**Important** : toujours arreter les teammates d'abord, puis cleanup depuis le lead (pas depuis un teammate).

## Troubleshooting

| Probleme | Solution |
|----------|----------|
| Teammates invisibles | `Shift+Down` pour cycler, ou verifier que la tache justifie une team |
| Trop de prompts de permissions | Pre-approuver les operations dans les settings |
| Teammate arrete sur erreur | Lui donner des instructions ou spawner un remplacant |
| Lead shutdown premature | Dire au lead d'attendre les teammates |
| Session tmux orpheline | `tmux ls` puis `tmux kill-session -t <name>` |
| Tache bloquee | Verifier si le travail est fait et mettre a jour le statut manuellement |

## Limitations actuelles

- Pas de `/resume` ou `/rewind` pour les teammates in-process
- 1 team par session maximum
- Pas de nested teams (team dans une team)
- Le lead est fixe (pas de promotion de teammate)
- Split panes uniquement avec tmux ou iTerm2 (pas VS Code terminal, Windows Terminal, Ghostty)
- Shutdown peut etre lent (attend la fin du tool call en cours)
- Le statut des taches peut avoir du lag

## Ressources

- [Documentation officielle](https://code.claude.com/docs/en/agent-teams)
- [Video Melvynx](https://www.youtube.com/watch?v=LuB6ZJI1wYo)
- [Video Bart](https://www.youtube.com/watch?v=VWngYUC63po)
