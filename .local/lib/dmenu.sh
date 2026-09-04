#!/usr/bin/env bash
# @title: libdmenu
# @desc: Wrapper library for dmenu-like UI selectors
# @deps: fuzzel / rofi
# @date: 2026-08-08
# @auth: Allen

if [ -z "$DMENU_BACKEND" ]; then
    if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
        export DMENU_BACKEND="fuzzel"
    else
        export DMENU_BACKEND="rofi"
    fi
fi

run_menu() {
    local prompt="${1:-Selection:}"
    local mesg="$2"
    local backend="${DMENU_BACKEND:-rofi}"

    case "$backend" in
    fuzzel)
        local args=(fuzzel --dmenu --prompt="$prompt ")
        [ -n "$mesg" ] && args+=(--mesg="$mesg")
        "${args[@]}"
        ;;
    rofi | *)
        local args=(rofi -dmenu -i -p "$prompt")
        [ -n "$mesg" ] && args+=(-mesg "$mesg")
        "${args[@]}"
        ;;
    esac
}
