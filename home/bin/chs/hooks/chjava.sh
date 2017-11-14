#!/usr/bin/env zsh

JAVAS=()
if [[ -d "$HOME/programs/java" ]]; then
  for dir in $HOME/programs/java/*(e:'[[ -x $REPLY/bin/java ]]':); do
    JAVAS+=("$dir")
  done
  unset dir
fi

function chjava_reset()
{
  [[ -z "$JAVA_HOME" ]] && return

  PATH=":$PATH:"; PATH="${PATH//:$JAVA_HOME\/bin:/:}"

  PATH="${PATH#:}"; PATH="${PATH%:}"
  unset JAVA_VERSION JAVA_HOME JAVA_OPTS
  hash -r
}

function chjava_use()
{
  if [[ ! -x "$1/bin/java" ]]; then
    echo "chjava: $1/bin/java not executable" >&2
    return 1
  fi

  [[ -n "$JAVA_HOME" ]] && chjava_reset
  export JAVA_HOME="$1"
  export PATH="$JAVA_HOME/bin:$PATH"
  export JAVA_VERSION="$($JAVA_HOME/bin/java -version 2>&1 | grep "^java version" | sed 's/java version "\(.*\)"/\1/')"
  [[ -n "$2" ]] && export JAVA_OPTS="$2"
  hash -r
}

function chjava()
{
  case "$1" in
    -h|--help)
      echo "usage: chjava [JAVA|VERSION|system]"
      ;;
    -V|--version)
      echo "chjava: $CHJAVA_VERSION"
      ;;
    "")
      local dir star
      for dir in "${JAVAS[@]}"; do
        dir="${dir%%/}"
        if [[ "$dir" == "$JAVA_HOME" ]]; then star="*"
        else                                  star=" "
        fi

        echo " $star ${dir##*/}"
      done
      ;;
    system) chjava_reset ;;
    *)
      local dir match
      for dir in "${JAVAS[@]}"; do
        dir="${dir%%/}"
        case "${dir##*/}" in
          "$1")	match="$dir" && break ;;
          *"$1"*)	match="$dir" ;;
        esac
      done

      if [[ -z "$match" ]]; then
        echo "chjava: unknown Java: $1" >&2
        return 1
      fi

      shift
      chjava_use "$match" "$*"
      ;;
  esac
}

# vi ft=zsh
