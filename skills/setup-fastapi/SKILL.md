---
name: setup-fastapi
description: Initialise un projet FastAPI complet avec bonnes pratiques, environnement virtuel et structure production-ready
disable-model-invocation: true
---

# Setup FastAPI Project

Initialise un projet FastAPI complet avec best practices, virtual environment, et structure de projet appropriée.

## Objectifs du projet

Créer un projet FastAPI production-ready avec :
- Setup virtual environment (.venv) et activation
- Structure FastAPI moderne avec dependency injection
- Setup de tests complet (pytest, coverage)
- Outils de qualité de code (ruff, mypy) configurés
- Configuration Docker pour déploiement
- Configuration d'environnement avec Pydantic settings
- Documentation API et exemples

## Étapes d'implémentation

### 1. Setup environnement

- Créer et activer .venv virtual environment
- Upgrade pip et installer l'écosystème FastAPI
- Setup structure requirements.txt

### 2. Structure projet

```
project/
├── .venv/
├── app/
│   ├── __init__.py
│   ├── main.py
│   ├── config.py
│   ├── models/
│   ├── routers/
│   ├── dependencies.py
│   └── database.py
├── tests/
├── requirements.txt
├── requirements-dev.txt
├── Dockerfile
├── .env.example
└── README.md
```

### 3. Installation dépendances

- fastapi[all] pour FastAPI complet avec extras
- uvicorn[standard] pour serveur ASGI
- pydantic-settings pour configuration
- sqlalchemy et alembic pour database
- pytest et pytest-asyncio pour testing

### 4. Outils de développement

- ruff pour linting et formatting
- mypy pour type checking
- pytest-cov pour coverage reporting
- pre-commit hooks setup

### 5. Configuration

- Variables d'environnement type-safe avec Pydantic
- Setup connexion database
- Configuration CORS et middleware
- Configuration logging

### 6. Implémentation de base

- Endpoint health check
- Exemples opérations CRUD
- Patterns dependency injection
- Middleware gestion d'erreurs

### 7. Framework de test

- Setup test client
- Exemples tests unitaires et intégration
- Configuration coverage (target >90%)

### 8. Documentation

- README avec instructions setup
- Exemples documentation API
- Documentation workflow développement

Utiliser l'agent python-expert de manière proactive tout au long du processus pour assurer que toutes les best practices Python sont suivies.
