# ~/.config/zsh/.zshenv
# @author Allen Wu
# @since 2025

# XDG Base Directory
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}


export HISTFILE="$ZDOTDIR/.zsh_history"
export EDITOR="nvim"
export PATH="$HOME/.kimi-code/bin:$PATH"

# Qt Theme
# export QT_QPA_PLATFORMTHEME="qt6ct"


# Fcitx 5
# export QT_IM_MODULE=fcitx
# if [[ "$XDG_SESSION_TYPE" != "wayland" ]]; then
#     export GTK_IM_MODULE=fcitx
#     export XMODIFIERS=@im=fcitx
#     export SDL_IM_MODULE=fcitx
#     export GLFW_IM_MODULE=ibus
# else
#     export QT_IM_MODULES=wayland;fcitx
# fi



# Path Config
typeset -U path PATH
path=(
    $HOME/.local/bin
    $HOME/.cargo/bin
    $HOME/.config/emacs/bin # doom
    $HOME/claude-model/bin
    $path
)
export PATH

