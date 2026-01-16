# Expérimentation: bmad-method

**Démarrée le:** 2025-01-16 11:04

## Objectif

Tester BMAD Method v6 - Framework agile AI-driven avec 9 agents spécialisés pour Claude Code.

**Source:** https://github.com/aj-geddes/claude-code-bmad-skills

## Installation effectuée

```bash
# Repo cloné
git clone https://github.com/aj-geddes/claude-code-bmad-skills.git /tmp/claude-code-bmad-skills

# Installeur exécuté
./install-v6.sh
```

**Fichiers installés:**
- Skills: `~/.claude/skills/bmad/` (core, bmm, bmb, cis)
- Commands: `~/.claude/commands/bmad/` (15 commandes)
- Config: `~/.claude/config/bmad/`

## Changements à tester

- [ ] Redémarrer Claude Code
- [ ] Tester `/workflow-init` sur un projet
- [ ] Tester `/workflow-status`
- [ ] Essayer un agent (ex: `/prd` pour Product Manager)
- [ ] Vérifier pas de conflit avec skills existants

## Commandes disponibles

| Commande | Usage |
|----------|-------|
| `/workflow-init` | Initialiser BMAD dans un projet |
| `/workflow-status` | Voir le statut du projet |
| `/product-brief` | Créer un brief produit |
| `/prd` | Générer un PRD |
| `/tech-spec` | Spécifications techniques |
| `/architecture` | Design d'architecture |
| `/sprint-planning` | Planifier un sprint |
| `/create-story` | Créer une user story |
| `/dev-story` | Implémenter une story |

## Notes

Installation réussie le 2025-01-16.
Version: BMAD Method v6.0.2

**Prochain step:** Redémarrer Claude Code et tester sur un projet non-critique.

## Résultat

<!-- À remplir après les tests -->
- [ ] Succès
- [ ] Échec

**Raison:**

