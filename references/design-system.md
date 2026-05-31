# Design System "Lovable"

Pour obtenir l'aspect professionnel de Lovable, suis ces règles :

## 1. Mise en Page (Layout)
- **Container**: Utilise `max-w-7xl mx-auto px-4 sm:px-6 lg:px-8`.
- **Spacing**: Utilise une échelle cohérente (souvent des multiples de 4). Favorise l'espace (`gap-6`, `py-12`).
- **Grids**: Préfère `grid-cols-1 md:grid-cols-2 lg:grid-cols-3` pour les dashboards.

## 2. Composants
- **Cards**: `bg-card text-card-foreground rounded-xl border shadow-sm transition-all hover:shadow-md`.
- **Buttons**: Utilise les variantes Shadcn (primary, secondary, ghost, destructive). Toujours ajouter une transition de survol.
- **Inputs**: Focus ring prononcé et bordures légères.

## 3. Typographie
- **Sans-serif**: Inter ou Geist (par défaut dans Tailwind si configuré).
- **Titres**: `tracking-tight font-bold text-slate-900`.
- **Body**: `leading-relaxed text-slate-600`.

## 4. Intégrations Spécifiques
- **Icons**: Utilise `lucide-react`. Taille standard : `w-5 h-5`.
- **Animations**: Utilise `framer-motion` pour des transitions fluides (fade-in, slide-up).
- **Toasts**: Intègre `sonner` pour le feedback utilisateur.
