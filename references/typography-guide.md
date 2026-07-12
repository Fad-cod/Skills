# Typography Guide — Polices qui Captent l'Attention

> **Principe** : Le choix de la police est le #1 facteur visuel qui détermine
> si un visiteur reste ou part. Une police "invisible" = pas d'attention.
> Une police avec personnalité = engagement.
>
> **Règle absolue** : Les Display fonts doivent avoir de la PERSONNALITÉ.
> Inter, DM Sans, Geist, Satoshi = BODY uniquement. Jamais Display.

---

## 1. Rôles Typographiques

| Rôle | Fonction | Poids typiques | Taille |
|---|---|---|---|
| **Display** | Hero headline, section titles — ce sur quoi l'oeil tombe | 400-900 | 4xl-8xl |
| **Body** | Paragraphes, bullets, FAQ | 400-500 | base-lg |
| **UI** | Boutons, navs, badges, micro-copy | 500 | sm-base |
| **Mono** | Code blocks, labels numériques, eyebrows | 400 | sm |

**Règle** : Display et Body doivent être DIFFÉRENTS (contrast move). Le contraste typographique crée l'attention.

---

## 2. Display Fonts — Catégories

### 🗡️ Blackletter / Gothic Hybrids

Fonts qui mélangent Roman et Blackletter — texture visuelle forte, authority.

#### Grenze (DEFAULT du skill)
- **Type** : Serif hybrid (Roman + Blackletter)
- **Pourquoi ça marche** : Texture visuelle forte, "loude" sans être illisible. 9 poids du Thin au Black.
- **Poids recommandés** : 400, 700, 900
- **Source** : Google Fonts (variable)
- **Idéal pour** : Hero headlines, titres éditoriaux, sites créatifs, tout type de site
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Grenze:wght@400;700;900&display=swap');
--font-display: 'Grenze', Georgia, serif;
```

#### Banger
- **Type** : Spiky blackletter avec courbes vives
- **Pourquoi ça marche** : Metal-inspired flair avec charme inattendu. Pas de lignes droites.
- **Poids recommandés** : 400
- **Source** : Google Fonts
- **Idéal pour** : Festivals, événements, branding audacieux, sites music/gaming
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Banger&display=swap');
--font-display: 'Banger', cursive;
```

#### Shrikhand
- **Type** : Bold courbe, lettrage de rue indien
- **Pourquoi ça marche** : "Big, bold, unapologetic." Inspiré par les panneaux peints du Gujarat. Couleur et vibrance.
- **Poids recommandés** : 400
- **Source** : Google Fonts
- **Idéal pour** : Food, restaurants, branding énergique, Marché asiatique/indien
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Shrikhand&display=swap');
--font-display: 'Shrikhand', cursive;
```

#### Ruslan Display
- **Type** : Cyrillique médiéval des années 70
- **Pourquoi ça marche** : Design du métro de Kiev, hybrid ustav/midiéval. Ultra-rare comme style.
- **Poids recommandés** : 400
- **Source** : Google Fonts
- **Idéal pour** : Projets est-européens, branding vintage russe, musées
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Ruslan+Display&display=swap');
--font-display: 'Ruslan+Display', serif;
```

---

### ↩️ Reverse Contrast

Épaisseur horizontale > verticale = inattendu = impossibilité de ne pas regarder.

#### Ojuju
- **Type** : Afro-grotesque reverse contrast
- **Pourquoi ça marche** : Inspiré des masques Dogon du Mali + affiches de cinéma africain des années 70. Apertures variables du light au bold. Aucune autre police ne ressemble à ça.
- **Poids recommandés** : 400, 700
- **Source** : Google Fonts
- **Idéal pour** : Web3 afrofuturiste, branding culturel, projets expérimentaux, festivals
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Ojuju:wght@400;700&display=swap');
--font-display: 'Ojuju', sans-serif;
```

---

### 💥 Ultra-Bold / Slab / Clarendon

Typographie qui crie. Slab serifs, stencil, ultra-bold.

#### Oi
- **Type** : Ultra-fat Clarendon slab
- **Pourquoi ça marche** : "A whimsical loudmouth attention seeker." Rooted in 1845 Clarendon mais twisted. Le type le plus fort de Google Fonts.
- **Poids recommandés** : 400
- **Source** : Google Fonts
- **Idéal pour** : Posters, header massif, branding qui veut dominer l'espace
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Oi&display=swap');
--font-display: 'Oi', sans-serif;
```

#### Black Ops One
- **Type** : Military stencil display
- **Pourquoi ça marche** : Impact brutal, autorité, urgence. Pas de discussion possible.
- **Poids recommandés** : 400
- **Source** : Google Fonts
- **Idéal pour** : Sécu, alertes, branding militaire/sport, fitness
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Black+Ops+One&display=swap');
--font-display: 'Black+Ops+One', system-ui;
```

#### Rubik Mono One
- **Type** : Ultra bold géométrique blockade
- **Pourquoi ça marche** : Masse visuelle énorme, poids unique mais dévastateur.
- **Poids recommandés** : 400
- **Source** : Google Fonts
- **Idéal pour** : Hero massif, branding bold, street art
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Rubik+Mono+One&display=swap');
--font-display: 'Rubik+Mono+One', sans-serif;
```

---

### 🎪 Memphis / 90s / Psychedelic

Jouable, maximaliste, expérimental. Fonts qui ne prennent pas au sérieux.

#### Kablammo
- **Type** : Variable font avec axe MORF (Morph)
- **Pourquoi ça marche** : Les lettres DANNOT. Memphis 90s, cartoons, toys. L'axe MORF fait danser les glyphes — parfait pour les animations CSS/JS.
- **Poids recommandés** : Variable (MORF axis)
- **Source** : Google Fonts
- **Idéal pour** : Festivals, games, sites enfants, projets expérimentaux, hero animé
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Kablammo&display=swap');
--font-display: 'Kablammo', system-ui;
/* Animer avec : font-variation-settings: 'MORF' 0 → 1; */
```

#### Bungee
- **Type** : Urban sign stacking, 5 variantes
- **Pourquoi ça marche** : Inspiré des panneaux urbains empilés. 5 variantes : Hairline, Inline, Outline, Shade, Color Font. Le plus polyvalent des bold.
- **Poids recommandés** : 400 (Bungee Shade pour hero, Bungee Inline pour accents)
- **Source** : Google Fonts
- **Idéal pour** : Urban branding, street food, skate culture, festivals, multicolor displays
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Bungee&family=Bungee+Shade&family=Bungee+Inline&display=swap');
--font-display: 'Bungee', sans-serif;
--font-display-shade: 'Bungee Shade', sans-serif;
--font-display-inline: 'Bungee Inline', sans-serif;
```

#### Monoton
- **Type** : Néon rétro Art Déco
- **Pourquoi ça marche** : Un seul poids mais ICONIQUE. Rappelle les enseignes néon des années 50. Effet lumineux immédiat.
- **Poids recommandés** : 400
- **Source** : Google Fonts
- **Idéal pour** : Thématique rétro, bars, cinémas, nuits, branding vintage neon
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Monoton&display=swap');
--font-display: 'Monoton', cursive;
```

---

### 🎨 Hand-painted / Street / Artisanal

Humain, organique, main levée. Le contraire du digital froid.

#### Girassol
- **Type** : Panneaux peints portugais, serifs épineux
- **Pourquoi ça marche** : "Thorny decorative serif construction that pierces the baseline." Flourishes + discretionary ligatures = chaque mot est une oeuvre.
- **Poids recommandés** : 400
- **Source** : Google Fonts
- **Idéal pour** : Restaurants portugais/med, branding artisanal, food premium
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Girassol&display=swap');
--font-display: 'Girassol', cursive;
```

#### Shantell Sans
- **Type** : Marker style Shantell Martin, variable bounce axis
- **Pourquoi ça marche** : Créé par Shantell Martin. Axe de "bounce" variable = animation possible. Marker authentique.
- **Poids recommandés** : 400-700
- **Source** : Google Fonts
- **Idéal pour** : Branding créatif, studios, portfolios, education
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Shantell+Sans:wght@400;700&display=swap');
--font-display: 'Shantell+Sans', system-ui;
/* Animer avec : font-variation-settings: 'BNCE' 0 → 100, 'INFM' 0 → 100; */
```

#### Lacquer
- **Type** : Paint pen main levée avec drips lourds
- **Pourquoi ça marche** : Hand-drawn avec paint pen, dozens of alternate glyphs. Chaque lettre est unique.
- **Poids recommandés** : 400
- **Source** : Google Fonts
- **Idéal pour** : Restaurants, street food, branding organique, événements
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Lacquer&display=swap');
--font-display: 'Lacquer', system-ui;
```

#### Playpen Sans
- **Type** : Handwritten avec 7 alternates par caractère + shuffler automatique
- **Pourquoi ça marche** : 7 versions de chaque lettre, shuffler intégré = jamais répétitif. Result = organique, vivant.
- **Poids recommandés** : 100-800
- **Source** : Google Fonts (variable)
- **Idéal pour** : Kids, food, wellness, tout projet qui veut sembler "fait main"
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Playpen+Sans:wght@400;700&display=swap');
--font-display: 'Playpen+Sans', cursive;
```

#### Henny Penny
- **Type** : Offbeat, pas de baseline commune, pas de taille commune
- **Pourquoi ça marche** : "No common baseline, no common character size, no common slope." Absurde = mémorable.
- **Poids recommandés** : 400
- **Source** : Google Fonts
- **Idéal pour** : Enfants, contes, jeux, sites playfun
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Henny+Penny&display=swap');
--font-display: 'Henny+Penny', system-ui;
```

#### Nerko One
- **Type** : Chunky marker, smooth + sleek
- **Pourquoi ça marche** : Fait avec des vrais marker pens sur papier. Natural feeling, funky et modern.
- **Poids recommandés** : 400
- **Source** : Google Fonts
- **Idéal pour** : Branding friendly, food, lifestyle, social media
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Nerko+One&display=swap');
--font-display: 'Nerko+One', cursive;
```

---

### 🚀 Futuristic / Sci-Fi / Tech

Fonts qui projettent dans le futur ou dans l'espace.

#### Fascinate + Fascinate Inline
- **Type** : Art Déco meets sci-fi, dramatic
- **Pourquoi ça marche** : Geometric display avec détails Art Déco. Fascinate Inline ajoute des lignes internes = texture supplémentaire.
- **Poids recommandés** : 400
- **Source** : Google Fonts
- **Idéal pour** : Sci-fi, tech futuriste, films, gaming, projets spatiaux
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Fascinate&family=Fascinate+Inline&display=swap');
--font-display: 'Fascinate', system-ui;
--font-display-inline: 'Fascinate+Inline', system-ui;
```

#### Space Mono
- **Type** : Mono avec personnalité, Eurostile/Microgramma 60s
- **Pourquoi ça marche** : Sci-fi rétro-futuriste. Monospace qui ne fait pas "code" mais fait "espace".
- **Poids recommandés** : 400, 700
- **Source** : Google Fonts
- **Idéal pour** : Dev tools, portfolios tech, projets spatiaux, sci-fi
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Space+Mono:wght@400;700&display=swap');
--font-display: 'Space Mono', monospace;
```

#### Nosifer
- **Type** : Horror neon, dripping
- **Pourquoi ça marche** : Ultra-niche. Néon qui coule. Horror + neon = attention maximale dans le bon contexte.
- **Poids recommandés** : 400
- **Source** : Google Fonts
- **Idéal pour** : Horror, Halloween, events dark, gaming scary
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Nosifer&display=swap');
--font-display: 'Nosifer', system-ui;
```

#### Metal Mania
- **Type** : Heavy metal blackletter extrême
- **Pourquoi ça marche** : Blackletter porté au max. Metal music, festivals, branding extrem.
- **Poids recommandés** : 400
- **Source** : Google Fonts
- **Idéal pour** : Metal, punk, festivals musicaux, branding extrem
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Metal+Mania&display=swap');
--font-display: 'Metal+Mania', cursive;
```

---

### 🏛️ Art Déco / Geometric Bold

Structuré mais distinctif. Géométrique avec caractère.

#### Khand
- **Type** : Compact, modular, dynamic
- **Pourquoi ça marche** : Contre-formes ultra-ouvertes. Modulaire = chaque lettre est un bloc. Compact mais lisible.
- **Poids recommandés** : 300-700
- **Source** : Google Fonts
- **Idéal pour** : Agency, studio, branding compact, titres serrés
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Khand:wght@400;700&display=swap');
--font-display: 'Khand', sans-serif;
```

#### Funnel Display
- **Type** : Data-inspired, stems shifted
- **Pourquoi ça marche** : Inspiré par la data visualization. Stems décalés = mouvement même à l'arrêt.
- **Poids recommandés** : 400-700
- **Source** : Google Fonts
- **Idéal pour** : Data viz, dashboards, tech, SaaS data-driven
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Funnel+Display:wght@400;700&display=swap');
--font-display: 'Funnel+Display', sans-serif;
```

#### Cal Sans
- **Type** : Geometric tight "tight but not touching"
- **Pourquoi ça marche** : Conçu par Cal.com. Spacing ultra serré par défaut. Alternatives Futura intégrées (ss01). Le SaaS par défaut.
- **Poids recommandés** : 400
- **Source** : Google Fonts
- **Idéal pour** : SaaS landing, pricing, hero sections tech
- **Config** :
```css
@import url('https://fonts.googleapis.com/css2?family=Cal+Sans&display=swap');
--font-display: 'Cal+Sans', sans-serif;
```

#### Clash Display
- **Type** : Geometric display angulaire
- **Pourquoi ça marche** : Sharp angles, "vibrant" edges, controlled chaos. Web3/studio vibe.
- **Poids recommandés** : 400, 600, 700
- **Source** : Fontshare (gratuit)
- **Idéal pour** : Hero modernes, Web3, studios créatifs, branding bold
- **Config** :
```html
<link href="https://api.fontshare.com/v2/css?f[]=clash-display@400,600,700&display=swap" rel="stylesheet">
--font-display: 'Clash Display', sans-serif;
```

---

## 3. Polices Body (Lisibilité — PAS pour les titres)

> Ces polices sont INTERDITES en Display. Elles sont trop neutres pour capter l'attention.

### Inter (Baseline — Le plus sûr)
- **Type** : Sans-serif optimisé écran
- **Poids** : 400, 500, 600
- **Config** : `--font-sans: 'Inter', system-ui, sans-serif;`

### Geist (Vercel-style)
- **Type** : Sans-serif + Mono
- **Poids** : 400, 500, 600
- **Config** : `--font-sans: 'Geist', system-ui, sans-serif;`

### Satoshi (Contemporain)
- **Type** : Geometric sans, Fontshare
- **Poids** : 400, 500
- **Config** : `--font-body: 'Satoshi', sans-serif;`

### Space Grotesk (Tech/Dev — double usage possible)
- **Type** : Geometric sans avec character
- **Poids** : 400, 500, 700
- **Config** : `--font-sans: 'Space Grotesk', system-ui, sans-serif;`
- **Note** : Acceptable en Display SEULEMENT si aucune autre Display n'est disponible.

### DM Sans (Versatile)
- **Type** : Geometric sans, slightly humanist
- **Poids** : 400, 500, 700
- **Config** : `--font-sans: 'DM Sans', system-ui, sans-serif;`

### Plus Jakarta Sans (Warm)
- **Type** : Geometric avec terminaisons douces
- **Poids** : 400, 500, 700
- **Config** : `--font-sans: 'Plus+Jakarta+Sans', sans-serif;`

---

## 4. Polices Mono (Code / Tech)

### JetBrains Mono
- **Ligatures** : Oui
- **Config** : `--font-mono: 'JetBrains Mono', monospace;`

### Geist Mono
- **Pairé avec** : Geist
- **Config** : `--font-mono: 'Geist Mono', monospace;`

### Space Mono
- **Note** : Peut servir ET en Mono ET en Display (sci-fi)
- **Config** : `--font-mono: 'Space Mono', monospace;`

---

## 5. Paires Recommandées par Catégorie de Site

| Catégorie | Display | Body | Mono | Vibe |
|---|---|---|---|---|
| **Portfolio/Créatif** | Grenze | Inter | JetBrains Mono | Magazine, éditorial |
| **SaaS Landing** | Cal Sans | Inter | JetBrains Mono | Tech, clean, tight |
| **Agency/Studio** | Clash Display | Satoshi | Geist Mono | Web3, bold, studio |
| **Food/Lifestyle** | Girassol | DM Sans | — | Artisanal, portugais |
| **Festival/Événement** | Banger | Inter | — | Metal, urgent, loud |
| **Web3/Crypto** | Clash Display | Satoshi | Space Mono | Futuriste, sharp |
| **Horror/Gaming** | Nosifer | Inter | JetBrains Mono | Dark, neon, scary |
| **Kids/Playful** | Henny Penny | DM Sans | — | Offbeat, fun |
| **Street/Skate** | Bungee | Inter | Space Mono | Urban, stacking |
| **Musique/Metal** | Metal Mania | Inter | Space Mono | Extrême, blackletter |
| **Data/Dashboard** | Funnel Display | Inter | JetBrains Mono | Data-driven, shifted |
| **Retro/Neon** | Monoton | Inter | Space Mono | Néon, Art Déco |
| **Afrofuturiste** | Ojuju | Inter | JetBrains Mono | Reverse contrast, culturel |
| **Handmade/Artisanal** | Playpen Sans | DM Sans | — | 7 alternates, organique |
| **Sci-Fi/Futuriste** | Fascinate | Inter | Space Mono | Dramatic, spatial |
| **Bold/Poster** | Oi | Inter | — | Ultra-fat, loudmouth |
| **Compact/Modular** | Khand | Inter | JetBrains Mono | Agency, dense |
| **Military/Sport** | Black Ops One | Inter | — | Stencil, impact |
| **Street Food** | Shrikhand | DM Sans | — | Bold indien, unapologetic |
| **Musique/Funk** | Kablammo | Inter | — | Memphis 90s, animable |

---

## 6. Configuration Tailwind

### `tailwind.config.js`

```js
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

### `src/index.css` — Import des fonts

```css
/* DEFAULT : Grenze + Inter + JetBrains Mono */
@import url('https://fonts.googleapis.com/css2?family=Grenze:wght@400;700;900&family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400&display=swap');

@layer base {
  :root {
    --font-display: 'Grenze', Georgia, serif;
    --font-sans: 'Inter', system-ui, sans-serif;
    --font-mono: 'JetBrains Mono', monospace;
  }
  h1, h2, h3, h4, .heading {
    font-family: var(--font-display);
  }
}
```

### Exemples d'imports par catégorie

```css
/* SaaS : Cal Sans */
@import url('https://fonts.googleapis.com/css2?family=Cal+Sans&family=Inter:wght@400;500&display=swap');

/* Web3 : Clash Display (Fontshare) */
<link href="https://api.fontshare.com/v2/css?f[]=clash-display@400,600,700&f[]=satoshi@400,500&display=swap" rel="stylesheet">

/* Food : Girassol */
@import url('https://fonts.googleapis.com/css2?family=Girassol&family=DM+Sans:wght@400;500&display=swap');

/* Festival : Banger */
@import url('https://fonts.googleapis.com/css2?family=Banger&family=Inter:wght@400;500&display=swap');

/* Memphis : Kablammo */
@import url('https://fonts.googleapis.com/css2?family=Kablammo&family=Inter:wght@400;500&display=swap');

/* Street : Bungee */
@import url('https://fonts.googleapis.com/css2?family=Bungee&family=Bungee+Shade&family=Inter:wght@400;500&display=swap');

/* Neon : Monoton */
@import url('https://fonts.googleapis.com/css2?family=Monoton&family=Inter:wght@400;500&display=swap');

/* Horror : Nosifer */
@import url('https://fonts.googleapis.com/css2?family=Nosifer&family=Inter:wght@400;500&display=swap');
```

---

## 7. Règles d'Or Typographiques

1. **Maximum 2 familles de police** par page (Display + Body). 3 avec Mono si dev-tools.
2. **Le Display doit être DIFFÉRENT du Body** — c'est le contraste qui crée l'attention.
3. **Inter, DM Sans, Geist, Satoshi = BODY uniquement** — jamais en Display.
4. **Variable fonts > Static fonts** → 40-60% moins de poids.
5. **Taille body minimum** : 14-16px.
6. **Tester sur mobile** : Les Display avec détails fins (Girassol, Lacquer) perdent en dessous de 24px.
7. **Grenze fonctionne partout** car elle a 9 poids → couvre tous les besoins Display.
8. **Kablammo/Shantell Sans** = parfaits pour les animations grâce à leurs axes variables.
9. **Bungee** = le plus polyvalent des Display (5 variantes = 5 vibes différentes).
10. **Chaque site DOIT avoir sa propre Display** — ne jamais utiliser la même Display que le site précédent.

---

## 8. Impact Psychologique des Polices

| Style | Effet psychologique | Exemples de usage |
|---|---|---|
| **Blackletter (Grenze, Banger, Metal Mania)** | Authority, tradition, force, rebélion | Magazines, luxe, metal, festivals |
| **Reverse Contrast (Ojuju)** | Inattendu, perturbant, culturel | Web3 afro, expérimental, art |
| **Ultra-Bold (Oi, Rubik Mono One)** | Dominance, urgence, impact | Posters, hero massif, alertes |
| **Memphis/90s (Kablammo, Bungee)** | Jouabilité, fun, énergie | Festivals, games, kids |
| **Handmade (Girassol, Lacquer, Playpen)** | Authenticité, chaleur, artisanat | Food, wellness, branding organique |
| **Futuristic (Fascinate, Nosifer)** | Innovation, mystère,科幻 | Sci-fi, gaming, tech spatial |
| **Geometric Bold (Clash, Cal Sans, Khand)** | Confiance, modernité, tech | SaaS, Web3, agency |
