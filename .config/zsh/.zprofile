export QT_QPA_PLATFORMTHEME="qt6ct"


export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

if [[ "$XDG_SESSION_TYPE" == "x11" ]]; then
    export GTK_IM_MODULE=fcitx
    export SDL_IM_MODULE=fcitx
    export GLFW_IM_MODULE=ibus
fi

# if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
# fi
