#
# .zshenv - Zsh environment file, loaded always.
#

# NOTE: .zshenv needs to live at ~/.zshenv, not in $ZDOTDIR!


# Set ZDOTDIR if you want to re-home Zsh.
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}


export HISTFILE="$ZDOTDIR/.zsh_history"

# Clash-verge
# export https_proxy=http://127.0.0.1:7897 http_proxy=http://127.0.0.1:7897 all_proxy=socks5://127.0.0.1:7897

# Set terminal language to English
# This is not system locale. Refer to '~/.xprofile'
export LANG=en_US.UTF-8
export LANGUAGE=en_US

export EDITOR='nvim'



typeset -U path PATH
path=(
    ~/.local/bin
    $path
)
export PATH
