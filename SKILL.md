---
name: lovable-architect
description: Système de développement haute fidélité pour React/Vite. Design moderne (Tailwind, Shadcn, polices Display), architecture par features, tests Vitest, sécurité Supabase et animations Framer Motion. Use when building production-ready React apps with strict design standards.
license: MIT
metadata:
  author: lovable-architect
  version: "5.0"
  tags: react vite tailwind supabase vitest framer-motion design-system
---

# Lovable Architect Mode (V5)

Ce skill transforme l'IA en un architecte logiciel "Product-First", capable de livrer des applications React prêtes pour la production, testées et scalables.

## Protocole de Session (PRIORITÉ ABSOLUE)

Au début de CHAQUE conversation :
1. **Lecture** : Lis `PROJECT.md` à la racine pour comprendre l'état actuel.
2. **Résumé** : Résume en 2 lignes l'état d'avancement à l'utilisateur.
3. **Planification** : Confirme les prochaines étapes avant d'écrire du code.

À la fin de CHAQUE tâche :
1. **Update** : Mets à jour la section `## Status` dans `PROJECT.md`.
2. **Historique** : Ajoute les décisions techniques prises sous `## Decisions`.

## Principes de Haute Fidélité & Architecture

1. **Aesthetics First**: Classes Tailwind obligatoires. Design System respecté.
2. **Feature-Based Architecture**: Organise le code par domaine métier dans `src/features/[feature-name]`.
3. **Test-Driven Development (TDD)**: Chaque logique métier ou composant complexe DOIT avoir un fichier `.test.tsx` associé utilisant Vitest.
4. **Secure Backend**: Appels Supabase via services dans `src/services`. RLS policies proposées systématiquement.
5. **Immersive Animations**: Les animations suivent la [Decision Matrix](references/animation-decision-matrix.md). Ne jamais en ajouter sans consulter ce fichier.
6. **Typography with Personality**: Les polices suivent le [Typography Guide](references/typography-guide.md). Le Display DOIT être différent du Body.

## Workflows

### 1. Initialisation d'un Projet (V5)
- **Nouveau projet** : Lance `scripts/setup-lovable-project.sh`. Ce script configure la stack complète (Vite, Tailwind, Shadcn, Vitest, Prettier, Aliases).
- **Infrastucture** : Assure-toi que les scripts `setup-lovable-project.sh` et `generate-feature.sh` sont présents dans un dossier `scripts/` à la racine pour usage futur.

### 2. Génération de Feature (PUISSANCE V5)
Lorsqu'une nouvelle fonctionnalité métier est demandée (ex: "Crée une feature de messagerie") :
1. **Génération** : Exécute le script `scripts/generate-feature.sh <name>`.
2. **Architecture** : Le script crée automatiquement les dossiers `components`, `hooks`, `services`, les fichiers de tests et le barrel export `index.ts`.
3. **Supabase RLS** : Consulte les politiques RLS suggérées en commentaire dans le service généré et propose à l'utilisateur de les appliquer.

### 3. Checklist de Validation (Senior)
- [ ] **Tests** : La couverture est-elle suffisante (Vitest) ?
- [ ] **Style** : Les tokens du [Design System](references/design-system.md) sont-ils utilisés ?
- [ ] **Architecture** : Le code est-il dans le bon dossier feature ? Imports via `@/features/...` ?
- [ ] **RLS** : La sécurité Supabase est-elle envisagée ?
- [ ] **Context** : Le fichier `PROJECT.md` est-il à jour ?
- [ ] **Animations** : La [Decision Matrix](references/animation-decision-matrix.md) a-t-elle été consultée ?
- [ ] **Typography** : La paire Display/Body est-elle cohérente avec le [Typography Guide](references/typography-guide.md) ?

## Animation Guidelines (V5)

### Règles Absolues
1. **Consulter la [Decision Matrix](references/animation-decision-matrix.md)** AVANT d'ajouter TOUTE animation.
2. **Utiliser les [Animation Recipes](references/animation-recipes.md)** pour les 8 composants injectés. Ne pas les régénérer.
3. **Maximum 3 animations simultanées** visibles à l'écran.
4. **Maximum 5 animations par page** (sauf portfolios créatifs : 8 max).
5. **Toujours respecter** `prefers-reduced-motion` en fallback.

### Workflow Animation
1. L'utilisateur demande une animation → Consulter la matrix.
2. Si le composant existe dans les recipes → Copier tel quel.
3. Si le composant n'existe pas → Générer en suivant les patterns du design-system.
4. Si le besoin est avancé (3D, WebGL) → Consulter les références externes (Aceternity, Magic UI, Hover.dev, Codrops).

### Anti-Patterns Interdits
- Animation qui empêche le scroll
- Contenu masqué derrière une animation obligatoire
- Plus de 3 animations simultanées
- Animation sans fallback `prefers-reduced-motion`
- Polices Display pour du body text
- Plus de 2 familles de polices (3 avec Mono si dev-tools)

## Typography Guidelines (V5)

### Règles
1. **Display ≠ Body** : La police Display DOIT être différente du Body (contraste = attention).
2. **Display = PERSONNALITÉ** : Inter, DM Sans, Geist, Satoshi = BODY uniquement. Le Display doit avoir du caractère.
3. **Chaque site DOIT avoir sa propre Display** : Ne jamais réutiliser la même Display que le site précédent.
4. **Catégories de Display** : Blackletter (Grenze, Banger), Reverse Contrast (Ojuju), Ultra-Bold (Oi, Black Ops One), Memphis/90s (Kablammo, Bungee), Handmade (Girassol, Playpen Sans), Futuristic (Fascinate, Nosifer), Geometric Bold (Clash, Cal Sans, Khand).
5. **Variable fonts** > Static fonts (40-60% moins de poids).
6. **Taille body minimum** : 14-16px.

Consulte le [Typography Guide](references/typography-guide.md) pour les paires par catégorie de site et les configs CSS.

## Limites
- Optimisé pour React/Vite. Nécessite `npm` pour les scripts d'automatisation.
