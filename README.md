# Dotfiles setup

## Requirements
- yay
- stow
- i3
- dmenu
- rofi
- picom
- polybar
- feh
- alacritty
- zsh
- gcr-4
- flameshot
- cups
- avahi-daemon
- ufw


### If using nvidia drivers
Follow https://github.com/korvahannu/arch-nvidia-drivers-installation-guide (inner-sourced under nvidia for safe-keeping)

## Install print capabilities
Requires:
- cups
- avahi-daemon for local network discoverability

Given the use of systemd-resolve, follow the instructions on the Arch wiki:
- https://wiki.archlinux.org/title/avahi

Also disable MulticastDNS on systemd-resolved to avoid conflicts

## Setup SSH agent

With gcr-4:

`systemctl enable --now --user gcr-ssh-agent.socket`

`vim /etc/profile.d/ssh_auth_gcr.sh`

With content:
```
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh
```
