typeset -U path
path=(~/bin ~/scrips ~/.local/bin ~/.cargo/bin ~/software_and_tools/plum $path[@])

export EDITOR=/usr/bin/nvim
export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

. "$HOME/.cargo/env"
