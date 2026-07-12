# Animation Recipes — Composants Injectés

> **Règle** : Copier ces composants tels quels. Ne pas les régénérer avec l'IA.
> Chaque recipe contient les deps nécessaires et les props documentées.

---

## 1. SmoothScrollProvider (Lenis)

Wrapper global pour un défilement fluide avec inertie physique.

**Deps** : `npm install lenis`

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

**Usage** : Envelopper `App.tsx` avec `<SmoothScrollProvider>`.

---

## 2. MagneticButton

Bouton qui s'attire vers la souris avec spring physics.

**Deps** : `framer-motion` (déjà installé)

```tsx
import { motion, useMotionValue, useSpring } from 'framer-motion'
import { useRef } from 'react'

interface MagneticButtonProps {
  children: React.ReactNode
  className?: string
  strength?: number
}

export function MagneticButton({ children, className = '', strength = 0.35 }: MagneticButtonProps) {
  const ref = useRef<HTMLButtonElement>(null)
  const x = useMotionValue(0)
  const y = useMotionValue(0)
  const springX = useSpring(x, { stiffness: 150, damping: 15 })
  const springY = useSpring(y, { stiffness: 150, damping: 15 })

  const handleMouseMove = (e: React.MouseEvent) => {
    if (!ref.current) return
    const { left, top, width, height } = ref.current.getBoundingClientRect()
    x.set((e.clientX - (left + width / 2)) * strength)
    y.set((e.clientY - (top + height / 2)) * strength)
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
      className={`px-6 py-3 rounded-full bg-white/10 border border-white/20 text-white backdrop-blur-md transition-colors duration-300 hover:bg-white/20 ${className}`}
    >
      {children}
    </motion.button>
  )
}
```

**Props** :
- `strength` : Intensité de l'attraction (0.1 = subtil, 0.5 = fort, défaut 0.35)

---

## 3. TextScrambleHover

Texte qui se mélange en caractères aléatoires au survol puis se reconstruit.

**Deps** : aucune (React pur)

```tsx
import { useState } from 'react'

interface TextScrambleHoverProps {
  originalText: string
  className?: string
}

export function TextScrambleHover({ originalText, className = '' }: TextScrambleHoverProps) {
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
    <span
      onMouseEnter={handleMouseEnter}
      className={`font-mono text-purple-400 cursor-pointer select-none ${className}`}
    >
      {text}
    </span>
  )
}
```

**Usage** : Pour les noms de features, les labels de navigation, les titres interactifs.

---

## 4. InteractiveBentoCard (Light Follow)

Carte glassmorphism avec halo lumineux qui suit la souris.

**Deps** : aucune (React + Tailwind pur)

```tsx
import { useState } from 'react'

interface InteractiveBentoCardProps {
  title: string
  description: string
  className?: string
  icon?: React.ReactNode
}

export function InteractiveBentoCard({ title, description, className = '', icon }: InteractiveBentoCardProps) {
  const [mousePosition, setMousePosition] = useState({ x: 0, y: 0 })

  const handleMouseMove = (e: React.MouseEvent<HTMLDivElement>) => {
    const rect = e.currentTarget.getBoundingClientRect()
    setMousePosition({ x: e.clientX - rect.left, y: e.clientY - rect.top })
  }

  return (
    <div
      onMouseMove={handleMouseMove}
      className={`relative overflow-hidden rounded-3xl bg-white/[0.03] border border-white/[0.08] p-8 backdrop-blur-xl group hover:border-white/20 transition-all duration-300 ${className}`}
    >
      <div
        className="pointer-events-none absolute -inset-px opacity-0 group-hover:opacity-100 transition-opacity duration-300"
        style={{
          background: `radial-gradient(600px circle at ${mousePosition.x}px ${mousePosition.y}px, rgba(168, 85, 247, 0.15), transparent 40%)`,
        }}
      />
      {icon && <div className="mb-4 text-purple-400">{icon}</div>}
      <h3 className="text-2xl font-bold text-white mb-2 relative z-10">{title}</h3>
      <p className="text-zinc-400 text-sm relative z-10">{description}</p>
    </div>
  )
}
```

**Usage** : Grilles Bento de features, sections de pricing, cards de testimonials.

---

## 5. ScrollytellingPath (SVG pathLength)

Tracé SVG qui se dessine au scroll.

**Deps** : `framer-motion`

```tsx
import { motion, useScroll, useSpring } from 'framer-motion'
import { useRef } from 'react'

interface ScrollytellingPathProps {
  className?: string
  path?: string
  colorFrom?: string
  colorTo?: string
}

export function ScrollytellingPath({
  className = '',
  path = 'M 50 0 Q 100 250 50 500 T 50 1000',
  colorFrom = '#a855f7',
  colorTo = '#ec4899',
}: ScrollytellingPathProps) {
  const containerRef = useRef<HTMLDivElement>(null)
  const { scrollYProgress } = useScroll({
    target: containerRef,
    offset: ['start center', 'end center'],
  })

  const pathLength = useSpring(scrollYProgress, { stiffness: 100, damping: 30 })

  return (
    <div ref={containerRef} className={`relative w-full h-[150vh] flex justify-center ${className}`}>
      <svg className="absolute top-0 w-32 h-full opacity-40" viewBox="0 0 100 1000" fill="none" preserveAspectRatio="none">
        <motion.path d={path} stroke={`url(#motion-gradient)`} strokeWidth="4" style={{ pathLength }} />
        <defs>
          <linearGradient id="motion-gradient" x1="0%" y1="0%" x2="0%" y2="100%">
            <stop offset="0%" stopColor={colorFrom} />
            <stop offset="100%" stopColor={colorTo} />
          </linearGradient>
        </defs>
      </svg>
    </div>
  )
}
```

---

## 6. StickyPinnedSection (Horizontal Scroll)

Section sticky qui défile horizontalement au scroll vertical.

**Deps** : `framer-motion`

```tsx
import { motion, useScroll, useTransform } from 'framer-motion'
import { useRef } from 'react'

interface PinnedStep {
  title: string
  content: string
}

interface StickyPinnedSectionProps {
  steps: PinnedStep[]
  className?: string
}

export function StickyPinnedSection({ steps, className = '' }: StickyPinnedSectionProps) {
  const targetRef = useRef<HTMLDivElement>(null)
  const { scrollYProgress } = useScroll({ target: targetRef })
  const x = useTransform(scrollYProgress, [0, 1], ['0%', `-${((steps.length - 1) / steps.length) * 100}%`])

  return (
    <section ref={targetRef} className={`relative h-[300vh] bg-black ${className}`}>
      <div className="sticky top-0 flex h-screen items-center overflow-hidden">
        <motion.div style={{ x }} className="flex gap-12 pl-12">
          {steps.map((step, i) => (
            <div
              key={i}
              className="h-[400px] w-[500px] rounded-3xl bg-white/[0.03] border border-white/10 p-8 backdrop-blur-xl shrink-0"
            >
              <h3 className="text-2xl font-bold text-white mb-4">{step.title}</h3>
              <p className="text-zinc-400">{step.content}</p>
            </div>
          ))}
        </motion.div>
      </div>
    </section>
  )
}
```

**Props** :
- `steps` : Tableau de `{ title, content }` (3-5 étapes recommandées)

---

## 7. KineticTextReveal

Titres qui apparaissent mot par mot avec rotation 3D.

**Deps** : `framer-motion`

```tsx
import { motion } from 'framer-motion'

interface KineticTextRevealProps {
  text: string
  className?: string
}

export function KineticTextReveal({ text, className = '' }: KineticTextRevealProps) {
  const words = text.split(' ')

  return (
    <motion.h2
      className={`text-4xl font-bold text-white flex flex-wrap gap-2 ${className}`}
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
```

---

## 8. ZoomPortal

Effet de plongée/zoom au scroll.

**Deps** : `framer-motion`

```tsx
import { motion, useScroll, useTransform } from 'framer-motion'
import { useRef } from 'react'

interface ZoomPortalProps {
  children: React.ReactNode
  className?: string
}

export function ZoomPortal({ children, className = '' }: ZoomPortalProps) {
  const containerRef = useRef(null)
  const { scrollYProgress } = useScroll({ target: containerRef, offset: ['start start', 'end end'] })
  const scale = useTransform(scrollYProgress, [0, 1], [1, 15])
  const opacity = useTransform(scrollYProgress, [0.8, 1], [1, 0])

  return (
    <div ref={containerRef} className={`h-[200vh] relative ${className}`}>
      <div className="sticky top-0 h-screen flex items-center justify-center overflow-hidden">
        <motion.div style={{ scale, opacity }} className="w-64 h-64 border-2 border-purple-500 rounded-full flex items-center justify-center">
          {children}
        </motion.div>
      </div>
    </div>
  )
}
```

---

## Barrel Export

```tsx
// src/components/animations/index.ts
export { SmoothScrollProvider } from './SmoothScrollProvider'
export { MagneticButton } from './MagneticButton'
export { TextScrambleHover } from './TextScrambleHover'
export { InteractiveBentoCard } from './InteractiveBentoCard'
export { ScrollytellingPath } from './ScrollytellingPath'
export { StickyPinnedSection } from './StickyPinnedSection'
export { KineticTextReveal } from './KineticTextReveal'
export { ZoomPortal } from './ZoomPortal'
```
