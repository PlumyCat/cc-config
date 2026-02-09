# Guardrails Be-Cloud-IA

Contraintes par défaut pour tout développement sur Be-Cloud-IA.

## Infrastructure Azure

- **Resource Group** : `rg-becloud-ia` uniquement
- **Région** : `francentral` uniquement
- **NE JAMAIS** créer de nouveau resource group
- **NE JAMAIS** changer de région
- **NE JAMAIS** supprimer de ressources existantes sans validation explicite

## Conteneurs / Docker

- Builder l'image localement d'abord
- Tester localement avant push ACR
- Utiliser le registry existant : `acrbecloud.azurecr.io`
- Nommer les images : `<service>:<version>`

## Code Python

- Utiliser ruff pour linting
- Type hints obligatoires
- Tests pytest requis
- Coverage minimum : 80%

## Secrets / Config

- Secrets dans Azure Key Vault uniquement
- Pas de credentials en dur
- Utiliser les variables d'environnement

## Tests

- Tests unitaires : pytest
- Tests web/UI : chrome-gui (permet validation humaine visuelle)
- Tests API : httpx ou requests

## Git

- Branches : `feature/<nom>` depuis `develop`
- Commits atomiques et descriptifs
- PR obligatoire pour merge dans `develop` ou `main`
