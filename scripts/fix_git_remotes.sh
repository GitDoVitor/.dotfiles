#!/usr/bin/env bash

source $HOME/.Xconfigs

clear

echo -e "${BOL_MAG}===> Convertendo todos os repositórios de ${BOL_CYA}HTTPS para ${BOL_CYA}SSH... ${END}\n"

sleep 1

for repo in $(find ~/Github -name ".git" -type d); do
  dir=$(dirname "$repo")
  cd "$dir" || continue

  url=$(git remote get-url origin)

  if [[ "$url" == https://github.com/* ]]; then
    user_repo=$(echo "$url" | sed -E 's|https://github.com/||' | sed 's|\.git$||')
    ssh_url="git@github.com:${user_repo}.git"
    git remote set-url origin "$ssh_url"
    echo -e "${GRE}[✓] ${BOL_CYA}$dir ${BOL_MAG}→ atualizado para ${BOL_CYA}$ssh_url ${END}\n"
    sleep 1
  else
    echo -e "${RED}[ ] $dir → já está em SSH ou não é Github ${END}\n"
    sleep 1
  fi
done

echo -e "${BOL_MAG}=== Fim! ===${END}\n"

