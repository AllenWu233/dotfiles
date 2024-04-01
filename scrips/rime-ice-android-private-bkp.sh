#!/bin/bash
local_rime=~/.local/share/fcitx5/rime/
share_rime=/usr/share/rime-data/
repo=~/repo/rime-ice-android-private/
LOCAL_TIME=$(date -d @$(date +%s) "+%Y/%m/%d-%H:%M_UTC+08:00")

find ${local_rime} -maxdepth 1 ! -name "README.md" ! -name ".git" ! -name ".gitignore" ! -name "rime" ! -name "build" ! -name "*userdb" ! -name "user*" ! -name "installation*" -exec cp -r {} ${repo} \;
find ${share_rime} -maxdepth 1 ! -name "rime-data" ! -name "build" ! -name "rime_ice.dict.yaml" -exec cp -r {} ${repo} \;

cd ${repo}
git add .
git commit -m ${LOCAL_TIME}    
git push -u origin main

if [ $? -eq 0 ]; then
    echo "Succeed!"
else
    echo "Failed!"
fi
