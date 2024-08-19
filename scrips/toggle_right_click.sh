#!/bin/bash

# 定义一个状态变量
STATE_FILE="/tmp/right_click_state"

# 检查状态文件是否存在
if [ -f "$STATE_FILE" ]; then
    # 如果存在，表示正在按下，执行松开操作
    xdotool mouseup 3
    rm "$STATE_FILE" # 删除状态文件
else
    # 如果不存在，表示未按下，执行按下操作
    xdotool mousedown 3
    touch "$STATE_FILE" # 创建状态文件

    # 持续按下右键，直到状态文件被删除
    while [ -f "$STATE_FILE" ]; do
        sleep 0.1 # 控制循环频率
    done
fi
