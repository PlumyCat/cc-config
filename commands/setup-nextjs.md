# Setup Next.js Project

Initialize a modern Next.js project with TypeScript, strict configuration, and production-ready tooling.

## Project Goals

Create a scalable Next.js application with:
- TypeScript strict mode configuration
- Modern App Router architecture
- Comprehensive testing setup (Vitest, Playwright)
- Code quality tooling (ESLint, Prettier, TypeScript)
- State management and data fetching
- Styling and UI component system
- Performance optimization and monitoring

## Implementation Steps

1. **Project Initialization**
   - Create Next.js app with TypeScript and App Router
   - Configure pnpm workspace if needed
   - Set up Git repository with proper .gitignore

2. **TypeScript Configuration**
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

3. **Dependencies Setup**
   - Core: next, react, react-dom
   - Styling: tailwindcss, @tailwindcss/typography
   - State: zustand or @tanstack/react-query
   - Forms: react-hook-form, zod
   - UI: @radix-ui components or shadcn/ui
   - Icons: lucide-react

4. **Development Tools**
   - ESLint with TypeScript rules
   - Prettier with import sorting
   - Vitest for unit testing
   - Playwright for E2E testing
   - @testing-library/react for component testing

5. **Project Structure**
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

6. **Configuration Files**
   - next.config.js with performance optimizations
   - tailwind.config.js with custom theme
   - eslint.config.js with strict rules
   - vitest.config.ts for testing
   - playwright.config.ts for E2E tests

7. **Core Implementation**
   - Layout with proper SEO meta tags
   - Error boundaries and loading states
   - Type-safe environment variables
   - API route examples with validation
   - Reusable component patterns

8. **Quality Assurance**
   - Pre-commit hooks with lint-staged
   - GitHub Actions workflow (if applicable)
   - Bundle analyzer configuration
   - Performance monitoring setup

9. **Documentation**
   - README with development instructions
   - Component documentation with Storybook (optional)
   - API documentation
   - Deployment guidelines

Use the typescript-expert agent proactively to ensure all TypeScript and React best practices are implemented correctly.