#!/usr/bin/env bash

# Dependencies for dotfiles
dependencies=(
  pavucontrol bluez bluez-libs bluez-tools bluez-utils

  feh picom ghostty stow fastfetch zsh zsh-syntax-highlighting
  oh-my-zsh-git
  maim ffmpeg imagemagick slop
  waybar

  thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman

  flatery-icon-theme-git xcursor-breeze dracula-gtk-theme-git

  zen-browser-bin zapzap

  ttf-jetbrains-mono-nerd  ttf-font-awesome
)

mypackages=(
  steam mesa mesa-demos lib32-mesa lib32-libvdpau
  dmidecode nbfc-git i8kutils
  wine winetricks lib32-gnutls wps-office ttf-wps-fonts
  prismlauncher

  neovim obsidian
  discord diff-so-fancy filezilla git gotop jdk-openjdk jq man man-pages-pt_br
  github-cli keepassxc brightnessctl paru fzf lazygit superfile
  vkd3d lib32-vkd3d
  rsync shfmt eza transmission-gtk zip

  # optipng bfg

  makepkg-optimize
  # python python-pip python-pipenv-to-requirements python-pipx python-pip-api python-pipreqs python-pipenv python-pip-shims

  # android-tools hfsprogs gvfs gvfs-mtp btrfs-progs dosfstools f2fs-tools e2fsprogs jfsutils nilfs-utils ntfs-3g reiserfsprogs udftools xfsprogs

  # qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat libguestfs

  openssh unrar unzip wget

  # selinux-python

  # python-ruamel-yaml
  # laptop-mode-tools acpi
  # woeusb-ng
)

devops=(
  docker
)

# builder=(
#   ncurses ncurses5-compat-libs lib32-ncurses5-compat-libs aosp-devel lineageos-devel curl
#   bc rsync lib32-ncurses lib32-gcc-libs schedtool fontconfig ttf-droid
#   android-tools android-udev base-devel wget multilib-devel cmake svn clang lzip patchelf inetutils ccache
#   gcc gcc-multilib gcc-libs-multilib binutils libtool-multilib lib32-libusb
#   lib32-readline lib32-glibc lib32-zlib python2 perl git gnupg flex bison gperf zip unzip sdl squashfs-tools
#   libpng zlib libusb libusb-compat readline inetutils android-sdk-platform-tools android-udev esd-oss pngcrush
#   repo tcp_wrappers perl-switch wxgtk2 libxslt xml2 termcap jdk8-openjdk llvm p7zip
# )
