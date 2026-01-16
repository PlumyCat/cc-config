# Backlog

Idées, choses à tester, améliorations futures.

## Statuts
- 🔴 À faire
- 🟡 En cours / En test
- 🟢 Fait
- ❌ Abandonné

---

## À tester

| Priorité | Item | Status | Notes |
|----------|------|--------|-------|
| 🔥 Haute | BMAD Method v6 | 🟢 Fait | Framework agents agile pour Claude Code - Adopté 2025-01-16 |

---

## Idées de commands

- [ ] `/commit-smart` - Commit avec message auto-généré
- [ ] `/pr-review` - Review de PR GitHub
- [ ] `/explain-error` - Expliquer une stacktrace

---

## Idées d'agents

- [ ] `devops-expert` - CI/CD, Docker, K8s
- [ ] `sql-expert` - Requêtes et optimisation SQL

---

## Améliorations config

- [ ] Ajouter plus de permissions granulaires
- [ ] Hook pre-commit pour validation
- [ ] Intégration avec mes outils custom

---

## Nouveautés Claude Code à explorer

<!-- Rempli via la veille -->

| Version | Feature | Testé | Adopté |
|---------|---------|-------|--------|
| | | | |

---

## Notes

<!-- Idées en vrac, à trier plus tard -->

- [ ] voir comment et ce que peut apporter pour le projet be-cloud.ai Ralph (2025-01-16)

---

## Plan d'installation BMAD Method v6

### Option recommandée : claude-code-bmad-skills
Version légère, sans dépendances externes, utilise le système natif de skills.

### Étapes d'installation

```bash
# 1. Créer branche experimental
./scripts/experimental.sh start bmad-method

# 2. Cloner le repo des skills
cd /tmp
git clone https://github.com/aj-geddes/claude-code-bmad-skills.git
cd claude-code-bmad-skills

# 3. Exécuter l'installeur
chmod +x install-v6.sh
./install-v6.sh

# 4. Redémarrer Claude Code
# Les skills sont chargés au démarrage

# 5. Initialiser dans un projet test
/workflow-init
```

### Tests à effectuer

1. **Test basique** - Lancer `/workflow-init` sur un petit projet
2. **Test agent** - Essayer `/pm` pour Product Manager
3. **Test workflow complet** - `/product-brief` → `/prd` → `/tech-spec`

### Critères de validation

- [ ] Skills chargés correctement au démarrage
- [ ] Commandes `/workflow-*` fonctionnelles
- [ ] Agents répondent correctement
- [ ] Pas de conflit avec skills existants

### Rollback si problème

```bash
./scripts/experimental.sh rollback
```

### Alternative : npx officiel (nécessite Node 20+)

```bash
npx bmad-method@alpha install
```
