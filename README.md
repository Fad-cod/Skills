# Lovable Architect Mode V5

Système de développement haute fidélité pour React/Vite. Design moderne, architecture par features, tests, sécurité backend et animations immersives.

## Installation

### Méthode 1 : Via le CLI universel (recommandé)

```bash
npx skills add lovable-architect/lovable-architect
```

Le CLI détecte automatiquement tes agents installés et installe le skill au bon endroit.

### Méthode 2 : Installation manuelle

```bash
# Cloner le dépôt
git clone https://github.com/lovable-architect/lovable-architect.git

# Copier dans le dossier de ton agent (exemple : OpenCode)
cp -r lovable-architect ~/.config/opencode/skills/lovable-architect

# Ou pour Claude Code
cp -r lovable-architect ~/.claude/skills/lovable-architect

# Ou pour Gemini CLI
cp -r lovable-architect ~/.gemini/skills/lovable-architect

# Ou pour le dossier universel
cp -r lovable-architect ~/.agents/skills/lovable-architect
```

### Où s'installe le skill ?

| Agent | Dossier projet | Dossier global |
|---|---|---|
| Claude Code | `.claude/skills/` | `~/.claude/skills/` |
| OpenCode | `.opencode/skills/` | `~/.config/opencode/skills/` |
| Gemini CLI | `.gemini/skills/` | `~/.gemini/skills/` |
| Codex CLI | `.agents/skills/` | `~/.codex/skills/` |
| Cursor | `.agents/skills/` | `~/.cursor/skills/` |
| **Universel** | `.agents/skills/` | `~/.agents/skills/` |

## Utilisation

### Initialiser un projet

Une fois le skill activé, demande à ton assistant :

> *"Initialise un nouveau projet Lovable pour une app de e-commerce."*

L'assistant lancera `scripts/setup-lovable-project.sh` qui installe la stack complète :
- React + Vite + TypeScript
- Tailwind CSS v4 + Shadcn/UI
- Framer Motion + Lenis + Spline 3D
- Vitest + Testing Library
- Supabase (auth, DB, RLS)
- ESLint + Prettier

### Générer une feature

> *"Génère une feature 'auth' avec gestion de la connexion."*

L'assistant lancera `scripts/generate-feature.sh auth` qui crée :
```
src/features/auth/
├── components/AuthPage.tsx
├── components/AuthPage.test.tsx
├── hooks/useAuth.ts
├── hooks/useAuth.test.ts
├── services/auth.service.ts
└── index.ts
```

## Stack technique

```
React + Vite + TypeScript
Tailwind CSS v4 + Shadcn/UI
Framer Motion + Lenis + Spline 3D
Vitest + Testing Library
Supabase (auth, DB, RLS)
ESLint + Prettier
```

## Documentation

| Fichier | Description |
|---|---|
| `SKILL.md` | Définition complète du skill (frontmatter + instructions) |
| `references/design-system.md` | Design system, palette, composants, animations |
| `references/typography-guide.md` | 20+ polices Display catégorisées par type de site |
| `references/animation-recipes.md` | 8 composants React d'animation injectables |
| `references/animation-decision-matrix.md` | Matrice de décision pour les animations |

## Exemples de prompts

- *"Initialise un projet Lovable pour un SaaS de gestion de projet"*
- *"Génère une feature 'dashboard' avec graphiques et stats"*
- *"Ajoute une animation de scroll pour la section hero"*
- *"Respecte le design system et utilise une police Display category Memphis"*
- *"Ajoute les tests unitaires pour le service d'authentification"*

---
*Développé pour transformer le prototypage IA en ingénierie de production.*
