---
name: debug-mcp
description: Workflow de debugging systématique pour problèmes de serveur MCP, spécialement intégration Microsoft Copilot Studio
disable-model-invocation: true
allowed-tools: Read, Grep, Glob, Bash
---

# Debug MCP Server

Workflow de debugging systématique pour les problèmes de serveur MCP (Model Context Protocol), spécialement pour les problèmes d'intégration Microsoft Copilot Studio.

## Problèmes courants

**Copilot Studio affiche les paramètres JSON-RPC au lieu des paramètres tool :**
- Généralement causé par des paramètres optionnels dans les définitions de tools
- Vérifier tout paramètre avec valeur par défaut
- Vérifier qu'aucun Union, Optional, ou type complexe n'est utilisé

**Tools n'apparaissent pas dans Copilot Studio :**
- Le serveur peut ne pas répondre aux requêtes list_tools
- Vérifier les logs de démarrage et connexion du serveur
- Vérifier la conformité au protocole MCP

**Exécution des tools échoue :**
- Mismatch de types de paramètres
- Erreurs runtime serveur
- Problèmes de connectivité réseau

## Étapes de debugging

### 1. Vérifier statut serveur

- Vérifier que le serveur démarre sans erreurs
- Tester la connectivité basique avec les tools démo
- Vérifier les logs serveur pour problèmes de démarrage

### 2. Valider les définitions de tools

```bash
# Chercher paramètres optionnels
grep -r "= " server.py

# Chercher types complexes
grep -r "Optional\|Union\|List\|Dict" server.py

# Compter les tools
grep -c "@mcp.tool" server.py
```

### 3. Tester protocole JSON-RPC

- Tester requête list_tools manuellement
- Vérifier les schemas tools dans la réponse
- Vérifier les définitions de paramètres dans les schemas

### 4. Référencer exemples fonctionnels

- Comparer avec exemples `~/projects/python-sdk`
- Vérifier COPILOT_STUDIO_FIX.md pour solutions connues
- Utiliser mcp__ms-learn pour vérifier documentation

### 5. Fixes courants

```python
# PROBLÉMATIQUE - Paramètre optionnel
def broken_tool(name: str, option: str = "default"):
    """This breaks Copilot Studio."""

# FIXÉ - Diviser en tools séparés
def working_tool(name: str):
    """Working tool. 1 parameter: name."""
    return process_with_option(name, "default")

def working_tool_with_option(name: str, option: str):
    """Working tool with option. 2 parameters: name, option."""
    return process_with_option(name, option)
```

### 6. Test systématique

- Tester chaque tool individuellement dans Copilot Studio
- Vérifier que l'affichage des paramètres montre les vrais paramètres
- Vérifier l'exécution des tools avec diverses entrées
- Valider la gestion d'erreurs et les réponses

### 7. Optimisation serveur

- S'assurer que le comptage tools reste sous 70
- Optimiser les descriptions des tools pour la clarté
- Supprimer les tools inutilisés ou redondants
- Grouper les fonctionnalités liées de manière appropriée

## Checklist de résolution

- [ ] Pas de paramètres optionnels dans aucun tool
- [ ] Pas de types complexes (list, dict, Union, Optional)
- [ ] Comptage tools < 70
- [ ] Paramètres boolean utilisent strings "yes"/"no"
- [ ] Descriptions claires avec comptages paramètres
- [ ] Serveur démarre sans erreurs
- [ ] Réponses JSON-RPC valides
- [ ] Tools s'exécutent avec succès dans Copilot Studio

Utiliser l'agent mcp-copilot-expert de manière proactive pendant le debugging pour appliquer toutes les solutions connues et best practices.
