#!/bin/bash
folder="${1:-.}"
output_dir="$folder/horizontal_images"

mkdir -p "$output_dir"
found=0

notify-send "🖼️ 筛选横向图片" "开始筛选"

shopt -s nullglob
for img in "$folder"/*.{jpg,jpeg,png,bmp,gif,webp,PNG,JPG,JPEG}; do
    [ -e "$img" ] || continue
    w=$(identify -format "%w" "$img" 2>/dev/null)
    h=$(identify -format "%h" "$img" 2>/dev/null)
    if [[ "$w" -gt "$h" ]]; then
        link_name="$output_dir/$(basename "$img")"
        # 如果软链接已存在，直接跳过
        if [ -L "$link_name" ]; then
            continue
        fi
        ln -s "$img" "$link_name"
        found=1
    fi
done

if [[ $found -eq 1 ]]; then
    dolphin "$output_dir"
    notify-send "🖼️ 筛选横向图片" "筛选完毕！已建立软链接。"
else
    notify-send "🖼️ 筛选横向图片" "未发现横向图片。"
fi
