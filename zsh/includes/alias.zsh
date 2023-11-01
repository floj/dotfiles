#!/bin/zsh
#
if command -v lsd &>/dev/null; then
  alias ll='lsd -Alh --date relative --icon never --group-dirs first'
  alias ls='lsd --icon never --group-dirs first'
  alias tree='lsd --icon never --group-dirs first --tree'
elif command -v exa &>/dev/null; then
  alias ll='exa -alg --git --group-directories-first'
else
  alias ls='ls --color=auto --group-directories-first'
  alias ll='ls -AlhpN'
fi

if command -v llama &>/dev/null; then
  lcd() {
    cd "$(llama "$@")"
  }
fi

if command -v bat &>/dev/null; then
  cat() {
    bat -p "$@"
  }
fi

alias cp='cp --reflink=auto'
alias fr='file-roller'
alias n='nautilus . &'
alias less='less -S'
alias v='nvim'
alias vi='v'

alias awssh='ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -l ec2-user -i ec2_amazon-ebs.pem'

alias ...='cd ../..'
alias ....='cd ../../..'

# knowing my typos
alias dc='cd'

alias grep='grep --color=auto'
alias _='sudo'

alias get='curl --continue-at - --location --progress-bar --remote-name --remote-time'

alias df='df -hk'
alias du='du -hk'

alias -s .log='less'
alias -s .txt='less'

alias meld='GTK_THEME=:light meld'
alias rg='rg --hidden --no-ignore --smart-case --follow -g "!.terraform" -g "!node_modules"'
alias fd='fd -uu'

# terraform
#alias terraform='terraform'
alias tf='terraform'
alias tfi='terraform init'
alias tfa='terraform apply'
alias tfaa='terraform apply -auto-approve'
alias tfp='terraform plan'
if command -v tfrs &> /dev/null; then
  alias tfp='tfrs --exec terraform --prefix=-target= -- plan -out state.out -compact-warnings'
fi

if command -v codium &> /dev/null; then
  alias code='codium'
fi

#
# ruby/rails
#
alias rs='rails server'
alias rc='rails console'
alias be='bundle exec'
alias spec='rake spec'
alias speci='rake integrate'
alias rnext="rspec --next-failure"

#
# git stuff
#
alias gup='git fetch && git rebase --autostash FETCH_HEAD'
alias gp="git push"
alias stash='git stash'
alias unstash='git stash pop'
alias gpr='git pull --rebase'

#
# maven
#
alias mvnNoLogs="JUNIT_LOG_LEVEL_STDOUT=OFF mvn -nsu"
alias mc='mvn compile'
alias mi='mvnNoLogs install'
alias mp='mvnNoLogs package'
alias mt='mvnNoLogs test'
alias mct='mvnNoLogs clean test'
alias mci='mvnNoLogs clean install'
alias mcp='mvnNoLogs clean package'

#
# docker
#
alias dri='docker run -ti --rm'
alias dcp='docker-compose'


#
# arch/pacman
#
alias update-mirrors='sudo reflector --verbose -c Germany -p https --age 12 --sort score -f 5 --save /etc/pacman.d/mirrorlist'

alias whatismyip='curl ifconfig.me'

alias nightfm='mpv --shuffle https://soundcloud.com/v-erse/sets/night'

alias awsa='aws --cli-auto-prompt'
