# Apex Workflow - Guide d'utilisation

> Workflow structure pour implementer des features : Analyze → Plan → Execute → Validate → Examine → PR

## Qu'est-ce que c'est ?

Apex est un workflow en etapes pour implementer des features de maniere rigoureuse. Chaque etape est un fichier `.md` charge a la demande (lazy loading), ce qui garde le contexte propre.

Inspire du workflow presente par Melvynx, adapte a notre config.

## Commande

```bash
/apex <description de la feature> [-a] [-t] [-x] [-pr]
```

## Flags

| Flag | Description | Defaut |
|------|-------------|--------|
| `-a` | **Auto** : passe de Plan a Execute sans confirmation | Off |
| `-t` | **Test** : lance et corrige les tests avant validation | Off |
| `-x` | **Examine** : review de code par agents en parallele | Off |
| `-pr` | **Pull Request** : cree une PR a la fin | Off |

## Pipeline

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

## Etapes en detail

### 1. ANALYZE

Comprendre le contexte et la codebase.

**Actions :**
- Explorer les fichiers pertinents (Glob, Grep)
- Analyser l'architecture existante
- Identifier les dependances et risques
- Lister les cas limites

**Output :** Resume avec fichiers identifies, architecture, approche proposee, risques.

### 2. PLAN

Creer un plan d'implementation actionnable.

**Actions :**
- Decouper en taches atomiques (S/M/L)
- Definir les criteres de succes par tache
- Etablir l'ordre des dependances
- Prevoir le rollback

**Output :** Liste de taches avec fichiers, dependances et criteres.

**Si `-a` active :** Passe directement a Execute.
**Sinon :** Demande confirmation a l'utilisateur.

### 3. EXECUTE

Implementer le plan tache par tache.

**Regles :**
- Une tache a la fois, dans l'ordre
- Verifier le critere de succes avant de passer a la suivante
- Respecter les conventions de la codebase
- Pas de code mort, pas de console.log oublies

**Output :** Progression par tache (statut, fichiers modifies).

### 4. VALIDATE

Verifier que tout fonctionne.

**Actions :**
- Verification syntaxique (`tsc --noEmit`, lint, build)
- Verification fonctionnelle (criteres du plan)
- Review rapide (TODO/FIXME oublies, imports)

**En cas d'echec :** Identifier, corriger, re-valider.

### 5. TEST (si `-t`)

S'assurer que les tests passent.

**Actions :**
- Lancer les tests existants
- Analyser les echecs (regression ou test obsolete ?)
- Corriger le code ou le test
- Ajouter des tests si necessaire

**Boucle** jusqu'a ce que tous les tests passent.

### 6. EXAMINE (si `-x`)

Review de code automatisee par 3 agents en parallele.

| Agent | Focus |
|-------|-------|
| **Security Review** | Vulnerabilites, donnees sensibles, permissions |
| **Performance Review** | Operations couteuses, N+1, memory leaks |
| **Code Quality Review** | Duplication, fonctions trop longues, nommage |

**Priorisation des issues :**
- 🔴 Critique (securite, bugs) → corrige obligatoirement
- 🟡 Important (perf, maintenabilite) → corrige
- 🟢 Suggestion (style) → a discretion

### 7. PR (si `-pr`)

Creer une pull request propre.

**Actions :**
- Stage et commit les fichiers
- Creer une branche si necessaire
- Creer la PR via `gh pr create` avec template structure

**Conventions de commit :**

| Prefixe | Usage |
|---------|-------|
| `feat:` | Nouvelle fonctionnalite |
| `fix:` | Correction de bug |
| `refactor:` | Refactoring |
| `docs:` | Documentation |
| `test:` | Tests |
| `chore:` | Maintenance |

## Exemples d'utilisation

```bash
# Feature simple, mode auto
/apex Ajouter un bouton de logout dans le header -a

# Feature avec tests
/apex Corriger le bug #123 -a -t

# Feature complete avec review et PR
/apex Refactorer le systeme d'auth -t -x -pr

# Full pipeline automatique
/apex Ajouter le support dark mode -a -t -x -pr
```

## Quand utiliser Apex ?

| Situation | Recommendation |
|-----------|---------------|
| Bug simple, fix rapide | Pas besoin d'Apex |
| Feature moyenne, bien definie | `/apex description -a -t` |
| Feature complexe, multi-fichiers | `/apex description -t -x` |
| Feature prete pour merge | `/apex description -a -t -x -pr` |
| Exploration/prototypage | Pas besoin d'Apex |

## Comment ca marche techniquement

Chaque etape est un fichier Markdown dans `~/cc-config/skills/apex/steps/` :
- `analyze.md`, `plan.md`, `execute.md`, `validate.md`
- `test.md`, `examine.md`, `pr.md`

Le skill charge chaque fichier **a la demande** (lazy loading). Avantage : le prompt de chaque etape reste en fin de contexte, ce qui lui donne une meilleure priorite.

## Differences avec EPCT

| | Apex | EPCT |
|---|---|---|
| **Etapes** | 7 (modulaires via flags) | 4 (fixes) |
| **Review auto** | Oui (`-x` avec 3 agents) | Non |
| **PR auto** | Oui (`-pr`) | Non |
| **Mode auto** | Oui (`-a`) | Non |
| **Usage** | Features completes | Taches plus courtes |
