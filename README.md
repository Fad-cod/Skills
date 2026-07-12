# Lovable Architect Mode V5

Système de développement haute fidélité pour React/Vite. Design moderne, architecture par features, tests, sécurité backend et animations immersives.

## Installation

### Une seule commande

```bash
curl -sL https://raw.githubusercontent.com/Fad-cod/Skills/main/install.sh | bash
```

Le script installe le skill dans `~/.agents/skills/lovable-architect/` et crée automatiquement des symlinks pour les agents qui ne supportent pas ce dossier (Claude Code, Windsurf, etc.).

### Agents supportés

| Agent | Supporté | Méthode |
|---|---|---|
| Codex CLI | Natif | `.agents/skills/` |
| Cursor | Natif | `.agents/skills/` |
| Gemini CLI | Natif | `.agents/skills/` |
| OpenCode | Natif | `.agents/skills/` |
| Cline | Natif | `.agents/skills/` |
| Copilot | Natif | `.agents/skills/` |
| Claude Code | Via symlink | `~/.claude/skills/` → symlink |
| Windsurf | Via symlink | `~/.codeium/windsurf/skills/` → symlink |

### Installation manuelle

```bash
# Copier le skill dans le dossier universel
cp -r lovable-architect ~/.agents/skills/lovable-architect

# Pour Claude Code (symlink obligatoire)
ln -s ~/.agents/skills/lovable-architect ~/.claude/skills/lovable-architect
```

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
