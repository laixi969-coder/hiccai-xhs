#!/usr/bin/env bash
set -e

SKILL_NAME="hiccai-xhs"
REPO="https://github.com/laixi969-coder/hiccai-xhs.git"
INSTALL_DIR="$HOME/.claude/skills/$SKILL_NAME"

echo "→ 安装 $SKILL_NAME 到 $INSTALL_DIR"

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

git clone --depth 1 "$REPO" "$TMP" --quiet

rm -rf "$INSTALL_DIR"
cp -r "$TMP/hiccai-xhs" "$INSTALL_DIR"

echo "✓ 安装完成。重启 Claude Code 后输入 /hiccai-xhs 即可使用。"
