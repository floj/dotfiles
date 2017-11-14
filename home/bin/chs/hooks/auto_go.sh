#!/usr/bin/env zsh
unset GO_AUTO_VERSION

function chgo_reset() {
  [[ -z "$GOPATH" ]] && return
  PATH=":$PATH:"; PATH="${PATH//:$GOPATH\/bin:/:}"
  PATH="${PATH#:}"; PATH="${PATH%:}"
  unset GOPATH
}

function chgo_use() {
  [[ -n "$GOPATH" ]] && chgo_reset
  echo "GOPATH set to '$1'"
  export GOPATH="$1"
  export PATH="$GOPATH/bin:$PATH"
}

function chgo_apply() {
  [[ "$2" == "$GO_AUTO_VERSION" ]] && return
  GO_AUTO_VERSION="$2"
  chgo_use "$2"
  return $?
}

function chgo_unapply() {
  if [[ -n "$GO_AUTO_VERSION" ]]; then
    chgo_reset
    unset GO_AUTO_VERSION
  fi
}

CH_AUTO_HOOKS[.go-version]="chgo"
# vi ft=zsh
