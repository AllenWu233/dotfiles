#!/bin/env bash
cd ~/repo/dotfiles || exit

find ./* | grep -v '\(images\|README.md\|backup.sh\|configlist.txt\|.git\|.gitignore\)' | xargs rm -rf

cp -r ~/scrips .
cp ~/.zshrc .
cp ~/.zshenv .
cp ~/.zimrc .
cp ~/.vimrc .
cp ~/.gvimrc .
mkdir newsboat
cp ~/.config/newsboat/config ./newsboat
mkdir w3m
cp ~/.w3m/config ./w3m
cp ~/.w3m/keymap ./w3m
mkdir firefox
cp -r ~/.config/firefox/chrome/ ./firefox

cat ./configlist.txt | while read rows; do
	cp -r ~/.config/$rows .
	rm -rf ./$rows/.git ./$rows.gitignore
done

pacman -Qqe >pkglist.txt

git add .
# git commit -m $(date -d @$(date +%s) "+%Y/%m/%d-%H:%M_UTC+08:00")
git commit -m "backup.sh"
git push -f origin main

~/repo/hledger/backup.sh
