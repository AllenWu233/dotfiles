# ~/.config/zsh/aliases.zsh
# @author: Allen Wu
# @date: 2025

alias cd='z'
alias wine='env LANG=zh_CN.UTF-8 LANG=zh_CN.UTF-8 wine'
alias vim='nvim'
alias lvim='NVIM_APPNAME=lazyvim nvim'
alias nc='ncmpcpp'
alias farsee='curl -F "c=@-" "https://fars.ee/"'
alias se='sudoedit'
alias yazi='env LANG=zh_CN.UTF-8 LANGUAGE=zh_CN yazi'
alias rm="rm -i"
alias get-ip="ip -4 addr | rg -i ppp0 -i | rg -i inet"
alias pac="sudo pacman -Syu"
alias cmd-wrapped='cmd-wrapped -s atuin'
alias mf='musicfox'
alias nb="newsboat -r"
alias hibernate="systemctl hibernate"
alias yutto="yutto --config ~/private/.config/yutto/yutto.toml"
alias chx="sudo chmod +x"
alias xcopy="xsel -bi"
# alias xcopy="tr -d '\n' | xsel -bi"
alias xpaste="xsel -bo"
alias et="emacsclient -t -a '' 2>/dev/null" # TUI
alias ec="emacsclient -c -a '' 2>/dev/null" # GUI

# lsd
alias ls='lsd'
alias tree='lsd --tree'
alias tree1='lsd --tree --depth 1'
alias tree2='lsd --tree --depth 2'
alias tree3='lsd --tree --depth 3'

# bat
# alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
# alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# fzf
# alias fpcache="pacman -Qq | fzf --preview 'ls /var/cache/pacman/pkg/{}-[0-9]*.pkg.tar.zst'"
# alias fpact="pacman -Qq | fzf --preview 'pactree -d1 {}'"
# alias fpactr="pacman -Qq | fzf --preview 'pactree -rd1 {}'"

alias fpac="pacman -Qq | fzf \
    --ansi \
    --header='[Ctrl-d] Dep Tree | [Ctrl-r] Rev Dep | [Ctrl-s] Cache Size' \
    --preview-label='[ Dependency Tree ]' \
    --preview 'pactree -c -d1 {}' \
    --bind 'ctrl-d:change-preview-label([ Dependency Tree ])+change-preview(pactree -c -d1 {})' \
    --bind 'ctrl-r:change-preview-label([ Reverse Dependency ])+change-preview(pactree -cr -d1 {})' \
    --bind 'ctrl-s:change-preview-label([ Cache Size ])+change-preview(lsd --color=always -lh /var/cache/pacman/pkg/{}* 2>/dev/null)' \
    --preview-window='wrap'"

# Monitor logs and open with $EDITOR on ENTER
alias flog="fd -t f -e log . /var/log 2>/dev/null | fzf \
  --ansi \
  --header='[ENTER] Edit Log | [Ctrl-r] Refresh' \
  --preview-label='[ Error Monitor ]' \
  --preview 'tail -f -n 30 {} | rg --heading --line-number --color=always -i \"error|warn|fail|critical|\$\"' \
  --bind 'ctrl-r:reload(fd -t f -e log . /var/log)' \
  --bind 'enter:execute(\${EDITOR:-vim} {})' \
  --preview-window='follow:wrap'"

# Monitor global systemd services and view system journal logs (requires sudo)
alias fsyslog="sudo -v; sudo systemctl list-units --type=service --no-legend | rg -v "●" | awk '{print \$1}' |  fzf \
  --ansi \
  --header='[ENTER] View Full Journal | [Ctrl-r] Refresh Units' \
  --preview-label='[ Real-time System-wide Journal ]' \
  --preview 'sudo journalctl -u {} -n 50 --no-pager' \
  --bind 'ctrl-r:reload(sudo systemctl list-units --type=service --no-legend | awk \"{print \$1}\")' \
  --bind 'enter:execute(sudo journalctl -u {} | less +G)' \
  --preview-window='follow:wrap'"


alias update-fonts="fc-cache -fv"
alias ffont="fc-list | fzf -d ':' --with-nth=2.. --preview 'echo {}' --preview-window=bottom:1:wrap"

# config
alias czsh='$EDITOR ~/.config/zsh/ ~/.zshenv'
# alias cniri='$EDITOR ~/.config/niri/config.kdl'
# alias csway='$EDITOR ~/.config/sway'
alias ci3='$EDITOR ~/.config/i3'

# Proxy
alias proxy-clash='https_proxy=http://127.0.0.1:7897 http_proxy=http://127.0.0.1:7897 all_proxy=socks5://127.0.0.1:7897'
alias proxy-v2ray='https_proxy=http://127.0.0.1:20172 http_proxy=http://127.0.0.1:20172 all_proxy=socks5://127.0.0.1:20172'

# SSH
alias ssh-termux='ssh -p 8022 root@termux'
