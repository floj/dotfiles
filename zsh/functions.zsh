sourceIncludeFiles() {
  local includedir="$1/includes"
  # include additional files
  if [[ -d $includedir ]]; then
    for file in $includedir/*.zsh; do
      source $file
    done
  fi
}

ead() {
  printf "> %s\n" "$*"
  "$@"
}
wgc() {
  local ifc cmd
  for f in "$@"; do
    ifc="$f"
    cmd=up
    case ${f:0:1} in
      +)
        cmd=up
        ifc=${f:1}
        ;;
      -)
        cmd=down
        ifc=${f:1}
        ;;
    esac
    ead wg-quick "$cmd" "wg-$ifc"
  done
}

# wg-up() {
#   while [[ -n $1 ]]; do
#     wg-quick up "wg-$1"
#     shift
#   done
# }
# wg-down() {
#   while [[ -n $1 ]]; do
#     wg-quick down "wg-$1"
#     shift
#   done
# }

xopen() {
  for f in "$@"; do
    xdg-open "$f"
  done
}

calc() {
  echo "scale=6; $@" | bc
}


fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# taken from grml
zsh-restart () {
  exec $SHELL $SHELL_ARGS "$@"
}

## Switching shell safely and efficiently? http://www.zsh.org/mla/workers/2001/msg02410.html
#bash() {
#    NO_SWITCH="yes" command bash "$@"
#}

unpack-rar() {
 [[ -z "$1" ]] && { echo "usage: unpack-rar <glob-pattern>"; return 1; }
 for f in $1; do
   unrar x "$f"
 done
}

who-has-port() {
  if pid=$(fuser $1/${2:-tcp} | awk '{ print $2 }'); then
    readlink "/proc/$pid/exe"
  else
    echo "No process found"
  fi
}

gen-password(){
  local s=""
  if command -v openssl &>/dev/null; then
    s=$(openssl rand -base64 36)
  else
    s=$(dd if=/dev/urandom bs=1 count=36 2>/dev/null | base64)
  fi
  case "${1:-}" in
    -a)
      s=$(tr '+' '-' <<<"$s" | tr '/' '_')
      ;;
    -n)
      s=$(tr '+' '1' <<<"$s" | tr '/' '2')
      ;;
    *)
      ;;
  esac
  echo "$s"
}
