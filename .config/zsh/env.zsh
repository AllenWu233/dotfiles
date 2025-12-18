# ~/.zshenv
# @author Allen Wu
# @since 2025

export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export HISTFILE="$ZDOTDIR/.zsh_history"
export EDITOR="nvim"
export DOTFILES="$HOME/dotfiles"
export DCONF="$HOME/dotfiles/.config"

# VPN
#
# Clash-verge
# export https_proxy=http://127.0.0.1:7897 http_proxy=http://127.0.0.1:7897 all_proxy=socks5://127.0.0.1:7897
#
# hongmo.speed
# export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890


typeset -U path PATH
path=(
    ~/.local/bin
    $path
)
export PATH

. "$HOME/.cargo/env"
