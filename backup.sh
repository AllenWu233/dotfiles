#!/bin/env bash
cd ~/repo/dotfiles

find ./* | grep -v '\(images\|README.md\|backup.sh\|configlist.txt\|.git\|.gitignore\)' | xargs rm -rf
cat ./configlist.txt | while read rows
do
    cp -r ~/.config/$rows .
    rm -rf ./$rows/.git ./$rows.gitignore
done

pacman -Qqe > pkglist.txt

git add .
git commit -m $(date -d @$(date +%s) "+%Y/%m/%d-%H:%M_UTC+08:00")
git push -f origin main
