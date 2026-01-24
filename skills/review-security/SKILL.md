---
name: review-security
description: Audit de sécurité complet de la codebase - vulnérabilités, bonnes pratiques, conformité OWASP
context: fork
agent: Explore
allowed-tools: Read, Grep, Glob, Bash(grep:*), Bash(find:*)
---

# Security Review

Audit de sécurité complet de la codebase focalisé sur les vulnérabilités, bonnes pratiques et conformité.

## Scope de l'audit

- Validation et sanitization des inputs
- Mécanismes d'authentification et autorisation
- Protection des données et chiffrement
- Sécurité API et rate limiting
- Dépendances et sécurité supply chain
- Gestion de configuration et secrets
- Gestion d'erreurs et divulgation d'informations
- Sécurité infrastructure et déploiement

## Processus d'audit

### 1. Analyse statique du code

- Exécuter les linters de sécurité (bandit pour Python, ESLint security pour JS/TS)
- Vérifier les secrets et credentials hardcodés
- Analyser les vulnérabilités SQL injection et XSS
- Revoir les mécanismes d'upload/download de fichiers
- Valider les patterns de sanitization des inputs

### 2. Audit des dépendances

- Vérifier les vulnérabilités connues dans les dépendances
- Vérifier les sources et intégrité des packages
- Analyser les intégrations de services tiers

### 3. Authentification & Autorisation

- Revoir les flows d'authentification et gestion de session
- Valider le handling et stockage des JWT
- Vérifier les contrôles d'autorisation et permissions d'accès
- Analyser les politiques de mot de passe et stockage

### 4. Protection des données

- Vérifier le chiffrement at rest et in transit
- Vérifier le handling PII et conformité GDPR
- Revoir les politiques de rétention et suppression des données

### 5. Sécurité API

- Revoir rate limiting et throttling
- Vérifier configuration CORS
- Valider la validation des inputs sur tous les endpoints
- Analyser les réponses d'erreur pour fuite d'information

### 6. Sécurité de configuration

- Vérifier l'usage des variables d'environnement
- Revoir configurations production vs développement
- Valider l'implémentation de gestion des secrets

## Standards de sécurité

- Conformité OWASP Top 10
- NIST Cybersecurity Framework
- Contrôles ISO 27001 applicables
- Guidelines de sécurité spécifiques au langage

## Livrables

Rapport de sécurité complet incluant :
- Résumé exécutif avec évaluation des risques
- Findings détaillés avec niveaux de sévérité (Critical, High, Medium, Low)
- Recommandations de remédiation spécifiques
- Checklist de conformité et analyse des gaps
