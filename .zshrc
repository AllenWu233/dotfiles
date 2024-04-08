# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# zmodload -F zsh/terminfo +p:terminfo
# # Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
# for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
# for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
# for key ('k') bindkey -M vicmd ${key} history-substring-search-up
# for key ('j') bindkey -M vicmd ${key} history-substring-search-down
# unset key
# }}} End configuration added by Zim install

# Created by newuser for 5.

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/autojump/autojump.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



# Add by Allen

# Locale
# export LANG=zh_CN.UTF-8
# export LANGUAGE=zh_CN:en_US
export LANGUAGE=en_US:en:C


# Aliases
alias TSc='sudo timeshift --create'
alias wine='env LANG=zh_CN.UTF-8 wine'
alias pkgclean='sudo pacman -Rns $(sudo pacman -Qqdt); yes | sudo pacman -Sc; yes | paru -Sc'
alias vim='nvim'
alias ls='lsd'
# alias you-get='you-get -o ~/Videos -c ~/cookies.txt'
alias you-get='you-get -o ~/Videos -c ~/.mozilla/firefox/g1t7i3hf.default-release/cookies.sqlite'
alias prac-rs='cd ~/rust_work/rust-by-practice && git pull; mdbook serve -p 8888 -n 127.0.0.1 zh-CN/ && firefox http://127.0.0.1:8888/'
alias imewlconverter='docker run --rm -it -v /dict:/dict imewlconverter'
alias ncmpcpp='mpd; ncmpcpp'
alias wine-forgame='WINEPREFIX=~/.local/share/wineprefixes/forgame/ wine'
alias farsee='curl -F "c=@-" "https://fars.ee/"'
alias se='sudoedit'
alias HL='hledger'
alias HLa='hledger add'
alias HLb='hledger bs'
alias HLi='hledger is'
alias HLp='hledger print -x'
alias tree='lsd --tree'
alias ranger='env LANGUAGE=zh_CN ranger'


# Environment variables
# export VIMCONFIG=~/.config/nvim
# export VIMDATA=~/.local/share/nvim
export PATH=$PATH:~/scrips/
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/software_and_tools/plum
export PATH=$PATH:~/.local/bin
export EDITOR=/usr/bin/nvim


# Functions
# fast commit and push
function push() {
    LOCAL_TIME=$(date -d @$(date +%s) "+%Y/%m/%d-%H:%M")
    WORK_PATH=$(pwd)
    cd "$1"  # receive argument if exists
    if [ "$(git log)" ]; then
        if [ "$(git status -s)" ]; then
            git add .
            git commit -m ${LOCAL_TIME}    
        fi
        while ! git push -u origin main
            do sleep 1
            done
        echo "Succeed!"
    else
        echo "Failed!"
    fi
    cd ${WORK_PATH}
}


# Plugins
# eval "$(atuin init zsh)"
