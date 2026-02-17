# ~/.config/zsh/.zshrc
# @author Allen Wu
# @since 2025.08
# My personal zsh configuration

# Settings ##################
#
# Auto completion
autoload -Uz compinit
# compinit
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump # move cache out of home
zstyle ':completion:*' menu select # arrow-key driven
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # case insensitive


# prompt theme
# autoload -Uz promptinit
# promptinit
# prompt suse

# Custom prompt
PROMPT='[%F{green}%n%f@%F{magenta}%m%f %F{yellow}%B%~%b%f][%F{cyan}%*%f][%F{yellow}%?%f]
$ '
# RPROMPT='[%F{yellow}%?%f]'


# Keybindings #########################
# bindkey -v
bindkey -e
# export KEYTIMEOUT=5 # delay 0.05s

bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history


# History searching
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS


# Edit command lines in editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M viins '^v' edit-command-line
bindkey -M emacs '^v' edit-command-line


# Set terminal language to English
# This is not system locale. Refer to '~/.xprofile'
export LANG=en_US.UTF-8
export LANGUAGE=en_US



# Source #################
#
# Custom files
[ -f "$ZDOTDIR/aliases.zsh" ] && . "$ZDOTDIR/aliases.zsh"
[ -f "$ZDOTDIR/func.zsh" ] && . "$ZDOTDIR/func.zsh"

# Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh



# Tools ##################
#
export ATUIN_NOBIND="true"
eval "$(atuin init zsh)"
bindkey '^r' atuin-search

eval "$(zoxide init zsh)"
