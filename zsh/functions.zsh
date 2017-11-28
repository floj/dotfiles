sourceIncludeFiles() {
  local includedir="$1/includes"
  # include additional files
  if [[ -d $includedir ]]; then
    for file in $includedir/*.zsh; do
      source $file
    done
  fi
}

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
