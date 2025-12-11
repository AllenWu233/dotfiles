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



# Quick compress/decompress for common formats (zip/7z/tar/rar)
function c() {
  # Define usage message
  local usage="Usage: c <format> <file/directory>
Supported formats:
  c tar <target> -> Compress to *.tar.gz (gzip)
  c zip <target> -> Compress to *.zip
  c 7z  <target> -> Compress to *.7z
  c rar <target> -> Compress to *.rar"

  # Validate input
  local cmd=$1 target=$2
  [[ $# -ne 2 ]] && { echo "$usage"; return 1; }
  [[ ! -e $target ]] && { echo "Error: Target '$target' does not exist"; echo "$usage"; return 1; }

  # Compress logic
  case $cmd in
    tar)    tar zcf "${target%/}.tar.gz" "$target" ;;
    zip)    zip -r "${target%/}.zip" "$target" ;;
    7z)     7z a "${target%/}.7z" "$target" ;;
    rar)    rar a "${target%/}.rar" "$target" ;;
    *)      echo "Error: Unsupported format '$cmd'"; echo "$usage"; return 1 ;;
  esac
}

function d() {
  local usage="Usage: d <compressed-file>
Auto-supported formats: tar.gz/tar.bz2/tar.xz, zip, 7z, rar"

  [[ $# -ne 1 ]] && { echo "$usage"; return 1; }
  local target=$1
  [[ ! -f $target ]] && { echo "Error: File '$target' does not exist or is not a file"; echo "$usage"; return 1; }

  # Auto detect format by file extension/content
  local dest="${target%.*}"

  if [[ $target =~ \.zip$ ]]; then
    unzip "$target" -d "$dest"
  elif [[ $target =~ \.7z$ ]]; then
    7z x "$target" -o"$dest"
  elif [[ $target =~ \.tar\.(gz|bz2|xz)$ ]]; then
    dest="${target%%.*}"
    tar xf "$target"
  elif [[ $target =~ \.rar$ ]]; then
    unrar x "$target" "$dest/"
  else
    echo "Error: Unsupported format for '$target'"; echo "$usage"; return 1
  fi
}
