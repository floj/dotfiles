#
# editors
#
export EDITOR=nvim
export SYSTEMD_EDITOR=$EDITOR

export GREP_COLOR='37;45'

# include users local bin dir in path first
[[ -d $HOME/bin ]] && path=($HOME/bin $path)
[[ -d $HOME/.gotools/bin ]] && path=($HOME/.gotools/bin $path)
