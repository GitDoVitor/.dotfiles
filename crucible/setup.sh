#!/usr/bin/env bash

print_logo() {
    cat << "EOF"
      _                                    _
  ___| |__     ___  ___    __ _ _   _ _ __(_)
 / _ \ '_ \   / _ \/ __|  / _` | | | | '__| |
|  __/ | | | | (_) \__ \ | (_| | |_| | |  | |   Arch Linux System Crafting Tool
 \___|_| |_|  \___/|___/  \__, |\__,_|_|  |_|   by: vitor
                          |___/
EOF
}

clear
print_logo

set -e

source $HOME/.Xconfigs
source $HOME/.dotfiles/crucible/utils.sh

HOST=$(cat /etc/hostname)

if [ ! -f "$HOME/.dotfiles/crucible/packages.conf" ]; then
  echo -e "\n${RED}Erro: ${GRE}packages.conf não encontrado! ${END}\n"
  exit 1
fi

source $HOME/.dotfiles/crucible/packages.conf

if [[ ! -d $HOME/.dotfiles ]]; then
  echo -e "\n${RED}For you to use this dotfiles, it must be located in your HOME, and hidden, the correct path is: ~/.dotfiles ${END}\n"
  exit
fi

if [[ $USER == "vitor" ]]; then
  echo -e "\n${MAG}Você deseja reconfigurar suas ${CYA}configurações pessoais? ${GRE}(y/n) ${RED}[enter=no] ${END}\n"
  read answerMyConfigs

  echo -e "\n${MAG}Você deseja instalar o driver da ${BOL_CYA}nvidia? ${GRE}(y/n) ${RED}[enter=no] ${END}\n"
  read answerNvidia
fi

echo -e "\n${MAG}Iniciando a configuração inicial do sistema... ${END}\n"

echo -e "\n${MAG}Adicionando o repositório do ${RED}chaotic ${MAG}ao ${CYA}pacman ${MAG}e ${CYA}paru${MAG}... ${END}\n"

sudo sed -i '/chaotic/d' /etc/pacman.conf
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' --noconfirm
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' --noconfirm
sudo pacman -Sy --noconfirm && paru -Su --noconfirm
echo "[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf

sudo pacman -Syyu --noconfirm
sudo pacman-key --populate archlinux

bash $HOME/.dotfiles/crucible/makepkg.sh

if [[ ! -f $(which paru) ]]; then
  pwd=$(pwd)
  echo -e "\n${MAG}Instalando Paru... ${END}\n"
  sudo pacman -Sy base-devel --noconfirm
  rm -rf $HOME/paru && git clone https://aur.archlinux.org/paru.git $HOME/paru && cd $HOME/paru && makepkg -si --noconfirm && rm -rf $HOME/paru
  cd $pwd
else
  echo -e "\n${MAG}Paru já está instalado! ${END}\n"
fi

echo -e "\n${MAG}Instalando aplicativos do sistema... ${END}\n"
install_packages "${SYSTEM_UTILS[@]}"

echo -e "\n${MAG}Instalando aplicativos de desenvolvimento... ${END}\n"
install_packages "${DEV_TOOLS[@]}"

echo -e "\n${MAG}Instalando aplicativos de manutenção... ${END}\n"
install_packages "${MAINTENANCE[@]}"

echo -e "\n${MAG}Instalando aplicativos de desktop... ${END}\n"
install_packages "${DESKTOP[@]}"

echo -e "\n${MAG}Instalando aplicativos de mídia... ${END}\n"
install_packages "${MEDIA[@]}"

echo -e "\n${MAG}Instalando fontes... ${END}\n"
install_packages "${FONTS[@]}"

if [[ $USER == "vitor" ]]; then
  if [[ $answerMyConfigs != ${answerMyConfigs#[Yys]} ]]; then
    echo -e "${GRE}Ok, reconfigurando ${MAG}configurações pessoais${END}\n"
    bash $HOME/.dotfiles/setup/myconfigs.sh
  else
    echo -e "${RED}Ok, não irei reconfigurar suas ${MAG}configurações pessoais${END}\n"
  fi

  if [[ $answerNvidia != ${answerNvidia#[Yys]} ]]; then
    echo -e "${GRE}Ok, instalando drivers da ${BOL_MAG}nvidia${END}\n"
    bash $HOME/.dotfiles/setup/nvidia.sh
  else
    echo -e "${RED}Ok, não irei instalar o driver da ${BOL_MAG}nvidia${END}\n"
  fi
fi

bash $HOME/.dotfiles/crucible/stow.sh
