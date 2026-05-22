#!/usr/bin/env bash
set -e

SKILL_NAME="hiccai-xhs"
REPO="git@github.com:laixi969-coder/hiccai-xhs.git"
REPO_HTTPS="https://github.com/laixi969-coder/hiccai-xhs.git"
INSTALL_DIR="$HOME/.claude/skills/$SKILL_NAME"

echo "→ 安装 $SKILL_NAME 到 $INSTALL_DIR"

TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT

# 优先 SSH，失败则 HTTPS
git clone --depth 1 "$REPO" "$TMP" --quiet 2>/dev/null || \
git clone --depth 1 "$REPO_HTTPS" "$TMP" --quiet

rm -rf "$INSTALL_DIR"
cp -r "$TMP/hiccai-xhs" "$INSTALL_DIR"

echo "✓ 安装完成。重启 Claude Code 后输入 /hiccai-xhs 即可使用。"
