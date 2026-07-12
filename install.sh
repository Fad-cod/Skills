#!/bin/bash
# ──────────────────────────────────────────────────────────────
# Lovable Architect V5 — Installateur universel
# Usage: curl -sL https://raw.githubusercontent.com/Fad-cod/Skills/main/install.sh | bash
# ──────────────────────────────────────────────────────────────

set -e

REPO="Fad-cod/Skills"
SKILL_NAME="lovable-architect"
CANONICAL="$HOME/.agents/skills/$SKILL_NAME"
TMP_DIR="/tmp/lovable-architect-install"

GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RESET='\033[0m'

echo ""
echo -e "${CYAN}🏗️  Lovable Architect V5 — Installation${RESET}"
echo ""

# ── 1. Créer le dossier canonique ─────────────────────────────
echo -n "📁 Création du dossier canonique... "
mkdir -p "$CANONICAL"
echo -e "${GREEN}✓${RESET}"

# ── 2. Télécharger ZIP via API GitHub ──────────────────────────
echo -n "📥 Téléchargement du dépôt... "
rm -rf "$TMP_DIR"
mkdir -p "$TMP_DIR"

HTTP_CODE=$(curl -sL -w "%{http_code}" \
    "https://api.github.com/repos/$REPO/zipball/main" \
    -o "$TMP_DIR/archive.zip")

if [ "$HTTP_CODE" != "200" ]; then
    echo -e "\033[0;31m✗ Erreur HTTP $HTTP_CODE${RESET}"
    echo "  Le dépôt est peut-être privé. Token requis :"
    echo "  TOKEN=ghp_xxx curl -sL ... | bash"
    exit 1
fi
echo -e "${GREEN}✓${RESET}"

# ── 3. Extraire ────────────────────────────────────────────────
echo -n "📦 Extraction... "
unzip -q "$TMP_DIR/archive.zip" -d "$TMP_DIR/extract"

# Trouver le dossier extrait (nom variable : Fad-cod-Skills-...)
EXTRACTED=$(find "$TMP_DIR/extract" -maxdepth 1 -type d -name "Fad-cod*" -o -name "lovable*" | head -1)

if [ -z "$EXTRACTED" ]; then
    EXTRACTED=$(ls "$TMP_DIR/extract" | head -1)
    EXTRACTED="$TMP_DIR/extract/$EXTRACTED"
fi

# Copier les fichiers du skill
cp "$EXTRACTED/SKILL.md" "$CANONICAL/"
cp -r "$EXTRACTED/references" "$CANONICAL/"
cp -r "$EXTRACTED/scripts" "$CANONICAL/"
[ -f "$EXTRACTED/README.md" ] && cp "$EXTRACTED/README.md" "$CANONICAL/"
echo -e "${GREEN}✓${RESET}"

# ── 4. Créer les symlinks pour agents non-universels ──────────
echo ""
echo -e "${CYAN}🔗 Détection des agents...${RESET}"

LINKS_CREATED=0

# Claude Code (ne lit PAS .agents/skills/)
if [ -d "$HOME/.claude" ]; then
    mkdir -p "$HOME/.claude/skills"
    ln -sfn "$CANONICAL" "$HOME/.claude/skills/$SKILL_NAME"
    echo -e "   ${YELLOW}→${RESET} Claude Code  : ~/.claude/skills/$SKILL_NAME"
    LINKS_CREATED=$((LINKS_CREATED + 1))
fi

# Windsurf
if [ -d "$HOME/.codeium" ] || [ -d "$HOME/.codeium/windsurf" ]; then
    mkdir -p "$HOME/.codeium/windsurf/skills"
    ln -sfn "$CANONICAL" "$HOME/.codeium/windsurf/skills/$SKILL_NAME"
    echo -e "   ${YELLOW}→${RESET} Windsurf     : ~/.codeium/windsurf/skills/$SKILL_NAME"
    LINKS_CREATED=$((LINKS_CREATED + 1))
fi

# Goose
if [ -d "$HOME/.config/goose" ]; then
    mkdir -p "$HOME/.config/goose/skills"
    ln -sfn "$CANONICAL" "$HOME/.config/goose/skills/$SKILL_NAME"
    echo -e "   ${YELLOW}→${RESET} Goose        : ~/.config/goose/skills/$SKILL_NAME"
    LINKS_CREATED=$((LINKS_CREATED + 1))
fi

# Roo Code
if [ -d "$HOME/.roo" ]; then
    mkdir -p "$HOME/.roo/skills"
    ln -sfn "$CANONICAL" "$HOME/.roo/skills/$SKILL_NAME"
    echo -e "   ${YELLOW}→${RESET} Roo Code     : ~/.roo/skills/$SKILL_NAME"
    LINKS_CREATED=$((LINKS_CREATED + 1))
fi

# Devin
if [ -d "$HOME/.config/devin" ]; then
    mkdir -p "$HOME/.config/devin/skills"
    ln -sfn "$CANONICAL" "$HOME/.config/devin/skills/$SKILL_NAME"
    echo -e "   ${YELLOW}→${RESET} Devin        : ~/.config/devin/skills/$SKILL_NAME"
    LINKS_CREATED=$((LINKS_CREATED + 1))
fi

if [ "$LINKS_CREATED" -eq 0 ]; then
    echo -e "   Aucun agent non-universel détecté (symlinks ignorés)"
fi

# ── 5. Nettoyer ────────────────────────────────────────────────
rm -rf "$TMP_DIR"

# ── 6. Résumé ──────────────────────────────────────────────────
echo ""
echo -e "${GREEN}✅ Installation terminée !${RESET}"
echo ""
echo -e "   Skill installé dans : ${CYAN}$CANONICAL${RESET}"
echo ""
echo -e "   Agents supportés nativement (sans symlink) :"
echo -e "   ${YELLOW}Codex CLI, Cursor, Gemini CLI, OpenCode, Cline, Copilot, Amp, Warp${RESET}"
echo ""
echo -e "   Prochaine étape : relance ton agent IA."
echo ""
