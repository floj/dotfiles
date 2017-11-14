
# Sets the terminal or terminal multiplexer window title.
function set-window-title {
  local title_format{,ted}
  zformat -f title_formatted "%s" "s:$argv"
  title_format="\e]2;%s\a"
  printf "$title_format" "${(V%)title_formatted}"
}

# Sets the tab and window titles with a given command.
function _terminal-set-titles-with-command {
  emulate -L zsh
  setopt EXTENDED_GLOB

  # Get the command name that is under job control.
  if [[ "${2[(w)1]}" == (fg|%*)(\;|) ]]; then
    # Get the job name, and, if missing, set it to the default %+.
    local job_name="${${2[(wr)%*(\;|)]}:-%+}"

    # Make a local copy for use in the subshell.
    local -A jobtexts_from_parent_shell
    jobtexts_from_parent_shell=(${(kv)jobtexts})

    jobs "$job_name" 2>/dev/null > >(
      read index discarded
      # The index is already surrounded by brackets: [1].
      _terminal-set-titles-with-command "${(e):-\$jobtexts_from_parent_shell$index}"
    )
  else
    # Set the command name, or in the case of sudo or ssh, the next command.
    local cmd="${${2[(wr)^(*=*|sudo|ssh|-*)]}:t}"
    unset MATCH

    set-window-title "$cmd"
  fi
}

# Sets the tab and window titles with a given path.
function _terminal-set-titles-with-path {
  emulate -L zsh
  setopt EXTENDED_GLOB

  local absolute_path="${${1:a}:-$PWD}"
  local abbreviated_path="${absolute_path/#$HOME/~}"
  unset MATCH

  set-window-title "$abbreviated_path"
}

# Sets the Terminal.app proxy icon.
function _terminal-set-terminal-app-proxy-icon {
  printf '\e]7;%s\a' "file://$HOST${${1:-$PWD}// /%20}"
}

autoload -U add-zsh-hook

# Sets the tab and window titles before the prompt is displayed.
add-zsh-hook precmd _terminal-set-titles-with-path

# Sets the tab and window titles before command execution.
add-zsh-hook preexec _terminal-set-titles-with-command


