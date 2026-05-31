# 🚀 Lovable Architect Mode (V5) for Gemini CLI

**Lovable Architect Mode** est une "skill" avancée pour [Gemini CLI](https://github.com/google/gemini-cli) qui transforme l'IA en un ingénieur logiciel senior. Inspiré par la rapidité de Lovable.dev, il y ajoute des standards de production : architecture modulaire, tests unitaires (TDD), sécurité backend et mémoire de projet persistante.

## 🌟 Pourquoi cette Skill ?

Là où la plupart des outils d'IA génèrent du code "plat" et difficile à maintenir, **Lovable Architect Mode** impose une structure rigoureuse de niveau professionnel.

### Les 4 Piliers :
1.  **Aesthetics First** : Design système moderne via Tailwind CSS et Shadcn/UI (Pixel Perfect).
2.  **Feature-Based Architecture** : Organisation du code par domaine métier dans `src/features/[feature-name]`. Chaque dossier feature contient ses composants, hooks et services propres.
3.  **Test-Driven Development** : Intégration native de Vitest pour chaque composant et logique métier.
4.  **Persistent Memory** : Protocole `PROJECT.md` permettant à l'IA de se souvenir de l'état du projet et des décisions techniques d'une session à l'autre.

## 🛠️ Outils Inclus

La skill est livrée avec deux moteurs d'automatisation surpuissants :

*   **`setup-lovable-project.sh`** : Initialise une stack complète (Vite + React + TS + Tailwind + Shadcn + Vitest + Prettier + Path Aliases) en moins de 2 minutes.
*   **`generate-feature.sh`** : Génère instantanément une fonctionnalité complète avec ses dossiers, ses composants UI, son hook personnalisé, son service Supabase (incluant des suggestions de politiques RLS) et ses fichiers de tests.

## 📂 Structure d'une Feature générée
```text
src/features/[name]/
├── components/     # UI components stylisés
├── hooks/          # Logique métier testée
├── services/       # Intégration API/Supabase + RLS SQL
├── index.ts        # Barrel export propre
└── [name].test.tsx # Tests Vitest pré-configurés
```

## 🚀 Installation

1. Clone ce dépôt sur ta machine.
2. Compresse le contenu en fichier `.skill` (ou utilise le dossier directement).
3. Installe via Gemini CLI :
   ```bash
   gemini skills install path/to/lovable-mode.skill --scope user
   ```
4. Recharge tes skills :
   ```bash
   /skills reload
   ```

## 📖 Utilisation

Une fois activée, demande simplement à Gemini :
*   *"Initialise un nouveau projet Lovable pour une app de e-commerce."*
*   *"Génère une feature 'cart' avec gestion du panier local."*
*   *"Ajoute les tests unitaires pour le service d'authentification."*

---
*Développé avec ❤️ pour transformer le prototypage IA en ingénierie de production.*
