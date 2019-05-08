#!/usr/bin/env zsh
unset AWS_VAULT_AUTO_VERSION

function chawsvault_reset() {
  [[ -z "$AWS_VAULT_PROFILE" ]] && return
  unset AWS_VAULT_PROFILE 
}

function chawsvault_use() {
  [[ -n "$AWS_VAULT_PROFILE" ]] && chawsvault_reset
  echo "AWS_VAULT_PROFILE=$1"
  export AWS_VAULT_PROFILE="$1"
}

function chawsvault_apply() {
  [[ "$2" == "$AWS_VAULT_AUTO_VERSION" ]] && return
  AWS_VAULT_AUTO_VERSION="$2"
  chawsvault_use "$(cat "$1")"
  return $?
}

function chawsvault_unapply() {
  if [[ -n "$AWS_VAULT_AUTO_VERSION" ]]; then
    chawsvault_reset
    unset AWS_VAULT_AUTO_VERSION
  fi
}

CH_AUTO_HOOKS[.aws-vault-profile]="chawsvault"
# vi ft=zsh
