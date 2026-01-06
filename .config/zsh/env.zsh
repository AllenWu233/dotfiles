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



typeset -U path PATH
path=(
    $HOME/.local/bin
    $HOME/claude-model/bin
    $path
)
export PATH

. "$HOME/.cargo/env"
