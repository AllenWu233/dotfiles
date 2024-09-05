#!/bin/env bash

cd /home/Allen/repo/dotfiles || exit

files_to_exclude=(images README.md backup.sh configlist.txt .git .gitignore)

# 使用数组中的项目来排除文件夹
for exclude_item in "${files_to_exclude[@]}"; do
    exclude_args+=" -e $exclude_item"
done

find /home/Allen/repo/dotfiles/* -type d |
    grep -vE "$exclude_args" |
    # xargs rm -rf

    # 复制指定的文件
    files_to_copy=(scrips .zshrc .zshenv .zimrc .vimrc .gvimrc)
for file in "${files_to_copy[@]}"; do
    cp "/home/Allen/$file" .
done

# 复制newsboat配置
mkdir -p newsboat
cp /home/Allen/.config/newsboat/config ./newsboat

# 复制w3m配置
mkdir -p w3m
cp /home/Allen/.w3m/config ./w3m
cp /home/Allen/.w3m/keymap ./w3m

# 复制firefox配置
mkdir -p firefox
cp -r /home/Allen/.config/firefox/chrome/ ./firefox

# 复制configlist.txt中列出的配置文件夹
while IFS= read -r row; do
    cp -r "/home/Allen/.config/$row" .
    rm -rf "./$row/.git" "./$row/.gitignore"
done <./configlist.txt

# 生成已安装软件包列表
pacman -Qqe >pkglist.txt

# 提交变更到Git仓库
git add .
git commit -m "backup.sh"
git push -f origin main

# 运行额外的备份脚本
/home/Allen/repo/hledger/backup.sh

# 输出备份完成的信息
date
printf "Backup finished!\n"

#!/bin/env bash
# cd /home/Allen/repo/dotfiles || exit
#
# find /home/Allen/repo/dotfiles/* | grep -v '\(images\|README.md\|backup.sh\|configlist.txt\|.git\|.gitignore\)' | xargs rm -rf
#
# cp -r /home/Allen/scrips .
# cp /home/Allen/.zshrc .
# cp /home/Allen/.zshenv .
# cp /home/Allen/.zimrc .
# cp /home/Allen/.vimrc .
# cp /home/Allen/.gvimrc .
#
# mkdir newsboat
# cp /home/Allen/.config/newsboat/config ./newsboat
#
# mkdir w3m
# cp /home/Allen/.w3m/config ./w3m
# cp /home/Allen/.w3m/keymap ./w3m
#
# mkdir firefox
# cp -r /home/Allen/.config/firefox/chrome/ ./firefox
#
# while IFS= read -r row; do
#     cp -r "/home/Allen/.config/$row" .
#     rm -rf "./$row/.git" "./$row/.gitignore"
# done <./configlist.txt
#
# pacman -Qqe >pkglist.txt
#
# git add .
# # git commit -m $(date -d @$(date +%s) "+%Y/%m/%d-%H:%M_UTC+08:00")
# git commit -m "backup.sh"
# git push -f origin main
#
# /home/Allen/repo/hledger/backup.sh
#
# date
# printf "Backup finished!\n"
