# Displays user owned processes status.
function psu {
  ps -U "${1:-$USER}" -o 'pid,%cpu,%mem,command' "${(@)argv[2,-1]}"
}

# Prints columns 1 2 3 ... n.
function slit {
  awk "{ print ${(j:,:):-\$${^@}} }"
}

# Makes a directory and changes to it.
function mkcd {
  [[ -n "$1" ]] && mkdir -p "$1" && builtin cd "$1"
}

# ssh tunnel somewhere
function tunnel() {
  [[ -z "$1" ]] && echo "usage: tunnel <server> <local-port> [<remote-port=local-port)> [<remote-host=localhost>]]" && return 1
  [[ -z "$2" ]] && echo "usage: tunnel $2 <local-port> [<remote-port=local-port)> [<remote-host=localhost>]]" && return 1
  local localport remoteport server remotehost
  server=$1
  localport=$2
  remoteport=${3:-$localport}
  remotehost=${4:-localhost}
  echo "creating ssh tunnel from local port ${localport} via ${server} to ${remotehost}:${remoteport}"
  ssh -v -L ${localport}:${remotehost}:${remoteport} ${server} -N
}

function urlenc() {
  jq -nr --arg v "$1" '$v|@uri'
}
