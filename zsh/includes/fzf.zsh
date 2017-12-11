#
# from https://github.com/junegunn/fzf/wiki/examples
#
if whence fzf > /dev/null 2>&1; then

  if whence rg > /dev/null; then
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
  fi

  zz() {
    local matches=$(_z -e -l "$*" 2>&1)
    if [[ $matches == common:* ]]; then
      _z "$*"
    else
      local line=$(echo "$matches" | fzf --height 40% --reverse --tac --select-1 --query "$*") && cd "${line##* }"
    fi
  }

  # fdr - cd to selected parent directory
  ffr() {
    get_parent_dirs() {
      local dir
      dir="$1"
      while [[ -n "$dir" ]] && [[ "$dir" != "$HOME" ]]; do
        echo "$dir"
        dir="${dir%/*}"
      done
    }
    local dir cdir
    cdir=${1:-$PWD}
    dir=$(get_parent_dirs "${cdir:A}" | fzf) && cd "$dir"
  }

  # fd - cd to selected sub directory
  if whence fd >/dev/null; then
    ff() {
      local dir
      dir=$(fd -d "${1:-3}" -t d -I -H 2> /dev/null | fzf) && cd "$dir"
    }
  else
    ff() {
      local dir
      dir=$(find * -maxdepth "${1:-3}" -type d -print 2> /dev/null | fzf) && cd "$dir"
    }
  fi

  # fh - repeat history
  fh() {
    print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
  }

  # fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
  fgbr() {
    local branches branch
    branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") || return
    branch=$(echo "$branches" | fzf -d $(( 2 + $(wc -l <<< "$branches") )) +m) || return
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
  }

  # fco - checkout git branch/tag
  fgco() {
    local tags branches target
    tags=$(
      git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
    branches=$(
      git branch --all | grep -v HEAD             |
      sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
      sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
    target=$(
      (echo "$tags"; echo "$branches") |
      fzf --ansi +m -d "\t" -n 2) || return
    git checkout $(echo "$target" | awk '{print $2}')
  }

  if whence tmux >/dev/null 2>&1; then
    ftm() {
      [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
      if [[ "$1" ]]; then 
        tmux "$change" -t "$1" 2>/dev/null || (tmux new-session -d -s "$1" && tmux "$change" -t "$1"); return
      fi
      session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) && tmux "$change" -t "$session" || echo "No sessions found."
    }

    ftms() {
      local session
      session=$(tmux list-sessions -F "#{session_name}" | \
        fzf --query="$1" --select-1 --exit-0) &&
        tmux switch-client -t "$session"
    }
  fi

fi
