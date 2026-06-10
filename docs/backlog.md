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

- [ ] Réunion 3 bot-front 23/04 — Luc: relancer pour le fichier Excel astreinte SharePoint (envoyé mais impossible à ouvrir depuis Teams, cause à investiguer) (2026-04-23)

- [ ] Réunion 3 bot-front 23/04 — Sandrine: obtenir nom/structure du canal Teams pour proposition créneaux RDV (éviter doublons front/bot) (2026-04-23)

- [ ] Réunion 3 bot-front 23/04 — Sandrine: obtenir noms exacts des files dédiées (relances clients absents, accès Mandarine/Portal/Cloud Cockpit) (2026-04-23)

- [ ] Demande PIM Mail.Send pour l'app registration Dataverse (95484ded-517d-4580-83ff-82a5de9eca73) — nécessaire pour que callqueue-manager puisse envoyer l'email d'alerte quand le quota SendGrid 100/jour est atteint. Une fois la permission accordée + admin consent, l'auto-pause de la queue enverra un mail à efer@be-cloud.fr. Sans ça, l'auto-pause et la bannière dashboard fonctionnent mais l'email est skippé silencieusement. (2026-04-27)

- [ ] Migrer tous les secrets du Container App ca-follow-up-calls vers Azure Key Vault kv-follow-up-calls. Plusieurs env vars sont en clair (DATAVERSE_CLIENT_SECRET, AZURE_OPENAI_API_KEY_REALTIME, ACS_CONNECTION_STRING, DATAVERSE_CLIENT_ID, DATAVERSE_TENANT_ID, ACS_PHONE_NUMBER). La MI System-Assigned a deja le role 'Key Vault Secrets User' sur kv-follow-up-calls (pose 2026-05-20). Pattern : creer secret KV puis poser env var avec secretRef. Pas urgent, mais a faire avant prod publique. (2026-05-20)

- [ ] Demander à Benoit de créer une vue pour visualiser la file des tickets "Assistant IA de rendez-vous" (2026-05-22)
