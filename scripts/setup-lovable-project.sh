#!/bin/bash

# Setup Lovable Architect Project (V5)
# Usage: ./setup-lovable-project.sh <project-name>

PROJECT_NAME=$1

if [ -z "$PROJECT_NAME" ]; then
  echo "Usage: ./setup-lovable-project.sh <project-name>"
  exit 1
fi

echo "🏗️  Building Lovable Architect Foundation V5: $PROJECT_NAME..."

# 1. Create Vite project
npm create vite@latest "$PROJECT_NAME" -- --template react-ts
cd "$PROJECT_NAME" || exit

# 2. Install Styling & UI
echo "🎨 Installing Styling & UI..."
npm install -D tailwindcss postcss autoprefixer tailwindcss-animate
npx tailwindcss init -p
npm install lucide-react framer-motion sonner clsx tailwind-merge

# 3. Install Animation & Immersion
echo "✨ Installing Animation & Immersion..."
npm install lenis @splinetool/react-spline

# 4. Install Logic & Backend
echo "📦 Installing Supabase & Logic..."
npm install @supabase/supabase-js @tanstack/react-query zod

# 5. Install Testing Suite
echo "🧪 Installing Vitest & Testing Library..."
npm install -D vitest @vitejs/plugin-react @testing-library/react \
  @testing-library/user-event @testing-library/dom @testing-library/jest-dom \
  jsdom

# 6. Install Quality Tools
echo "🧹 Installing ESLint & Prettier..."
npm install -D prettier eslint-config-prettier eslint-plugin-react

# 7. Configure Package Scripts
echo "📜 Configuring NPM scripts..."
npm pkg set scripts.test="vitest"
npm pkg set scripts.test:ui="vitest --ui"
npm pkg set scripts.test:coverage="vitest run --coverage"

# 8. Advanced Folder Structure
echo "📁 Creating Folder Structure..."
mkdir -p src/features src/services src/hooks src/lib src/components/ui src/components/animations src/test src/pages

# 9. Initialize PROJECT.md (Persistent Memory)
cat > PROJECT.md <<EOF
# Project: $PROJECT_NAME

## Architecture
- Framework: React + Vite
- Language: TypeScript (Strict Mode)
- Path Aliases: @/* -> src/*
- Styling: Tailwind CSS + Shadcn/UI
- Backend: Supabase
- Testing: Vitest + React Testing Library

## Status
- [x] Initial Scaffolding V5
- [ ] Setup Routing
- [ ] Feature: Authentication

## Decisions
- Used feature-based directory structure for scalability.
- Enforced Vitest for all business logic and complex components.
- Integrated path aliases (@/) for cleaner imports.
EOF

# 10. Configure Prettier
cat > .prettierrc <<EOF
{
  "semi": false,
  "singleQuote": true,
  "tabWidth": 2,
  "trailingComma": "es5"
}
EOF

# 11. Configure ESLint (flat config)
npm install -D eslint @eslint/js typescript-eslint eslint-plugin-react-hooks eslint-plugin-react-refresh

cat > eslint.config.js <<EOF
import js from "@eslint/js"
import tseslint from "typescript-eslint"
import reactHooks from "eslint-plugin-react-hooks"
import reactRefresh from "eslint-plugin-react-refresh"

export default tseslint.config(
  { ignores: ["dist"] },
  {
    extends: [js.configs.recommended, ...tseslint.configs.recommended],
    files: ["**/*.{ts,tsx}"],
    plugins: {
      "react-hooks": reactHooks,
      "react-refresh": reactRefresh,
    },
    rules: {
      ...reactHooks.configs.recommended.rules,
      "react-refresh/only-export-components": [
        "warn",
        { allowConstantExport: true },
      ],
    },
  }
)
EOF

# 12. Configure Vitest
cat > vitest.config.ts <<EOF
import path from "path"
import { defineConfig } from 'vitest/config'
import react from '@vitejs/plugin-react'

export default defineConfig({
  plugins: [react()],
  test: {
    environment: 'jsdom',
    globals: true,
    setupFiles: './src/test/setup.ts',
  },
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
})
EOF

mkdir -p src/test
cat > src/test/setup.ts <<EOF
import '@testing-library/jest-dom'
EOF

# 13. Configure Vite (with Aliases)
cat > vite.config.ts <<EOF
import path from "path"
import react from "@vitejs/plugin-react"
import { defineConfig } from "vite"

export default defineConfig({
  plugins: [react()],
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    },
  },
})
EOF

# 14. Configure TypeScript (Aliases & Strict Mode)
cat > tsconfig.json <<EOF
{
  "compilerOptions": {
    "target": "ESNext",
    "useDefineForClassFields": true,
    "lib": ["DOM", "DOM.Iterable", "ESNext"],
    "allowJs": false,
    "skipLibCheck": true,
    "esModuleInterop": false,
    "allowSyntheticDefaultImports": true,
    "strict": true,
    "forceConsistentCasingInFileNames": true,
    "module": "ESNext",
    "moduleResolution": "Bundler",
    "resolveJsonModule": true,
    "isolatedModules": true,
    "noEmit": true,
    "jsx": "react-jsx",
    "baseUrl": ".",
    "paths": {
      "@/*": ["./src/*"]
    }
  },
  "include": ["src"],
  "references": [{ "path": "./tsconfig.node.json" }]
}
EOF

cat > tsconfig.node.json <<EOF
{
  "compilerOptions": {
    "composite": true,
    "skipLibCheck": true,
    "module": "ESNext",
    "moduleResolution": "Bundler",
    "allowSyntheticDefaultImports": true
  },
  "include": ["vite.config.ts", "vitest.config.ts"]
}
EOF

# 15. Configure Shadcn
cat > components.json <<EOF
{
  "\$schema": "https://ui.shadcn.com/schema.json",
  "style": "default",
  "rsc": false,
  "tsx": true,
  "tailwind": {
    "config": "tailwind.config.js",
    "css": "src/index.css",
    "baseColor": "slate",
    "cssVariables": true,
    "prefix": ""
  },
  "aliases": {
    "components": "@/components",
    "utils": "@/lib/utils"
  }
}
EOF

cat > src/lib/utils.ts <<EOF
import { type ClassValue, clsx } from "clsx"
import { twMerge } from "tailwind-merge"

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs))
}
EOF

# 16. Configure Tailwind
cat > tailwind.config.js <<EOF
import tailwindcss-animate from "tailwindcss-animate"

/** @type {import('tailwindcss').Config} */
export default {
  darkMode: ["class"],
  content: ["./index.html", "./src/**/*.{js,ts,jsx,tsx}"],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter', 'system-ui', '-apple-system', 'sans-serif'],
        display: ['Grenze', 'Georgia', 'serif'],
        mono: ['JetBrains Mono', 'monospace'],
      },
      borderRadius: {
        lg: "var(--radius)",
        md: "calc(var(--radius) - 2px)",
        sm: "calc(var(--radius) - 4px)",
      },
      colors: {
        background: "hsl(var(--background))",
        foreground: "hsl(var(--foreground))",
        primary: {
          DEFAULT: "hsl(var(--primary))",
          foreground: "hsl(var(--primary-foreground))",
        },
        border: "hsl(var(--border))",
        input: "hsl(var(--input))",
        ring: "hsl(var(--ring))",
      },
    },
  },
  plugins: [tailwindcss-animate],
}
EOF

# 17. Create base CSS (Dark Mode natif)
cat > src/index.css <<EOF
@import url('https://fonts.googleapis.com/css2?family=Grenze:wght@400;700;900&family=Inter:wght@400;500;600&family=JetBrains+Mono:wght@400&display=swap');

@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --font-display: 'Grenze', Georgia, serif;
    --font-sans: 'Inter', system-ui, -apple-system, sans-serif;
    --font-mono: 'JetBrains Mono', monospace;
    --background: 0 0% 3.9%;
    --foreground: 0 0% 98%;
    --primary: 262.1 83.3% 57.8%;
    --primary-foreground: 0 0% 98%;
    --border: 0 0% 14.9%;
    --radius: 0.75rem;
  }
  h1, h2, h3, h4, .heading {
    font-family: var(--font-display);
  }
}
@layer base {
  * { @apply border-border; }
  body { @apply bg-background text-foreground antialiased; font-family: var(--font-sans); }
}
EOF

echo "✅ Lovable Architect V5 Ready!"
echo "🚀 Next steps: npm install && npm run dev"
echo "📝 Remember to maintain PROJECT.md for every session."
