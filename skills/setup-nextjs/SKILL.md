---
name: setup-nextjs
description: Initialise un projet Next.js moderne avec TypeScript strict, App Router et tooling production-ready
disable-model-invocation: true
---

# Setup Next.js Project

Initialise un projet Next.js moderne avec TypeScript, configuration stricte, et tooling production-ready.

## Objectifs du projet

Créer une application Next.js scalable avec :
- Configuration TypeScript mode strict
- Architecture App Router moderne
- Setup de tests complet (Vitest, Playwright)
- Tooling qualité de code (ESLint, Prettier, TypeScript)
- State management et data fetching
- Système de styling et composants UI
- Optimisation performance et monitoring

## Étapes d'implémentation

### 1. Initialisation projet

- Créer app Next.js avec TypeScript et App Router
- Configurer pnpm workspace si nécessaire
- Setup dépôt Git avec .gitignore approprié

### 2. Configuration TypeScript

```json
{
  "compilerOptions": {
    "strict": true,
    "noUncheckedIndexedAccess": true,
    "exactOptionalPropertyTypes": true,
    "noImplicitReturns": true,
    "noFallthroughCasesInSwitch": true
  }
}
```

### 3. Setup dépendances

- Core: next, react, react-dom
- Styling: tailwindcss, @tailwindcss/typography
- State: zustand ou @tanstack/react-query
- Forms: react-hook-form, zod
- UI: @radix-ui components ou shadcn/ui
- Icons: lucide-react

### 4. Outils de développement

- ESLint avec règles TypeScript
- Prettier avec tri imports
- Vitest pour tests unitaires
- Playwright pour tests E2E
- @testing-library/react pour tests composants

### 5. Structure projet

```
src/
├── app/
│   ├── layout.tsx
│   ├── page.tsx
│   └── globals.css
├── components/
│   ├── ui/
│   └── forms/
├── lib/
│   ├── utils.ts
│   ├── validations.ts
│   └── api.ts
├── hooks/
├── stores/
└── types/
```

### 6. Fichiers de configuration

- next.config.js avec optimisations performance
- tailwind.config.js avec thème custom
- eslint.config.js avec règles strictes
- vitest.config.ts pour testing
- playwright.config.ts pour tests E2E

### 7. Implémentation core

- Layout avec meta tags SEO appropriés
- Error boundaries et loading states
- Variables d'environnement type-safe
- Exemples API routes avec validation
- Patterns composants réutilisables

### 8. Assurance qualité

- Pre-commit hooks avec lint-staged
- GitHub Actions workflow (si applicable)
- Configuration bundle analyzer
- Setup monitoring performance

### 9. Documentation

- README avec instructions développement
- Documentation composants avec Storybook (optionnel)
- Documentation API
- Guidelines déploiement
