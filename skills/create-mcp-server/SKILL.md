---
name: create-mcp-server
description: Crée un serveur MCP compatible Microsoft Copilot Studio avec patterns éprouvés et évitement des pièges courants
disable-model-invocation: true
---

# Create MCP Server

Crée un serveur Model Context Protocol (MCP) compatible avec Microsoft Copilot Studio, suivant les patterns éprouvés et évitant les pièges courants.

## Requirements critiques

**OBLIGATOIRE** : Ce serveur DOIT être compatible avec les limitations de Microsoft Copilot Studio :
- PAS de paramètres optionnels (tous les paramètres doivent être requis)
- PAS de types complexes (list, dict, Union, Optional)
- Utiliser "yes"/"no" strings au lieu de boolean true/false
- Maximum 70 tools au total
- Descriptions ultra-claires avec comptage exact des paramètres

## Étapes d'implémentation

### 1. Matériaux de référence

- Étudier les exemples fonctionnels dans `~/projects/python-sdk`
- Utiliser mcp__ms-learn tool pour vérifier la documentation récente
- Appliquer les patterns de l'expérience COPILOT_STUDIO_FIX.md

### 2. Setup projet

- Créer virtual environment (.venv)
- Installer FastMCP : `pip install fastmcp`
- Setup structure projet pour serveur MCP

### 3. Architecture serveur

```python
from fastmcp import FastMCP

mcp = FastMCP("Your Server Name")

@mcp.tool()
def simple_tool(required_param: str) -> str:
    """Tool description. 1 parameter: required_param."""
    return f"Result for {required_param}"
```

### 4. Principes de design des tools

- Chaque tool a SEULEMENT des paramètres requis
- Diviser les tools complexes en plusieurs tools simples
- Utiliser des noms descriptifs indiquant le nombre de paramètres
- Fournir des descriptions claires et spécifiques

### 5. Handling des paramètres

```python
# CORRECT - Tous paramètres requis
@mcp.tool()
def create_document_with_title(filename: str, title: str) -> str:
    """Create document with title. 2 parameters: filename, title."""

# FAUX - Paramètre optionnel (casse Copilot Studio)
def create_document(filename: str, title: str = "") -> str:
```

### 6. Catégories de tools

- Tools démo (0 paramètres) pour tester la connectivité
- Opérations simples (1-2 paramètres requis)
- Opérations complexes divisées en plusieurs tools focalisés
- Garder le total sous 70 tools

### 7. Patterns courants

```python
# Démo connectivité
@mcp.tool()
def demo_hello_world() -> str:
    """Test MCP connection. No parameters needed."""

# Opérations simples
@mcp.tool()
def find_items(search_term: str) -> str:
    """Find items by search term. 1 parameter: search_term."""

# Variations multiples au lieu de paramètres optionnels
@mcp.tool()
def create_item(name: str) -> str:
    """Create item with default settings. 1 parameter: name."""

@mcp.tool()
def create_item_with_description(name: str, description: str) -> str:
    """Create item with description. 2 parameters: name, description."""
```

### 8. Checklist déploiement

- [ ] Pas de paramètres optionnels nulle part
- [ ] Pas de types complexes (list, dict, Union, Optional)
- [ ] Comptage tools < 70
- [ ] Paramètres boolean utilisent strings "yes"/"no"
- [ ] Descriptions claires avec comptages paramètres
- [ ] Tests locaux réussis
- [ ] Exemples de référence vérifiés

Utiliser l'agent mcp-copilot-expert de manière proactive tout au long du processus pour assurer la compatibilité Copilot Studio et appliquer toutes les leçons apprises des implémentations précédentes.
