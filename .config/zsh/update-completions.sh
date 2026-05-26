#!/usr/bin/env bash

TARGET_DIR="${ZDOTDIR:-$HOME/.config/zsh}/completions"

mkdir -p "$TARGET_DIR"

if command -v uv &>/dev/null; then
    uv generate-shell-completion zsh >"$TARGET_DIR/_uv"
    echo "✓ Generated uv completions"
fi

if command -v atuin &>/dev/null; then
    atuin init zsh >"$TARGET_DIR/_atuin"
    echo "✓ Generated atuin initialization"
fi

echo "All static shell files updated successfully."
