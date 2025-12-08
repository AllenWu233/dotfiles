# Allen's personal dotfiles

## Overview

My Arch Linux dotfiles.

There is a list of the packages I have installed: ![pkglist.txt](pkglist.txt)

![fastfetch](screenshots/sway1.png)

![background](screenshots/sway2.png)

## Usage

```Shell
# Clone this repository on codeberg
git clone https://codeberg.org/AllenWu233/dotfiles ~/dotfiles
# Or on github
git clone https://github.com/AllenWu233/dotfiles ~/dotfiles

# Create directories if needed to avoid dumping everything in dotfiles directory
mkdir -p "${HOME}/.local/share"
mkdir -p "${HOME}/.cache"

# Create symlinks with GNU Stow
cd ~/dotfiles
# Recover dotfiles repo with local files if exist
stow -t ~ . --adopt -R
# Or
#
# Dry Run
# stow -t ~ . --override='*' -v -n
#
# Warning: This command will recover local file with dotfiles
# stow -t ~ . --override='*' -v
```

## Introduction

- Window Manager (WM): [Sway](https://swaywm.org/), [Niri](https://github.com/YaLTeR/niri)
- /usr/bin/sh: [bash](https://www.gnu.org/software/bash/)
- Login Shell: [zsh](https://www.zsh.org/)
- Terminal Multiplexer: [zellij](https://github.com/zellij-org/zellij)
- Terminal Emulator: [foot](https://codeberg.org/dnkl/foot)
- Status Bar: swaybar (with [i3blocks](https://github.com/vivien/i3blocks))
- Output Management: [wlr-randr](https://github.com/emersion/wlr-randr)
- Application Launcher: [fuzzel](https://codeberg.org/dnkl/fuzzel)
- Fuzzy Finder: [fzf](https://github.com/junegunn/fzf)
- Notification Daemon: [mako](https://github.com/emersion/mako)
- Editor: [Neovim](https://neovim.io/)
- Email: neomutt, Thunderbird
- File Manager: yazi, thunar
- Music Player: mpd + rmpc / ncmpcpp
- Video Player: mpv
- Image Viewer: imv
- E-book Reader / PDF Viewer: zathura (with zathura-pdf-mupdf)
- RSS Reader: newsboat, newsflash
- Calendar/Todo: taskwarrior-tui
- Virtualization: libvirt + qemu-full + virt-manager
- Web Browser: Firefox
- Downloader: aria2, qBittorrent Enhanced
- File Sync/Share: rsync, ssh, KDE Connect
- Snapshot/Backup: btrbk, grub-btrfs
- AUR Helper: paru
- System Monitors: btop / nvtop / htop
- Dotfiles Manager: stow + git
