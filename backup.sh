#!/bin/env bash
cd ~/repo/dotfiles || exit

find ./* | grep -v '\(images\|README.md\|backup.sh\|configlist.txt\|.git\|.gitignore\)' | xargs rm -rf

cp -r ~/scrips .
cp -r ~/.w3m .
rm ./.w3m/cookie
cp ~/.zshrc .
cp ~/.zshenv .
cp ~/.zimrc .
cp ~/.vimrc .
cp ~/.gvimrc .

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
