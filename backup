#!/bin/bash
set -e

cd "$HOME/dotfiles" || {
    echo "Failed to cd into $HOME/dotfiles"
    exit 1
}

pacman -Qqe >pkglist.txt

git add --all

if git diff --cached --quiet; then
    echo "No changes to commit."
    exit 0
fi

git commit -m "backup.sh: $(date '+%Y-%m-%d %H:%M:%S')"
git push
