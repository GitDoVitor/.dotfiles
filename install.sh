#!/usr/bin/env bash

source $HOME/.Xconfigs # My general configs

clear

if [[ ! -d $HOME/.dotfiles ]]; then
  echo "For you to use this dotfiles, it must be located in your HOME, and hidden, the correct path is: ~/.dotfiles"
  exit
fi

echo("Removendo perfis pré criados!")
rm -rf $HOME/.bash_profile .bashrc .xinitrc .config/mimeapps.list

# Stow
cd $HOME/.dotfiles
for dotfiles in $(find . -maxdepth 1  -not -name ".*" ! -name "setup" -type d -printf '%f\n'); do
  stow --adopt $dotfiles || echo -e "${BOL_RED}Erro no gnu/stow${END}"
  echo "${RED}$dotfiles ${GRE}stowed.${END}"
done

