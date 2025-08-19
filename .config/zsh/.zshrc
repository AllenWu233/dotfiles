# @author: Allen Wu
# @since: 2025.08
# My personal zsh configuration


# Settings ##################
#
# Auto completion
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select # arrow-key driven
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # case insensitive


# prompt theme
autoload -Uz promptinit
promptinit
# prompt suse

# Custom prompt
PROMPT='[%F{green}%n%f@%F{magenta}%m%f %F{yellow}%B%~%b%f][%F{cyan}%*%f][%F{yellow}%?%f]
$ '
# RPROMPT='[%F{yellow}%?%f]'


# Vim-like keybindings
bindkey -v
export KEYTIMEOUT=5 # delay 0.05s

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



# Plugins #####################
#
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh



# Aliases ###################
#
alias cd='z'
alias wine='env LANG=zh_CN.UTF-8 LANG=zh_CN.UTF-8 wine'
# alias wine-game='WINEPREFIX=~/.local/share/wineprefixes/game/ wine'
alias vim='nvim'
alias ls='lsd'
# alias yg='you-get --playlist -o ~/Videos'
# alias ygc='you-get --playlist -o ~/Videos -c ~/.librewolf/wqbtt3vg.default-release/cookies.sqlite'
alias nc='ncmpcpp'
alias farsee='curl -F "c=@-" "https://fars.ee/"'
alias se='sudoedit'

alias tree='lsd --tree'
alias tree1='lsd --tree --depth 1'
alias tree2='lsd --tree --depth 2'

alias yazi='env LANG=zh_CN.UTF-8 LANGUAGE=zh_CN yazi'
# alias rm="echo This is not the command you are looking for. Use \'trash\' instead.; false"
alias rm="rm -i"
alias get-ip="ip -4 addr | rg -i ppp0 -i | rg -i inet"
alias pac="sudo pacman -Syu"
# alias ddg='w3m duckduckgo.com/lite'
# alias abs='w3m https://linux.die.net/abs-guide/'
alias cmd-wrapped='cmd-wrapped -s atuin'
alias mf='musicfox'
alias nb="newsboat -r"
alias rw="random-wallpaper.sh"
alias rofi="rofi -dpi 1"
alias py="pdm run python"

# bat
# alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
# alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# fzf
alias fpcache="pacman -Qq | fzf --preview 'ls /var/cache/pacman/pkg/{}-[0-9]*.pkg.tar.zst'"
alias fpact="pacman -Qq | fzf --preview 'pactree -d1 {}'"
alias fpactr="pacman -Qq | fzf --preview 'pactree -rd1 {}'"
alias ffont="fc-list | fzf"

# config
alias i3c='nvim ~/.config/i3/'

# Suffix aliases
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'

# Clash-verge
alias proxy='https_proxy=http://127.0.0.1:7897 http_proxy=http://127.0.0.1:7897 all_proxy=socks5://127.0.0.1:7897'


# Set terminal language to English
# This is not system locale. Refer to '~/.xprofile'
export LANG=en_US.UTF-8
export LANGUAGE=en_US



# Tools ##################
#
export ATUIN_NOBIND="true"
eval "$(atuin init zsh)"
bindkey '^r' atuin-search
# bind to the up key, which depends on terminal mode
# bindkey '^[[A' atuin-up-search
# bindkey '^[OA' atuin-up-search

eval "$(zoxide init zsh)"




# Functions #################
# 
# Change the current working directory when exiting Yazi.
# Use y instead of yazi to start, and press q to quit, 
# you'll see the CWD changed. 
# Sometimes, you don't want to change, press Q to quit.
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	\rm -f -- "$tmp"
}

# Create a Zellij instance with a useful session name
# either uses the current directory name, 
# or a parameter as the session_name variable. 
# It then tries to join an existing zellij session with that name, or creates a new one
function za() {
  local session_name=${1:-${PWD:t}}
  zellij attach "$session_name" || zellij -s "$session_name"
}
