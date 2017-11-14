#
# editors
#
export EDITOR=nvim
export SVN_EDITOR="nvim -c ':1' -c 'startinsert'"


export GREP_COLOR='37;45'

# include users local bin dir in path first
[[ -d $HOME/bin ]] && path=($HOME/bin $path)
