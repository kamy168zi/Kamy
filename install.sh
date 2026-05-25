#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-claude}"
CUSTOM_SKILL_ROOT="${2:-}"
ZIP_URL="https://raw.githubusercontent.com/kamy168zi/Kamy/main/releases/gongzhonghao-typeset-skill-20260525.zip"
ZIP_PATH="/tmp/gongzhonghao-typeset-skill.zip"

if [ -n "$CUSTOM_SKILL_ROOT" ]; then
  SKILL_ROOT="$CUSTOM_SKILL_ROOT"
elif [ "$TARGET" = "openclaw" ]; then
  SKILL_ROOT="$HOME/.openclaw/skills"
else
  SKILL_ROOT="$HOME/.claude/skills"
fi

mkdir -p "$SKILL_ROOT"

echo "Downloading gongzhonghao-typeset..."
curl -L "$ZIP_URL" -o "$ZIP_PATH"

echo "Installing to $SKILL_ROOT..."
unzip -o "$ZIP_PATH" -d "$SKILL_ROOT"

echo
echo "Install complete:"
echo "$SKILL_ROOT/gongzhonghao-typeset"
echo
echo "Restart Claude / Codex / OpenClaw, then ask it to use gongzhonghao-typeset."
