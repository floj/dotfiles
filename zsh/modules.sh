#
# when adding a new module, do not forget to include it in the moduleOrder array
#

typeset -A subtrees
subtrees["zsh-history-substring-search"]="zsh-users/zsh-history-substring-search"
subtrees["fast-syntax-highlighting"]="zdharma/fast-syntax-highlighting"
subtrees["forgit"]="wfxr/forgit"
export subtrees

typeset -A subtreeBranches
subtreeBranches["zsh-history-substring-search"]="master"
subtreeBranches["fast-syntax-highlighting"]="main"
subtreeBranches["forgit"]="master"
export subtreeBranches

typeset -a moduleOrder
#moduleOrder=(zsh-completions z zsh-history-substring-search fast-syntax-highlighting)
moduleOrder=(zoxide zsh-history-substring-search fast-syntax-highlighting forgit)
export moduleOrder
