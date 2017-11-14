#!/usr/bin/env zsh

function chjava_apply() {
  local lines=("${(@f)"$(<$1)"}")
  if [[ -n $lines ]]; then
    version="${lines[1]%%[[::space::]]}"
    if [[ "$version" == "$JAVA_AUTO_VERSION" ]]; then return
    else
      JAVA_AUTO_VERSION="$version"
      chjava "$version" "${(e)lines[2]}"
      return $?
    fi
  fi
}


function chjava_unapply() {
  if [[ -n "$JAVA_AUTO_VERSION" ]]; then
    chjava_reset
    unset JAVA_AUTO_VERSION
  fi
}

CH_AUTO_HOOKS[.java-version]="chjava"
# vi ft=zsh
