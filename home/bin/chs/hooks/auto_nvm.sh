#!/usr/bin/env zsh

unset NODE_AUTO_VERSION

function chnode_reset() {
  [[ -n "$NVM_BIN" ]] && nvm use default
}

function chnode_apply() {
  local lines=("${(@f)"$(<$1)"}")
  if [[ -n $lines ]]; then
    version="${lines[1]%%[[::space::]]}"
    if [[ "$version" == "$NODE_AUTO_VERSION" ]]; then return
    else
      NODE_AUTO_VERSION="$version"
      nvm use "$version"
      return $?
    fi
  fi
}

function chnode_unapply() {
  if [[ -n "$NODE_AUTO_VERSION" ]]; then
    chnode_reset
    unset NODE_AUTO_VERSION
  fi
}

#CH_AUTO_HOOKS[.nvmrc]="chnode"
# vi ft=zsh
