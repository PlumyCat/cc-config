---
name: apex
description: Workflow structuré pour implémenter des features - Analyze → Plan → Execute → Validate → Examine → PR
argument-hint: "<description> [-a auto] [-t test] [-x examine] [-pr pull-request]"
allowed-tools: Bash, Read, Write, Edit, Grep, Glob, Task
---

# Apex Workflow

Workflow structuré pour implémenter des features de manière rigoureuse.

## Paramètres

| Flag | Description |
|------|-------------|
| `-a` | Mode auto : passe automatiquement de plan à execute sans confirmation |
| `-t` | Active les tests : lance et corrige les tests avant validation |
| `-x` | Active examine : lance une review de code par agents |
| `-pr` | Crée une pull request à la fin |

## Étapes du workflow

```
┌─────────┐   ┌──────┐   ┌─────────┐   ┌──────────┐
│ ANALYZE │ → │ PLAN │ → │ EXECUTE │ → │ VALIDATE │
└─────────┘   └──────┘   └─────────┘   └──────────┘
                                            │
                              ┌─────────────┴─────────────┐
                              ▼                           ▼
                        (si -t)                     (si -x)
                      ┌──────┐                    ┌─────────┐
                      │ TEST │                    │ EXAMINE │
                      └──────┘                    └─────────┘
                                                       │
                                                       ▼
                                                 (si -pr)
                                                 ┌────┐
                                                 │ PR │
                                                 └────┘
```

## Initialisation

1. Parse les arguments pour identifier les flags (-a, -t, -x, -pr)
2. La description de la feature est tout le texte qui n'est pas un flag
3. Affiche le récapitulatif des options activées

## Exécution

**IMPORTANT:** À chaque étape, lis le fichier correspondant dans `~/cc-config/skills/apex/steps/` :

### Étape 1: ANALYZE
Lis et exécute `~/cc-config/skills/apex/steps/analyze.md`

### Étape 2: PLAN
Lis et exécute `~/cc-config/skills/apex/steps/plan.md`
- Si mode auto (-a) : passe directement à EXECUTE
- Sinon : demande confirmation à l'utilisateur

### Étape 3: EXECUTE
Lis et exécute `~/cc-config/skills/apex/steps/execute.md`

### Étape 4: VALIDATE
Lis et exécute `~/cc-config/skills/apex/steps/validate.md`

### Étape 5: TEST (si -t)
Lis et exécute `~/cc-config/skills/apex/steps/test.md`
- Boucle jusqu'à ce que tous les tests passent

### Étape 6: EXAMINE (si -x)
Lis et exécute `~/cc-config/skills/apex/steps/examine.md`
- Lance des agents de review
- Corrige les issues trouvées

### Étape 7: PR (si -pr)
Lis et exécute `~/cc-config/skills/apex/steps/pr.md`
- Crée la pull request avec résumé

## Exemple d'utilisation

```bash
/apex Ajouter un bouton de logout dans le header -a -t
/apex Refactorer le système d'auth -x -pr
/apex Corriger le bug #123 -a -t -x -pr
```

## Next Step

Commence par parser les arguments, puis lis `~/cc-config/skills/apex/steps/analyze.md` pour démarrer.
