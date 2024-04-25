# Path
typeset -U path
path=(~/bin ~/scrips ~/.local/bin ~/.cargo/bin ~/software_and_tools/plum $path[@])

# Locale
export LANG=en_US.UTF-8
export LANGUAGE=en_US:en:C:zh_CN

export EDITOR=/usr/bin/nvim
export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

. "$HOME/.cargo/env"
