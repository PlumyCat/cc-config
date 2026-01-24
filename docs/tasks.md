# Tasks dans Claude Code

Guide d'utilisation du système de tâches pour un suivi optimal des travaux.

## Concept

Les Tasks permettent à Claude de :
- Tracker les étapes d'un travail complexe
- Montrer la progression en temps réel
- Organiser les dépendances entre tâches
- Ne rien oublier sur les projets multi-étapes

## Quand Claude utilise les Tasks

| Situation | Tasks utilisées |
|-----------|-----------------|
| Tâche simple (< 3 étapes) | Non |
| Travail multi-étapes | Oui |
| Refactoring complexe | Oui |
| Liste de choses à faire | Oui |
| Question simple | Non |

## Structure d'une Task

```
Task {
  id: "1"                    # Identifiant unique
  subject: "Migrer les tests" # Titre court (impératif)
  description: "..."         # Détails, contexte, critères
  status: "pending"          # pending → in_progress → completed
  activeForm: "Migrant..."   # Texte affiché pendant l'exécution
  owner: "agent-name"        # Qui travaille dessus
  blocks: ["2", "3"]         # Tâches qui attendent celle-ci
  blockedBy: ["0"]           # Tâches qui doivent finir avant
}
```

## Statuts

| Status | Signification |
|--------|---------------|
| `pending` | En attente, pas encore commencée |
| `in_progress` | En cours d'exécution |
| `completed` | Terminée avec succès |

## Dépendances

Les tâches peuvent avoir des dépendances :

```
Task 1: "Créer le schéma DB"
Task 2: "Implémenter les modèles" (blockedBy: [1])
Task 3: "Écrire les tests" (blockedBy: [2])
```

Claude ne démarre pas une tâche si ses dépendances ne sont pas complétées.

## Bonnes pratiques

### Pour l'utilisateur

1. **Donner des listes claires**
   ```
   Fais ces modifications :
   1. Ajouter le champ email
   2. Valider le format
   3. Mettre à jour les tests
   ```
   → Claude créera automatiquement 3 tâches

2. **Demander le tracking explicitement**
   ```
   Refactore ce module, utilise les tasks pour tracker
   ```

3. **Projets complexes**
   ```
   Implémente l'authentification OAuth. C'est un gros travail,
   découpe en tâches et montre-moi la progression.
   ```

### Ce que Claude fait

- Crée les tâches au début du travail
- Met `in_progress` avant de commencer chaque tâche
- Met `completed` une fois terminée
- Ajoute des tâches si de nouvelles étapes émergent
- Ne marque jamais `completed` si erreur ou blocage

## Exemple concret

**Demande :** "Migre les commands vers skills dans ce projet"

**Claude crée :**
```
[ ] Task 1: Lire les commands existantes
[ ] Task 2: Créer la structure skills/
[ ] Task 3: Migrer chaque command (blockedBy: [1, 2])
[ ] Task 4: Mettre à jour install.sh (blockedBy: [3])
[ ] Task 5: Supprimer l'ancien dossier commands (blockedBy: [3])
[ ] Task 6: Tester l'installation (blockedBy: [4, 5])
```

**Pendant l'exécution :**
```
[✓] Task 1: Lire les commands existantes
[✓] Task 2: Créer la structure skills/
[→] Task 3: Migrant chaque command...  ← spinner actif
[ ] Task 4: Mettre à jour install.sh
[ ] Task 5: Supprimer l'ancien dossier commands
[ ] Task 6: Tester l'installation
```

## Commandes utiles

Dans Claude Code, tu peux voir les tâches avec `/tasks` (si disponible) ou demander :
- "Montre les tâches en cours"
- "Quel est le statut ?"
- "Continue avec la prochaine tâche"

## Limites

- Tasks = mémoire de session uniquement (pas persisté entre sessions)
- Pas de notifications externes
- Pas d'assignation à des humains (c'est pour Claude)

## Tips

1. **Gros projet ?** Demande explicitement le découpage en tâches
2. **Suivi visuel ?** Les tâches s'affichent dans l'interface
3. **Blocage ?** Claude créera une nouvelle tâche pour résoudre le problème
4. **Reprise ?** En nouvelle session, re-décris le contexte - les tasks ne persistent pas
