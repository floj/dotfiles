#!/usr/bin/env zsh

function chruby_apply() {
  local lines=("${(@f)"$(<$1)"}")
  if [[ -n $lines ]]; then
    version="${lines[1]%%[[::space::]]}"
    if [[ "$version" == "$RUBY_AUTO_VERSION" ]]; then return
    else
      RUBY_AUTO_VERSION="$version"
      chruby "$version"
      return $?
    fi
  fi
}

function chruby_unapply() {
  if [[ -n "$RUBY_AUTO_VERSION" ]]; then
    chruby_reset
    unset RUBY_AUTO_VERSION
  fi
}

CH_AUTO_HOOKS[.ruby-version]="chruby"
# vi ft=zsh
