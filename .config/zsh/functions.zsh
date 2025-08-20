# ~/.config/zsh/functions.zsh
# @author Allen Wu
# @since 2025

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
