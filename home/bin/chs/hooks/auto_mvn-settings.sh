#!/usr/bin/env zsh
unset MVN_SETTINGS_AUTO_VERSION

function chmvnsettings_reset() {
  [[ -z "$MAVEN_SETTINGS_PATH" ]] && return
  unset MAVEN_SETTINGS_PATH
}

function chmvnsettings_use() {
  [[ -n "$MAVEN_SETTINGS_PATH" ]] && chmvnsettings_reset
  echo "MAVEN_SETTINGS_PATH=$1"
  export MAVEN_SETTINGS_PATH="$1"
}

function chmvnsettings_apply() {
  [[ "$2" == "$MVN_SETTINGS_AUTO_VERSION" ]] && return
  MVN_SETTINGS_AUTO_VERSION="$2"
  chmvnsettings_use "$(cat "$1")"
  return $?
}

function chmvnsettings_unapply() {
  if [[ -n "$MVN_SETTINGS_AUTO_VERSION" ]]; then
    chmvnsettings_reset
    unset MVN_SETTINGS_AUTO_VERSION
  fi
}

CH_AUTO_HOOKS[.mvn-settings]="chmvnsettings"
# vi ft=zsh
