#!/usr/bin/env bash

# Dependencies for dotfiles
dependencies=(
  pavucontrol bluez bluez-libs bluez-tools bluez-utils

  swww waypaper ghostty stow fastfetch zsh zsh-syntax-highlighting
  oh-my-zsh-git waybar

  thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman

  # flatery-icon- theme-git xcursor-breeze dracula-gtk-theme-git

  zen-browser-bin

  ttf-jetbrains-mono-nerd  ttf-font-awesome
)

mypackages=(
  # steam mesa mesa-demos lib32-mesa lib32-libvdpau
  # dmidecode nbfc-git i8kutils
  # wine winetricks lib32-gnutls wps-office ttf-wps-fonts
  # prismlauncher

  neovim obsidian
  # diff-so-fancy 
  filezilla git 
  # gotop 
  jdk-openjdk 
  man man-pages-pt_br
  github-cli keepassxc brightnessctl paru fzf lazygit superfile
  vkd3d lib32-vkd3d
  rsync shfmt eza transmission-gtk zip

  makepkg-optimize

  openssh unrar unzip wget

  # laptop-mode-tools acpi
  # woeusb-ng
)

devops=(
  docker
)
