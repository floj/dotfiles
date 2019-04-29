# auto change ruby version when .ruby-vervion is found
# auto change java version when .java-version is found
# auto set GO_PATH when .go-version is found
# auto set node version when .nvmrc is found

# function includeAutoCh(){
#   local base=$1
#   local file
#   shift
  
#   for f in "$@"; do
#     file="$base/$f"
#     if [[ -f "$file" ]]; then
#       source "$file"
#     fi
#   done
# }

# includeAutoCh "/usr/share/chruby"  "chruby.sh" "auto.sh"
# includeAutoCh "$HOME/bin/chs/java" "chjava.sh" "auto.sh"
# includeAutoCh "$HOME/bin/chs/go"   "auto.sh"
# includeAutoCh "$HOME/bin/chs/nvm" "auto.sh"

source "$HOME/bin/chs/auto.sh"
ch_auto_init "$HOME/bin/chs/hooks"

command -v direnv &>/dev/null && eval "$(direnv hook zsh)"
