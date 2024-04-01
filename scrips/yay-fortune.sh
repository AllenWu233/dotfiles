#!/bin/zsh
# 一个运行yay然后运行fortune | cowsay的脚本
if [ $# -eq 0 ]; then  # 如果没有给出参数
    yay && fortune | cowsay 
else  # 如果给出了参数
    yay "$@"  # 把参数传给yay
fi
