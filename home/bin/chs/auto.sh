#!/usr/bin/env zsh

unset CH_AUTO_HOOKS
unset CH_AUTO_FILES
typeset -Ag CH_AUTO_HOOKS
typeset -Ag CH_AUTO_FILES

function ch_auto_init() {
  #ch_auto_debug "init from $1"
  for file in ${1:A}/*.sh; do
    #ch_auto_debug "sourcing $file"
    source "$file"
  done
  # ch_auto_debug "hooks: $CH_AUTO_HOOKS"
}

function ch_auto_do() {
  local dir="$PWD"
  local file
  local func
  local -A hooks
  set -A hooks ${(kv)CH_AUTO_HOOKS}

  until [[ -z "$dir" ]]; do
    #ch_auto_debug "checking $dir"
    for versionfile in ${(k)hooks}; do
      file="$dir/$versionfile"
      #ch_auto_debug "  file $versionfile"
      if [[ -f "$file" ]]; then
        if [[ "$CH_AUTO_FILES[$versionfile]" == "$file" ]]; then
          #ch_auto_debug "    already using version from $file"
          unset "hooks[$versionfile]"
          continue
        fi
        #ch_auto_debug "    found, executing ${hooks[$versionfile]}_apply"
        ${hooks[$versionfile]}_apply "$file" "$dir"
        CH_AUTO_FILES[$versionfile]="$file"
        unset "hooks[$versionfile]"
      fi
    done

    if [[  -z $hooks ]]; then
      #ch_auto_debug "hooks empty, exiting"
      hash -r
      return
    fi
    dir="${dir%/*}"
  done

  for versionfile in ${(k)hooks}; do
    #ch_auto_debug "call unapply for ${hooks[$versionfile]} ($versionfile)"
    ${CH_AUTO_HOOKS[$versionfile]}_unapply
    unset "CH_AUTO_FILES[$versionfile]"
  done
  hash -r
}

# function ch_auto_debug() {
#   echo "$*"
# }

if [[ ! "$chpwd_functions" == *ch_auto_do* ]]; then
  chpwd_functions+=("ch_auto_do")
fi


# vi ft=zsh
