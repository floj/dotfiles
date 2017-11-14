exportIfPresent() {
  local exportName=$1
  local exportDir=$2
  local exportBin=$3
  shift; shift; [[ $# -ge 1 ]] && shift
  #echo "found $exportName $exportDir $exportBin"

  [[ ! -d "$exportDir" ]] && return 1

  if [[ -n "$exportName" ]]; then
    #echo "  exporting $exportName as $exportDir"
    export $exportName="$exportDir"
  fi

  if [[ "$exportBin" == "true"  ]] && [[ -d "$exportDir/bin" ]]; then
    #echo "  exporting to PATH $exportDir"
    path=($exportDir/bin $path)
  fi

  while [[ $# -ge 2 ]]; do
    local extraKey=$1
    local extraValue=$2
    shift; shift
    #echo "    exporting extra value $extraKey as $extraValue"
    export $extraKey=$extraValue
  done

  return 0
}

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
