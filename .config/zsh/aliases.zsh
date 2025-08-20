# ~/.config/zsh/aliases.zsh
# @author Allen Wu
# @since 2025

alias cd='z'
alias wine='env LANG=zh_CN.UTF-8 LANG=zh_CN.UTF-8 wine'
# alias wine-game='WINEPREFIX=~/.local/share/wineprefixes/game/ wine'
alias vim='nvim'
# alias yg='you-get --playlist -o ~/Videos'
# alias ygc='you-get --playlist -o ~/Videos -c ~/.librewolf/wqbtt3vg.default-release/cookies.sqlite'
alias nc='ncmpcpp'
alias farsee='curl -F "c=@-" "https://fars.ee/"'
alias se='sudoedit'

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
# alias py="pdm run python"

# lsd
alias ls='lsd'
alias tree='lsd --tree'
alias tree1='lsd --tree --depth 1'
alias tree2='lsd --tree --depth 2'

# bat
# alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
# alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# fzf
alias fpcache="pacman -Qq | fzf --preview 'ls /var/cache/pacman/pkg/{}-[0-9]*.pkg.tar.zst'"
alias fpact="pacman -Qq | fzf --preview 'pactree -d1 {}'"
alias fpactr="pacman -Qq | fzf --preview 'pactree -rd1 {}'"
alias ffont="fc-list | fzf"

# config
alias ci3='nvim ~/.config/i3/'
alias czsh='nvim ~/.config/zsh/ ~/.zshenv'

# Clash-verge
alias proxy='https_proxy=http://127.0.0.1:7897 http_proxy=http://127.0.0.1:7897 all_proxy=socks5://127.0.0.1:7897'
