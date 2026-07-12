# Animation Decision Matrix

> **Règle absolue** : Consulter ce fichier AVANT d'implémenter toute animation.
> Ne jamais mélanger plus de 3 animations par page. Moins = mieux.

---

## 1. Matrice Contexte → Animation

| Type de Page | Animations Recommandées | Anti-Patterns (NE PAS utiliser) |
|---|---|---|
| **Hero / Landing** | SmoothScroll + Parallaxe + KineticTextReveal + Orbes flottantes | Scrollytelling, ZoomPortal, StickyPinned |
| **Features Showcase** | InteractiveBentoCard + MagneticButton + Fade-in-up | ZoomPortal, ScrollytellingPath, Parallaxe lourde |
| **Portfolio / Créatif** | ScrollytellingPath + ZoomPortal + Parallaxe + Tilt3D | Bento Grid, MagneticButton |
| **SaaS / Dashboard** | Glassmorphism + MagneticButton + Fade-in-up + Shimmer | Parallaxe lourde, Scrollytelling, ZoomPortal |
| **Storytelling / About** | ScrollytellingPath + KineticTextReveal + Parallaxe | MagneticButton, Bento Grid |
| **Pricing** | InteractiveBentoCard + MagneticButton + Fade-in-up | Scrollytelling, ZoomPortal, Parallaxe |
| **Blog / Articles** | TextReveal + Parallaxe légère + Fade-in-up | Tout le reste |
| **Coming Soon / Maintenance** | Orbes flottantes + Gradient animé + Loader | Scrollytelling, Bento, StickyPinned |

---

## 2. Matrice Composant → Quand l'utiliser

| Composant (recipe) | Utiliser quand... | Éviter quand... |
|---|---|---|
| **SmoothScrollProvider** | Toujours (sauf dashboard administratif) | Pages courtes (< 3 sections), apps mobile-only |
| **MagneticButton** | CTA principaux, boutons de navigation, liens importants | Boutons de formulaire, boutons de destruction, pagination |
| **TextScrambleHover** | Noms de features, labels de nav, titres interactifs | Titres principaux de section, textes de body |
| **InteractiveBentoCard** | Grilles de features, pricing, testimonials | Pages avec beaucoup de texte, blog articles |
| **ScrollytellingPath** | Pages "process", "comment ça marche", storytelling | Landing pages courtes, dashboards |
| **StickyPinnedSection** | Étapes de processus (3-5 étapes max), comparaisons | Plus de 5 étapes (trop long), sections simples |
| **KineticTextReveal** | Titres de hero, titres de section importants | Sous-titres, labels, textes de body |
| **ZoomPortal** | Sections de transition dramatic, portfolios créatifs | SaaS, dashboards, pages de documentation |

---

## 3. Matrice Effet Visuel → CSS

| Effet | Classes Tailwind à appliquer | Quand |
|---|---|---|
| **Glassmorphism** | `bg-white/[0.03] backdrop-blur-xl border border-white/[0.08] rounded-3xl` | Cartes, modals, navbars |
| **Gradient text** | `bg-gradient-to-r from-purple-400 via-pink-400 to-indigo-400 bg-clip-text text-transparent` | Titres hero, highlights |
| **Hover glow** | `hover:border-white/20 transition-all duration-300` | Toutes les cartes glass |
| **Orbes flottantes** | `bg-purple-600/20 rounded-full blur-[120px] animate-pulse` | Background hero sections |
| **Fade-in-up** | `framer-motion: initial={{ opacity: 0, y: 30 }} whileInView={{ opacity: 1, y: 0 }}` | Toutes les sections au scroll |
| **Stagger** | `framer-motion: transition={{ staggerChildren: 0.1 }}` | Listes de features, grilles |
| **Shimmer** | `@keyframes shimmer + ::after pseudo-element` | Barres de progression |
| **Tilt 3D** | `framer-motion: useMotionValue + useSpring + rotateX/Y` | Cartes projets, testimonials |

---

## 4. Règles d'Or

### Nombre d'animations par page
- **Landing page courte** (< 5 sections) : 2-3 animations max
- **Landing page longue** (5-10 sections) : 3-5 animations max
- **Page créative / Portfolio** : 5-8 animations (c'est le but)
- **Dashboard / App** : 0-1 animations (performance > esthétique)

### Hiérarchie d'attention
1. **Hero** : KineticTextReveal + Orbes + Gradient → l'utilisateur regarde ICI en premier
2. **Features** : Bento Grid + Light Follow → deuxième point d'attention
3. **CTA** : MagneticButton → dernier point d'interaction
4. **Footer** : Rien ou juste Glassmorphism → pas de distraction

### Règles de non-régression
- Ne jamais ajouter d'animation qui empêche le scroll
- Ne jamais masquer du contenu derrière une animation obligatoire
- Toujours respecter `prefers-reduced-motion`
- Maximum 3 animations simultanées visibles à l'écran

---

## 5. Bibliothèques Externes (Références)

Quand un composant n'est pas dans les recipes, chercher ici :

| Besoin | URL | Type |
|---|---|---|
| Composants React/Tailwind animés | https://ui.aceternity.com/components | Copy-paste |
| Composants React/Motion | https://magicui.design/docs | Copy-paste + CLI |
| Boutons/Text animés React | https://www.hover.dev/components | Copy-paste |
| Tutos GSAP avancés | https://tympanus.net/codrops/category/tutorials/ | Learning |
| Spline 3D scenes | https://spline.design + @splinetool/react-spline | 3D scenes |
