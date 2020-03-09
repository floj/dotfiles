# vim:ft=zsh

setopt prompt_cr
setopt prompt_sp
setopt prompt_subst
unsetopt transient_rprompt

PROMPT_LEFT_TRIANGLE="◀"
PROMPT_GIT_STASH="⍊"
PROMPT_GIT_STAGED="✱"
PROMPT_GIT_UNSTAGED="◼"

function prompt_segment_right() {
  if [[ -n $3 ]]; then
    echo -n "%{%F{$1}%}${PROMPT_LEFT_TRIANGLE}%{%K{$1}%F{$2}%} $3 "
  fi
}

function prompt_segment_left() {
  if [[ -n $3 ]]; then
    echo -n "%{%K{$1}%F{$2}%} $3 "
  fi
}

function _prompt_right() {
  prompt_segment_right white 17    "${PWD/#$HOME/~}"
  prompt_segment_right 0     white "${vcs_info_msg_0_}"
  prompt_segment_right 26    white "$RUBY_VERSION"
  prompt_segment_right 196   16    "$JAVA_VERSION"
  prompt_segment_right 208   17     "%*"
}

function _prompt_left() {
  local promptcolor awsRegion
  [[ $RETVAL -gt 0 ]] && promptcolor=9 || promptcolor=10
  if [[ $(jobs -l | wc -l) -gt 0 ]]; then
    echo -n "%{%F{208}%}%j ⚙"
  fi
  if [[ -n $AWS_PROFILE ]]; then
    awsRegion=${AWS_REGION:-$AWS_DEFAULT_REGION}
    echo -n "%{%F{red}%}aws:$AWS_PROFILE "
    [[ -n $awsRegion ]] && [[ "$awsRegion" != "eu-central-1" ]]  && echo -n "%{%F{red}%}($awsRegion) "
  fi
  echo -n "%{%b%k%F{$promptcolor}%}> "
}

function prompt_flo_precmd() {
  RETVAL=$?
  vcs_info
  ch_auto_do
}

# Show remote ref name and number of commits ahead-of or behind
function +vi-git-ahead-behind() {
    local ahead behind remote
    local -a gitstatus

    # Are we on a remote-tracking branch?
    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
        --symbolic-full-name 2>/dev/null)/refs\/remotes\/}

    if [[ -n ${remote} ]] ; then
        ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        (( $ahead )) && gitstatus+=( "%F{50}+${ahead}%f" )

        behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
        (( $behind )) && gitstatus+=( "%F{197}-${behind}%f" )

        hook_com[branch]="${hook_com[branch]}${(j:/:)gitstatus}"
    fi
}

# Show count of stashed changes
function +vi-git-stash() {
    local -a stashes

    if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
        stashes=$(git stash list 2>/dev/null | wc -l)
        [[ -n $stashes ]] && hook_com[misc]="%F{243}${PROMPT_GIT_STASH}${stashes}"
    fi
}

function prompt_setup() {
  autoload -U promptinit && promptinit
  autoload -U colors && colors
  autoload -U vcs_info
  autoload -U add-zsh-hook

  add-zsh-hook precmd prompt_flo_precmd

  # Set vcs_info parameters.
  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*' check-for-changes true
  zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f'
  zstyle ':vcs_info:*' stagedstr "%F{blue}${PROMPT_GIT_STAGED}%f"
  zstyle ':vcs_info:*' unstagedstr "%F{white}${PROMPT_GIT_UNSTAGED}%f"
  zstyle ':vcs_info:*' formats '%F{5}%s[%F{2}%b%F{white} %F{red}%m%u%c%F{5}]%f'
  zstyle ':vcs_info:git*+set-message:*' hooks git-stash git-ahead-behind

  PROMPT='%{%f%b%k%}$(_prompt_left)%{%f%b%k%}'
  RPROMPT='%{%f%b%k%}$(_prompt_right)%{%f%b%k%}'
}

prompt_setup

