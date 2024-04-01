#!/bin/zsh
xsel -ob > ~/update-cookies-tmp.txt
rm ~/.cookies.txt
if [ "$(curl -b update-cookies-tmp.txt --cookie-jar ~/.cookies.txt 'https://bilibili.com')" ]; then
    echo "Succeeded to update BiliBili cookies!"
else
    echo "Faided to update BiliBili cookies!"
fi
rm ~/update-cookies-tmp.txt

