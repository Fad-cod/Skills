# Design System "Lovable" — Aesthetics First

L'objectif : des interfaces modernes, immersives, avec une identité visuelle forte.
Priorité au dark mode, au verre (glassmorphism) et aux animations fluides.

---

## 1. Palette & Thème (Dark Mode natif)

```css
/* Couleurs de base — fond très sombre, cartes subtilement éclaircies */
--bg-primary: #000000;        /* Fond principal */
--bg-secondary: #050510;      /* Fond alterné (sections) */
--bg-card: rgba(255,255,255,0.03);    /* Fond card */
--bg-card-hover: rgba(255,255,255,0.06);
--border: rgba(255,255,255,0.06);      /* Bordures subtiles */
--border-hover: rgba(255,255,255,0.12);

/* Texte */
--text-primary: #ffffff;
--text-secondary: rgba(255,255,255,0.7);
--text-muted: rgba(255,255,255,0.4);

/* Dégradés signatures */
--gradient-primary: linear-gradient(135deg, #a855f7, #6366f1);   /* Violet → Indigo */
--gradient-accent: linear-gradient(90deg, #fbbf24, #ec4899, #a855f7); /* Ambre → Rose → Violet */
--gradient-text: linear-gradient(135deg, #a855f7, #e879f9);      /* Pour le texte */

/* Verre (glass) */
--glass-bg: rgba(255,255,255,0.04);
--glass-border: rgba(255,255,255,0.06);
--glass-blur: 24px;
```

**Classes Tailwind v4 correspondantes :**
```css
@theme {
  --color-charcoal: #0a0a0a;
  --color-card: rgba(255,255,255,0.03);
  --color-border: rgba(255,255,255,0.08);
}
```

---

## 2. Mise en Page (Layout)

### Container standard
```html
<div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
```

### Sections
```html
<section class="py-24 md:py-32">
  <!-- Section avec fond alterné -->
<section class="py-24 md:py-32 bg-white/[0.01]">
```

### Grilles responsives
```html
<!-- 2 colonnes desktop -->
<div class="grid md:grid-cols-2 gap-8">

<!-- 3 colonnes desktop -->
<div class="grid md:grid-cols-3 gap-6">

<!-- Grille mixte (hero) -->
<div class="grid md:grid-cols-5 gap-8">
  <div class="md:col-span-3">...</div>  <!-- Bio -->
  <div class="md:col-span-2">...</div>  <!-- Stats -->
</div>
```

### Titres de section
```html
<h2 class="text-4xl md:text-5xl font-bold tracking-tight text-white mb-4">
  Section <span class="bg-clip-text text-transparent bg-gradient-to-r from-purple-400 to-pink-400">titre</span>
</h2>
<!-- Barre décorative sous le titre -->
<div class="w-20 h-1 rounded-full bg-gradient-to-r from-purple-500 to-pink-500 mb-8" />
```

---

## 3. Glassmorphism (Verre)

Le glassmorphism est la signature visuelle. Chaque carte doit donner l'impression d'un verre dépoli posé sur un fond sombre.

### Carte standard
```html
<div class="p-6 rounded-2xl bg-white/[0.03] border border-white/[0.06] backdrop-blur-sm transition-all duration-300 hover:bg-white/[0.06] hover:border-white/[0.12]">
```

### Carte avec ombre renforcée
```html
<div class="p-8 rounded-2xl bg-white/[0.03] border border-white/[0.06] backdrop-blur-xl shadow-xl">
```

### Input glass
```html
<input class="w-full px-4 py-3 rounded-xl bg-white/[0.04] border border-white/[0.1] text-white placeholder:text-white/30 transition-all duration-200 focus:outline-none focus:border-purple-500/50 focus:ring-1 focus:ring-purple-500/30" />
```

### Badge / Tag
```html
<span class="inline-flex px-3 py-1 rounded-full text-xs font-medium bg-purple-500/10 text-purple-300 border border-purple-500/20">
```

### Grille de fond subtile (pour hero)
```css
background-image: linear-gradient(rgba(255,255,255,0.1) 1px, transparent 1px),
                  linear-gradient(90deg, rgba(255,255,255,0.1) 1px, transparent 1px);
background-size: 60px 60px;
opacity: 0.03;
```

---

## 4. Typographie

### Polices recommandées
- **Titres (display)** : `Grenze` (serif élégant) ou `Space Grotesk` (sans-serif moderne)
- **Corps (body)** : `Inter` (lisible, performant)

### Import Google Fonts
```html
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Grenze:wght@200;300;400;500;600;700;800;900&family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
```

### Configuration Tailwind v4
```css
@theme {
  --font-sans: 'Inter', system-ui, -apple-system, sans-serif;
  --font-display: 'Grenze', Georgia, serif;
}
```

### Règle CSS globale pour les titres
```css
h1, h2, h3, h4, .heading {
  font-family: var(--font-display);
}
```

### Hiérarchie typographique
```html
<!-- Hero : h1, 5xl-8xl -->
<h1 class="text-5xl sm:text-6xl md:text-7xl lg:text-8xl font-bold tracking-tight text-white leading-[1.1]">

<!-- Section : h2, 4xl-5xl -->
<h2 class="text-4xl md:text-5xl font-bold tracking-tight text-white">

<!-- Sous-section : h3, lg-xl -->
<h3 class="text-lg font-semibold text-white">

<!-- Body -->
<p class="text-lg text-white/60 leading-relaxed">
<p class="text-sm text-white/50 leading-relaxed">
<p class="text-xs text-white/40">
```

---

## 5. Boutons

### Primaire (gradient)
```html
<a class="inline-flex items-center gap-2 px-8 py-4 rounded-xl bg-gradient-to-r from-purple-600 to-indigo-600 text-white font-medium transition-all duration-300 hover:scale-[1.02] hover:shadow-[0_0_40px_-5px_rgba(168,85,247,0.5)] active:scale-[0.98]">
  Label
  <svg class="w-4 h-4">...icône...</svg>
</a>
```

### Secondaire (bordure)
```html
<a class="inline-flex items-center gap-2 px-8 py-4 rounded-xl border border-white/[0.12] text-white/80 font-medium transition-all duration-300 hover:bg-white/[0.06] hover:text-white hover:border-white/[0.2]">
  Label
</a>
```

### Ghost
```html
<button class="inline-flex items-center gap-2 px-4 py-2 rounded-xl text-white/60 transition-all duration-300 hover:bg-white/[0.06] hover:text-white">
  Label
</button>
```

### Filtres (catégories)
```html
<button class="px-4 py-2 rounded-xl text-sm font-medium transition-all duration-300
  bg-purple-500/20 text-purple-300 border border-purple-500/30   /* Actif */
  bg-white/[0.03] text-white/50 border border-white/[0.06] hover:bg-white/[0.06] hover:text-white/70  /* Inactif */
">
```

---

## 6. Animations & Micro-Interactions

### Framer Motion — Motifs réutilisables

#### Fade-in-up (entrée de section)
```tsx
const fadeInUp = {
  initial: { opacity: 0, y: 30 },
  whileInView: { opacity: 1, y: 0 },
  viewport: { once: true, margin: '-100px' },
  transition: { duration: 0.6, ease: [0.25, 0.1, 0.25, 1] },
}
```

#### Stagger (enfants décalés)
```tsx
const stagger = {
  initial: { opacity: 0, y: 20 },
  whileInView: { opacity: 1, y: 0 },
  viewport: { once: true, margin: '-50px' },
  transition: { duration: 0.4, delay: index * 0.1, ease: [0.25, 0.1, 0.25, 1] },
}
```

#### Scale-in (entrée avec zoom)
```tsx
const scaleIn = {
  initial: { opacity: 0, scale: 0.9 },
  whileInView: { opacity: 1, scale: 1 },
  viewport: { once: true, margin: '-100px' },
  transition: { duration: 0.5, ease: [0.25, 0.1, 0.25, 1] },
}
```

### Micro-interactions CSS

#### Card hover
```css
.card {
  transition: all 0.3s ease;
}
.card:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 30px -5px rgba(168, 85, 247, 0.15);
}
```

#### Lien social hover
```css
.social-link {
  transition: all 0.3s ease;
}
.social-link:hover {
  color: #a855f7;
  border-color: rgba(168, 85, 247, 0.3);
  background: rgba(168, 85, 247, 0.1);
}
```

#### Barre de progression animée
```tsx
<motion.div
  className="h-full rounded-full bg-gradient-to-r from-purple-500 to-pink-500"
  initial={{ width: 0 }}
  whileInView={{ width: `${level}%` }}
  viewport={{ once: true }}
  transition={{ duration: 1, delay: index * 0.1 + 0.3 }}
/>
```

#### Scroll indicator (mouse wheel)
```tsx
<motion.div
  className="w-6 h-10 rounded-full border-2 border-white/20 flex items-start justify-center pt-2"
  animate={{ y: [0, 8, 0] }}
  transition={{ duration: 2, repeat: Infinity, ease: 'easeInOut' }}
>
  <div className="w-1.5 h-1.5 rounded-full bg-white/40" />
</motion.div>
```

### Orbes flottantes (background hero)
```tsx
<div className="absolute -top-40 -left-40 w-96 h-96 bg-purple-600/20 rounded-full blur-[120px] animate-pulse" />
<div className="absolute -bottom-40 -right-40 w-[30rem] h-[30rem] bg-pink-600/15 rounded-full blur-[120px] animate-pulse" style={{ animationDelay: '2s' }} />
```

### Badge "disponible" animé
```html
<div class="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-emerald-500/10 border border-emerald-500/20 text-emerald-400 text-sm">
  <span class="w-2 h-2 rounded-full bg-emerald-400 animate-pulse" />
  Disponible pour missions
</div>
```

---

## 7. Effets Spéciaux

### Grille de fond (hero sections)
```css
background-image:
  linear-gradient(rgba(255,255,255,0.1) 1px, transparent 1px),
  linear-gradient(90deg, rgba(255,255,255,0.1) 1px, transparent 1px);
background-size: 60px 60px;
opacity: 0.03;
```

### Dégradé de fond de section
```html
<section class="relative overflow-hidden">
  <div class="absolute inset-0 bg-gradient-to-b from-transparent via-purple-500/[0.02] to-transparent pointer-events-none" />
  <!-- contenu -->
</section>
```

### Loader screen
```html
<div class="fixed inset-0 bg-black z-50 flex items-center justify-center">
  <div class="flex gap-2">
    <div class="w-3 h-3 rounded-full bg-purple-500 animate-bounce [animation-delay:0ms]" />
    <div class="w-3 h-3 rounded-full bg-pink-500 animate-bounce [animation-delay:150ms]" />
    <div class="w-3 h-3 rounded-full bg-indigo-500 animate-bounce [animation-delay:300ms]" />
  </div>
</div>
```

### Texte gradient
```html
<span class="bg-clip-text text-transparent bg-gradient-to-r from-purple-400 to-pink-400">
  Texte en dégradé
</span>
```


### Tilt 3D (cartes projets)

Effet de rotation 3D qui suit la souris — signature Lovable. Utilise `useMotionValue` + `useSpring` de Framer Motion.

```tsx
import { motion, useMotionValue, useSpring } from 'framer-motion'
import { type MouseEvent, useCallback } from 'react'

export function TiltCard({ children }: { children: React.ReactNode }) {
  const x = useMotionValue(0)
  const y = useMotionValue(0)

  const rotateX = useSpring(y, { stiffness: 300, damping: 30 })
  const rotateY = useSpring(x, { stiffness: 300, damping: 30 })

  const handleMouseMove = useCallback((e: MouseEvent<HTMLDivElement>) => {
    const rect = e.currentTarget.getBoundingClientRect()
    const centerX = rect.left + rect.width / 2
    const centerY = rect.top + rect.height / 2
    const posX = (e.clientX - centerX) / (rect.width / 2)  // -1 à +1
    const posY = (e.clientY - centerY) / (rect.height / 2) // -1 à +1
    x.set(posX * 5)   // rotation max 5 degrés
    y.set(posY * -5)
  }, [x, y])

  const handleMouseLeave = useCallback(() => {
    x.set(0)
    y.set(0)
  }, [x, y])

  return (
    <motion.div
      onMouseMove={handleMouseMove}
      onMouseLeave={handleMouseLeave}
      style={{ rotateX, rotateY, transformStyle: 'preserve-3d' }}
      className="transition-shadow duration-300"
    >
      {children}
    </motion.div>
  )
}
```

**Astuce :** Ajouter `className="group"` sur la carte et utiliser `group-hover:` pour des effets supplémentaires (glow, bordure).

---

### Shimmer (barres de progression)

Effet de lumière qui glisse sur la barre de progression — donne une impression de vie/dynamisme.

```css
/* CSS */
@keyframes shimmer {
  0% { transform: translateX(-100%); }
  100% { transform: translateX(100%); }
}

.skill-progress-shimmer::after {
  content: '';
  position: absolute;
  inset: 0;
  background: linear-gradient(
    90deg,
    transparent 0%,
    rgba(255, 255, 255, 0.15) 50%,
    transparent 100%
  );
  animation: shimmer 2s infinite;
  pointer-events: none;
}
```

```tsx
// Barre de progression dans un composant React
<div className="relative h-2 rounded-full bg-white/[0.06] overflow-hidden">
  <motion.div
    className="relative h-full rounded-full bg-gradient-to-r from-purple-500 to-pink-500 skill-progress-shimmer"
    initial={{ width: 0 }}
    whileInView={{ width: `${level}%` }}
    viewport={{ once: true }}
    transition={{ duration: 1, ease: [0.25, 0.1, 0.25, 1] }}
  />
</div>
```

---

### Button shine (boutons primaires)

Overlay brillant qui glisse au survol du bouton.

```css
.btn-shine {
  position: relative;
  overflow: hidden;
}

.btn-shine::before {
  content: '';
  position: absolute;
  top: 0;
  left: -75%;
  width: 50%;
  height: 100%;
  background: linear-gradient(
    90deg,
    transparent,
    rgba(255, 255, 255, 0.15),
    transparent
  );
  transform: skewX(-20deg);
  transition: left 0.5s ease;
}

.btn-shine:hover::before {
  left: 125%;
}
```

```html
<button class="btn-shine inline-flex items-center gap-2 px-8 py-4 rounded-xl bg-gradient-to-r from-purple-600 to-indigo-600 text-white font-medium">
  Label
</button>
```

---

### Curseur personnalisé (cursor follower)

Cercle qui suit la souris et grossit au survol des éléments interactifs.

```tsx
import { useEffect, useRef } from 'react'

export function CursorFollower() {
  const cursorRef = useRef<HTMLDivElement>(null)

  useEffect(() => {
    const onMove = (e: MouseEvent) => {
      if (!cursorRef.current) return
      cursorRef.current.style.transform = `translate(${e.clientX - 16}px, ${e.clientY - 16}px)`
    }

    const onHover = (e: MouseEvent) => {
      const target = e.target as HTMLElement
      const isInteractive = target.matches(
        'a, button, input, textarea, [role="button"], label, select'
      ) || target.closest('a, button, input, textarea, [role="button"], label, select')

      if (!cursorRef.current) return
      cursorRef.current.style.width = isInteractive ? '48px' : '16px'
      cursorRef.current.style.height = isInteractive ? '48px' : '16px'
      cursorRef.current.style.borderColor = isInteractive
        ? 'rgba(168, 85, 247, 0.5)'
        : 'rgba(255, 255, 255, 0.3)'
    }

    // Cacher le curseur natif
    document.body.style.cursor = 'none'
    document.addEventListener('mousemove', onMove)
    document.addEventListener('mouseover', onHover)

    return () => {
      document.body.style.cursor = ''
      document.removeEventListener('mousemove', onMove)
      document.removeEventListener('mouseover', onHover)
    }
  }, [])

  return (
    <div
      ref={cursorRef}
      className="fixed top-0 left-0 z-[9999] pointer-events-none rounded-full border"
      style={{
        width: '16px',
        height: '16px',
        borderColor: 'rgba(255, 255, 255, 0.3)',
        backgroundColor: 'rgba(168, 85, 247, 0.08)',
        backdropFilter: 'blur(4px)',
        transition: 'width 150ms ease-out, height 150ms ease-out, border-color 150ms ease-out',
        willChange: 'transform',
      }}
    />
  )
}
```

**Important :** Ajouter ce composant une seule fois dans `App.tsx`, tout en haut du JSX. Le curseur natif sera masqué (`cursor: none`).

---

## 8. Navigation

### Header glass (fixe)
```html
<header class="fixed top-0 left-0 right-0 z-50 transition-all duration-300
  bg-black/80 backdrop-blur-xl border-b border-white/[0.06]">
  <!-- contenu -->
</header>
```

### Logo
```html
<a class="text-lg font-bold tracking-tight">
  <span class="bg-clip-text text-transparent bg-gradient-to-r from-purple-400 to-pink-400">LOGO</span>
  <span class="text-white/40">.</span>
</a>
```

### Liens de navigation
```html
<a class="px-4 py-2 rounded-xl text-sm text-white/50 hover:text-white hover:bg-white/[0.06] transition-all duration-200">
  Accueil
</a>
```

---

## 9. Scrollbar personnalisée
```css
::-webkit-scrollbar {
  width: 6px;
}
::-webkit-scrollbar-track {
  background: transparent;
}
::-webkit-scrollbar-thumb {
  background: rgba(255, 255, 255, 0.1);
  border-radius: 3px;
}
::-webkit-scrollbar-thumb:hover {
  background: rgba(255, 255, 255, 0.2);
}
```

---

## 10. Checklist "Aesthetics First"

Avant de valider une feature, vérifier :

- [ ] **Dark mode** : Le fond est noir profond (`#000` ou `#0a0a0a`) ?
- [ ] **Glassmorphism** : Les cartes ont `bg-white/[0.03] + backdrop-blur + border-white/[0.06]` ?
- [ ] **Dégradés** : Les titres et boutons importants utilisent un gradient ?
- [ ] **Animations** : Les sections entrent avec `framer-motion` (fade-in-up) ?
- [ ] **Micro-interactions** : Les cartes et boutons ont un hover state fluide ?
- [ ] **Spacing** : Les sections ont `py-24 md:py-32` ? Les grilles respirent ?
- [ ] **Typographie** : Les titres utilisent la police display ? Le body est lisible ?
- [ ] **Tags** : Les badges/tags utilisent `bg-purple-500/10 text-purple-300 border-purple-500/20` ?
- [ ] **Boutons** : Les CTA primaires ont un gradient ? Les secondaires une bordure ?
- [ ] **Navigation** : Le header a un effet glass au scroll ?

---

## Advanced Motion & Immersion System (Scrollytelling, 3D & Micro-Interactions)

### 1. Smooth Scrolling (Lenis)

Wrapper React global pour un défilement fluide avec inertie, lourdeur physique et interpolation linéaire.

```tsx
import { ReactNode, useEffect } from 'react'
import Lenis from 'lenis'

export function SmoothScrollProvider({ children }: { children: ReactNode }) {
  useEffect(() => {
    const lenis = new Lenis({
      duration: 1.2,
      easing: (t) => Math.min(1, 1.001 - Math.pow(2, -10 * t)),
      orientation: 'vertical',
      smoothWheel: true,
    })

    function raf(time: number) {
      lenis.raf(time)
      requestAnimationFrame(raf)
    }

    requestAnimationFrame(raf)
    return () => lenis.destroy()
  }, [])

  return <>{children}</>
}
```

### 2. Scroll-Triggered Path (Scrollytelling & Route SVG)

Animation de tracé SVG synchronisée avec la progression du scroll (stroke-dashoffset / pathLength).

```tsx
import { motion, useScroll, useSpring } from 'framer-motion'
import { useRef } from 'react'

export function ScrollytellingPath() {
  const containerRef = useRef<HTMLDivElement>(null)
  const { scrollYProgress } = useScroll({
    target: containerRef,
    offset: ['start center', 'end center'],
  })

  const pathLength = useSpring(scrollYProgress, { stiffness: 100, damping: 30 })

  return (
    <div ref={containerRef} className="relative w-full h-[150vh] flex justify-center">
      <svg className="absolute top-0 w-32 h-full opacity-40" viewBox="0 0 100 1000" fill="none" preserveAspectRatio="none">
        <motion.path
          d="M 50 0 Q 100 250 50 500 T 50 1000"
          stroke="url(#motion-gradient)"
          strokeWidth="4"
          style={{ pathLength }}
        />
        <defs>
          <linearGradient id="motion-gradient" x1="0%" y1="0%" x2="0%" y2="100%">
            <stop offset="0%" stopColor="#a855f7" />
            <stop offset="100%" stopColor="#ec4899" />
          </linearGradient>
        </defs>
      </svg>
    </div>
  )
}
```

### 3. Pinning & Sticky Scroll Section

Verrouillage de l'écran pendant que les contenus/étapes défilent horizontalement ou en séquence.

```tsx
import { motion, useScroll, useTransform } from 'framer-motion'
import { useRef } from 'react'

export function StickyPinnedSection() {
  const targetRef = useRef<HTMLDivElement>(null)
  const { scrollYProgress } = useScroll({ target: targetRef })
  const x = useTransform(scrollYProgress, [0, 1], ['0%', '-66.6%'])

  return (
    <section ref={targetRef} className="relative h-[300vh] bg-black">
      <div className="sticky top-0 flex h-screen items-center overflow-hidden">
        <motion.div style={{ x }} className="flex gap-12 pl-12">
          <div className="h-[400px] w-[500px] rounded-3xl bg-white/[0.03] border border-white/10 p-8 backdrop-blur-xl shrink-0">Step 1</div>
          <div className="h-[400px] w-[500px] rounded-3xl bg-white/[0.03] border border-white/10 p-8 backdrop-blur-xl shrink-0">Step 2</div>
          <div className="h-[400px] w-[500px] rounded-3xl bg-white/[0.03] border border-white/10 p-8 backdrop-blur-xl shrink-0">Step 3</div>
        </motion.div>
      </div>
    </section>
  )
}
```

### 4. Effet Parallaxe au Scroll (Multi-Layer Offset)

Mouvement décalé entre l'arrière-plan et le premier plan pour créer de la profondeur.

```tsx
import { motion, useScroll, useTransform } from 'framer-motion'
import { useRef } from 'react'

export function ParallaxLayer({ children, speed = 50 }: { children: React.ReactNode; speed?: number }) {
  const ref = useRef(null)
  const { scrollYProgress } = useScroll({ target: ref, offset: ['start end', 'end start'] })
  const y = useTransform(scrollYProgress, [0, 1], [-speed, speed])

  return (
    <div ref={ref} className="relative overflow-hidden">
      <motion.div style={{ y }}>{children}</motion.div>
    </div>
  )
}
```

### 5. Zoom-In Portal Effect

Effet de plongée à l'intérieur d'un élément visuel au fil du scroll.

```tsx
import { motion, useScroll, useTransform } from 'framer-motion'
import { useRef } from 'react'

export function ZoomPortal({ children }: { children: React.ReactNode }) {
  const containerRef = useRef(null)
  const { scrollYProgress } = useScroll({ target: containerRef, offset: ['start start', 'end end'] })
  const scale = useTransform(scrollYProgress, [0, 1], [1, 15])
  const opacity = useTransform(scrollYProgress, [0.8, 1], [1, 0])

  return (
    <div ref={containerRef} className="h-[200vh] relative">
      <div className="sticky top-0 h-screen flex items-center justify-center overflow-hidden">
        <motion.div style={{ scale, opacity }} className="w-64 h-64 border-2 border-purple-500 rounded-full flex items-center justify-center">
          {children}
        </motion.div>
      </div>
    </div>
  )
}
```

### 6. Typographie Dynamique (Kinetic, Text Reveal, Scramble & Variable Font)

Accélération/apparition décalée des mots et effets de texte hacker/scramble au survol.

```tsx
import { motion } from 'framer-motion'
import { useState } from 'react'

export function KineticTextReveal({ text }: { text: string }) {
  const words = text.split(' ')

  return (
    <motion.h2
      className="text-4xl font-bold text-white flex flex-wrap gap-2"
      initial="hidden"
      whileInView="visible"
      viewport={{ once: true }}
      transition={{ staggerChildren: 0.08 }}
    >
      {words.map((word, idx) => (
        <motion.span
          key={idx}
          variants={{
            hidden: { opacity: 0, y: 30, rotateX: -90 },
            visible: { opacity: 1, y: 0, rotateX: 0 },
          }}
          transition={{ type: 'spring', damping: 14 }}
        >
          {word}
        </motion.span>
      ))}
    </motion.h2>
  )
}

export function TextScrambleHover({ originalText }: { originalText: string }) {
  const [text, setText] = useState(originalText)
  const chars = '!@#$%^&*()_+-=[]{}|;:,.<>?'

  const handleMouseEnter = () => {
    let iteration = 0
    const interval = setInterval(() => {
      setText(
        originalText
          .split('')
          .map((_, index) => {
            if (index < iteration) return originalText[index]
            return chars[Math.floor(Math.random() * chars.length)]
          })
          .join('')
      )
      if (iteration >= originalText.length) clearInterval(interval)
      iteration += 1 / 3
    }, 30)
  }

  return (
    <span onMouseEnter={handleMouseEnter} className="font-mono text-purple-400 cursor-pointer">
      {text}
    </span>
  )
}
```

### 7. Curseurs Personnalisés Magnétiques (Custom Cursor & Magnetic Hover)

Curseur suivi par un cercle magnétisé qui attire les boutons au survol.

```tsx
import { motion, useMotionValue, useSpring } from 'framer-motion'
import { useRef } from 'react'

export function MagneticButton({ children }: { children: React.ReactNode }) {
  const ref = useRef<HTMLButtonElement>(null)
  const x = useMotionValue(0)
  const y = useMotionValue(0)
  const springX = useSpring(x, { stiffness: 150, damping: 15 })
  const springY = useSpring(y, { stiffness: 150, damping: 15 })

  const handleMouseMove = (e: React.MouseEvent) => {
    if (!ref.current) return
    const { left, top, width, height } = ref.current.getBoundingClientRect()
    x.set((e.clientX - (left + width / 2)) * 0.35)
    y.set((e.clientY - (top + height / 2)) * 0.35)
  }

  const handleMouseLeave = () => {
    x.set(0)
    y.set(0)
  }

  return (
    <motion.button
      ref={ref}
      onMouseMove={handleMouseMove}
      onMouseLeave={handleMouseLeave}
      style={{ x: springX, y: springY }}
      className="px-6 py-3 rounded-full bg-white/10 border border-white/20 text-white backdrop-blur-md"
    >
      {children}
    </motion.button>
  )
}
```

### 8. Bento Grid Interactif & Halo Lumineux (Glassmorphism & Light Follow)

Cartes avec effet de verre dépoli où la lumière de bordure/fond suit la position exacte de la souris.

```tsx
import { useState } from 'react'

export function InteractiveBentoCard({ title, description }: { title: string; description: string }) {
  const [mousePosition, setMousePosition] = useState({ x: 0, y: 0 })

  const handleMouseMove = (e: React.MouseEvent<HTMLDivElement>) => {
    const rect = e.currentTarget.getBoundingClientRect()
    setMousePosition({ x: e.clientX - rect.left, y: e.clientY - rect.top })
  }

  return (
    <div
      onMouseMove={handleMouseMove}
      className="relative overflow-hidden rounded-3xl bg-white/[0.03] border border-white/[0.08] p-8 backdrop-blur-xl group hover:border-white/20 transition-all duration-300"
    >
      <div
        className="pointer-events-none absolute -inset-px opacity-0 group-hover:opacity-100 transition-opacity duration-300"
        style={{
          background: `radial-gradient(600px circle at ${mousePosition.x}px ${mousePosition.y}px, rgba(168, 85, 247, 0.15), transparent 40%)`,
        }}
      />
      <h3 className="text-2xl font-bold text-white mb-2">{title}</h3>
      <p className="text-zinc-400 text-sm">{description}</p>
    </div>
  )
}
```

### 9. Intégration Spline 3D & WebGL Shaders (Canvas Distorsion)

Composants préparés pour recevoir des scènes 3D interactives contrôlées au scroll.

```tsx
import Spline from '@splinetool/react-spline'

export function Spline3DScene({ sceneUrl }: { sceneUrl: string }) {
  return (
    <div className="w-full h-[500px] rounded-3xl overflow-hidden border border-white/10">
      <Spline scene={sceneUrl} />
    </div>
  )
}
```

---

## Font Stacks Recommandés

> Consulte le [Typography Guide](typography-guide.md) pour l'analyse complète.
> **Règle** : Display = police avec PERSONNALITÉ. Inter/DM Sans/Geist/Satoshi = BODY uniquement.

### Par défaut : Grenze (Display) + Inter (Body)

```css
/* src/index.css */
@import url('https://fonts.googleapis.com/css2?family=Grenze:wght@400;700;900&family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400&display=swap');

@layer base {
  :root {
    --font-display: 'Grenze', Georgia, serif;
    --font-sans: 'Inter', system-ui, -apple-system, sans-serif;
    --font-mono: 'JetBrains Mono', monospace;
  }

  h1, h2, h3, h4, .heading {
    font-family: var(--font-display);
  }
}
```

### Tailwind Config

```js
// tailwind.config.js
export default {
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter', 'system-ui', '-apple-system', 'sans-serif'],
        display: ['Grenze', 'Georgia', 'serif'],
        mono: ['JetBrains Mono', 'monospace'],
      },
    },
  },
}
```

### Paires par Catégorie de Site

**Portfolio/Créatif** : Grenze + Inter
```css
@import url('https://fonts.googleapis.com/css2?family=Grenze:wght@400;700;900&family=Inter:wght@400;500;600&display=swap');
--font-display: 'Grenze', Georgia, serif;
--font-sans: 'Inter', system-ui, sans-serif;
```

**SaaS Landing** : Cal Sans + Inter
```css
@import url('https://fonts.googleapis.com/css2?family=Cal+Sans&family=Inter:wght@400;500&display=swap');
--font-display: 'Cal Sans', sans-serif;
--font-sans: 'Inter', system-ui, sans-serif;
```

**Agency/Studio** : Clash Display + Satoshi
```css
<link href="https://api.fontshare.com/v2/css?f[]=clash-display@400,600,700&f[]=satoshi@400,500&display=swap" rel="stylesheet">
--font-display: 'Clash Display', sans-serif;
--font-sans: 'Satoshi', sans-serif;
```

**Food/Lifestyle** : Girassol + DM Sans
```css
@import url('https://fonts.googleapis.com/css2?family=Girassol&family=DM+Sans:wght@400;500&display=swap');
--font-display: 'Girassol', cursive;
--font-sans: 'DM Sans', system-ui, sans-serif;
```

**Festival/Événement** : Banger + Inter
```css
@import url('https://fonts.googleapis.com/css2?family=Banger&family=Inter:wght@400;500&display=swap');
--font-display: 'Banger', cursive;
--font-sans: 'Inter', system-ui, sans-serif;
```

**Web3/Crypto** : Clash Display + Satoshi
```css
<link href="https://api.fontshare.com/v2/css?f[]=clash-display@400,600,700&f[]=satoshi@400,500&display=swap" rel="stylesheet">
--font-display: 'Clash Display', sans-serif;
--font-sans: 'Satoshi', sans-serif;
```

**Horror/Gaming** : Nosifer + Inter
```css
@import url('https://fonts.googleapis.com/css2?family=Nosifer&family=Inter:wght@400;500&display=swap');
--font-display: 'Nosifer', system-ui;
--font-sans: 'Inter', system-ui, sans-serif;
```

**Kids/Playful** : Henny Penny + DM Sans
```css
@import url('https://fonts.googleapis.com/css2?family=Henny+Penny&family=DM+Sans:wght@400;500&display=swap');
--font-display: 'Henny Penny', system-ui;
--font-sans: 'DM Sans', system-ui, sans-serif;
```

**Street/Skate** : Bungee + Inter
```css
@import url('https://fonts.googleapis.com/css2?family=Bungee&family=Bungee+Shade&family=Inter:wght@400;500&display=swap');
--font-display: 'Bungee', sans-serif;
--font-sans: 'Inter', system-ui, sans-serif;
```

**Musique/Metal** : Metal Mania + Inter
```css
@import url('https://fonts.googleapis.com/css2?family=Metal+Mania&family=Inter:wght@400;500&display=swap');
--font-display: 'Metal Mania', cursive;
--font-sans: 'Inter', system-ui, sans-serif;
```

**Data/Dashboard** : Funnel Display + Inter
```css
@import url('https://fonts.googleapis.com/css2?family=Funnel+Display:wght@400;700&family=Inter:wght@400;500&display=swap');
--font-display: 'Funnel Display', sans-serif;
--font-sans: 'Inter', system-ui, sans-serif;
```

**Retro/Neon** : Monoton + Inter
```css
@import url('https://fonts.googleapis.com/css2?family=Monoton&family=Inter:wght@400;500&display=swap');
--font-display: 'Monoton', cursive;
--font-sans: 'Inter', system-ui, sans-serif;
```

**Afrofuturiste** : Ojuju + Inter
```css
@import url('https://fonts.googleapis.com/css2?family=Ojuju:wght@400;700&family=Inter:wght@400;500&display=swap');
--font-display: 'Ojuju', sans-serif;
--font-sans: 'Inter', system-ui, sans-serif;
```

**Handmade/Artisanal** : Playpen Sans + DM Sans
```css
@import url('https://fonts.googleapis.com/css2?family=Playpen+Sans:wght@400;700&family=DM+Sans:wght@400;500&display=swap');
--font-display: 'Playpen Sans', cursive;
--font-sans: 'DM Sans', system-ui, sans-serif;
```

**Sci-Fi/Futuriste** : Fascinate + Inter
```css
@import url('https://fonts.googleapis.com/css2?family=Fascinate&family=Inter:wght@400;500&display=swap');
--font-display: 'Fascinate', system-ui;
--font-sans: 'Inter', system-ui, sans-serif;
```

**Bold/Poster** : Oi + Inter
```css
@import url('https://fonts.googleapis.com/css2?family=Oi&family=Inter:wght@400;500&display=swap');
--font-display: 'Oi', sans-serif;
--font-sans: 'Inter', system-ui, sans-serif;
```

**Compact/Modular** : Khand + Inter
```css
@import url('https://fonts.googleapis.com/css2?family=Khand:wght@400;700&family=Inter:wght@400;500&display=swap');
--font-display: 'Khand', sans-serif;
--font-sans: 'Inter', system-ui, sans-serif;
```

**Military/Sport** : Black Ops One + Inter
```css
@import url('https://fonts.googleapis.com/css2?family=Black+Ops+One&family=Inter:wght@400;500&display=swap');
--font-display: 'Black Ops One', system-ui;
--font-sans: 'Inter', system-ui, sans-serif;
```

**Street Food** : Shrikhand + DM Sans
```css
@import url('https://fonts.googleapis.com/css2?family=Shrikhand&family=DM+Sans:wght@400;500&display=swap');
--font-display: 'Shrikhand', cursive;
--font-sans: 'DM Sans', system-ui, sans-serif;
```

**Memphis/90s** : Kablammo + Inter
```css
@import url('https://fonts.googleapis.com/css2?family=Kablammo&family=Inter:wght@400;500&display=swap');
--font-display: 'Kablammo', system-ui;
--font-sans: 'Inter', system-ui, sans-serif;
```

**Musique/Funk** : Bungee Shade + Inter
```css
@import url('https://fonts.googleapis.com/css2?family=Bungee+Shade&family=Inter:wght@400;500&display=swap');
--font-display: 'Bungee Shade', sans-serif;
--font-sans: 'Inter', system-ui, sans-serif;
```
