# ~/.zshenv
# @author Allen Wu
# @since 2025
# NOTE: .zshenv needs to live at ~/.zshenv, not in $ZDOTDIR!

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}
export HISTFILE="$ZDOTDIR/.zsh_history"
export EDITOR="nvim"
export DOTFILES="$HOME/dotfiles"
export DCONF="$HOME/dotfiles/.config"

# Clash-verge
export https_proxy=http://127.0.0.1:7897 http_proxy=http://127.0.0.1:7897 all_proxy=socks5://127.0.0.1:7897


typeset -U path PATH
path=(
    ~/.local/bin
    ~/.cargo/env
    $path
)
export PATH
