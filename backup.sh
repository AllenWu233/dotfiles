#!/bin/env bash
cd /home/Allen/repo/dotfiles || exit

find /home/Allen/repo/dotfiles/* | grep -v '\(images\|README.md\|backup.sh\|configlist.txt\|.git\|.gitignore\)' | xargs rm -rf

cp -r /home/Allen/scrips .
cp /home/Allen/.zshrc .
cp /home/Allen/.zshenv .
cp /home/Allen/.zimrc .
cp /home/Allen/.vimrc .
cp /home/Allen/.gvimrc .
mkdir newsboat
cp /home/Allen/.config/newsboat/config ./newsboat
mkdir w3m
cp /home/Allen/.w3m/config ./w3m
cp /home/Allen/.w3m/keymap ./w3m
mkdir firefox
cp -r /home/Allen/.config/firefox/chrome/ ./firefox

cat ./configlist.txt | while read rows; do
    cp -r /home/Allen/.config/$rows .
    # rm -rf ./$rows/.git ./$rows.gitignore
    echo "$rows"
done

pacman -Qqe >pkglist.txt

git add .
# git commit -m $(date -d @$(date +%s) "+%Y/%m/%d-%H:%M_UTC+08:00")
git commit -m "backup.sh"
git push -f origin main

/home/Allen/repo/hledger/backup.sh

date
printf "Backup finished!\n"
