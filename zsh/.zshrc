pokego --name ditto -no-title

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto      # update automatically without asking

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

(cat ~/.cache/wal/sequences &)

plugins=(
  git
  sudo
  web-search
  archlinux
  copyfile
  copybuffer
  dirhistory
  1password

)

source $ZSH/oh-my-zsh.sh

export MANPATH="/usr/local/man:$MANPATH"

export AURHELPER="paru"

alias vim="nvim"
alias rc="nvim ~/.zshrc"
alias hp="nvim ~/.config/hypr/hyprland.conf"

alias c='clear'                                                        # clear terminal

alias l='eza -lh --icons=auto'                                         # long list
alias ls='eza -1 --icons=auto'                                         # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto'                                       # long list dirs
alias lt='eza --icons=auto --tree'                                     # list folder as tree
alias un='$AURHELPER -Rns'                                             # uninstall package
alias up='$AURHELPER -Syu'                                             # update system/package/aur
alias pl='$AURHELPER -Qs'                                              # list installed package
alias pa='$AURHELPER -Ss'                                              # list available package
alias pc='$AURHELPER -Sc'                                              # remove unused cache
alias po='$AURHELPER -Qtdq | $AURHELPER -Rns -'                        # remove unused packages, also try > $AURHELPER -Qqd | $AURHELPER -Rsu --print -

# Directory navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'

# Created by `pipx` on 2025-03-14 05:21:17
export PATH="$PATH:/home/vitor/.local/bin"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ARCHIVES
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1    ;;
      *.tar.gz)    tar xzf $1    ;;
      *.bz2)       bunzip2 $1    ;;
      *.rar)       unrar x $1    ;;
      *.gz)        gunzip $1     ;;
      *.tar)       tar xf $1     ;;
      *.tbz2)      tar xjf $1    ;;
      *.tgz)       tar xzf $1    ;;
      *.zip)       unzip $1      ;;
      *.Z)         uncompress $1 ;;
      *.7z)        7z x $1       ;;
      *.xz)        tar xvJf $1   ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}



eval "$(starship init zsh)"
