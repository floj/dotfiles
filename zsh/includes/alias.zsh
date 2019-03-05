#!/bin/zsh
if whence exa>/dev/null 2>&1; then
  alias ll='exa -alg --git --group-directories-first'
else
  alias ls='ls --color=auto --group-directories-first'
  alias ll='ls -AlhpN'
fi

alias cp='cp --reflink=auto'
alias fr='file-roller'
alias n='nautilus . &'
alias less='less -S'
alias v='nvim'
alias vi='v'

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

whence rg >/dev/null 2>&1 && alias rg='rg -S -L --hidden' 

whence xsel >/dev/null 2>&1 && alias clipboard='xsel -b'

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
alias mi='mvn install'
alias mp='mvn package'
alias mt='mvn test'
alias mct='mvn clean test'
alias mc='mvn compile'
alias mci='mvn clean install'
alias mcp='mvn clean package'

#
# docker
#
alias dri='docker run -ti --rm'

#
# arch/pacman
#
alias update-mirrors='sudo reflector --verbose -c Germany -p https --age 12 --sort score -f 5 --save /etc/pacman.d/mirrorlist'

alias youtube-dl-mp3="youtube-dl --extract-audio --audio-format mp3"
