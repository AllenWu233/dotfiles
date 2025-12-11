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
#
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
#
d() {
  local usage="Usage: d <compressed-file>
Auto-supported formats: tar.gz/tar.bz2/tar.xz, zip, 7z, rar"

  [[ $# -ne 1 ]] && { echo "$usage"; return 1 }
  local target=$1
  [[ ! -f $target ]] && { echo "Error: File '$target' does not exist or is not a file"; echo "$usage"; return 1 }

  # Helper: count top-level entries inside archive
  count_toplevel() {
    local list="$1"
    # strip trailing slashes, keep the first component, sort -u to get unique top-level names
    awk -F'/' '{print $1}' <<<"$list" | sort -u | wc -l
  }

  local dest=""           # final extraction directory
  local toplevel_count=0  # number of top-level items
  local list=""           # file list of archive

  if [[ $target =~ \.zip$ ]]; then
    list=$(unzip -lqq "$target" | awk '{print $NF}')
    toplevel_count=$(count_toplevel "$list")
    if (( toplevel_count == 1 )); then
      unzip "$target"
    else
      dest="${target:r}"   # remove .zip
      mkdir -p "$dest" && unzip "$target" -d "$dest"
    fi

  elif [[ $target =~ \.7z$ ]]; then
    list=$(7z l -ba "$target" | awk '{print $NF}')
    toplevel_count=$(count_toplevel "$list")
    if (( toplevel_count == 1 )); then
      7z x "$target"
    else
      dest="${target:r}"
      mkdir -p "$dest" && 7z x "$target" -o"$dest"
    fi

  elif [[ $target =~ \.tar\.(gz|bz2|xz)$ ]]; then
    list=$(tar tf "$target" | grep -v '/$')   # drop pure-dir entries
    toplevel_count=$(count_toplevel "$list")
    if (( toplevel_count == 1 )); then
      tar xf "$target"
    else
      dest="${target%%.*}"  # remove .tar.*
      mkdir -p "$dest" && tar xf "$target" -C "$dest"
    fi

  elif [[ $target =~ \.rar$ ]]; then
    list=$(unrar lb "$target")
    toplevel_count=$(count_toplevel "$list")
    if (( toplevel_count == 1 )); then
      unrar x "$target"
    else
      dest="${target:r}"
      mkdir -p "$dest" && unrar x "$target" "$dest/"
    fi

  else
    echo "Error: Unsupported format for '$target'"
    echo "$usage"
    return 1
  fi
}
