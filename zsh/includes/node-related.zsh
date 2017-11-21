#
# nvm
#
# if [[ -e /usr/share/nvm/init-nvm.sh ]]; then
#   nvm() {
#     source /usr/share/nvm/init-nvm.sh 
#     nvm $@
#   }
# fi

[[ -d "$HOME/.npm-packages/bin" ]] && path+=($HOME/.npm-packages/bin)
