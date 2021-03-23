#
# when adding a new module, do not forget to include it in the moduleOrder array
#

typeset -A subtrees
subtrees["zsh-history-substring-search"]="zsh-users/zsh-history-substring-search"
subtrees["fast-syntax-highlighting"]="zdharma/fast-syntax-highlighting"
export subtrees

typeset -a moduleOrder
#moduleOrder=(zsh-completions z zsh-history-substring-search fast-syntax-highlighting)
moduleOrder=(zoxide zsh-history-substring-search fast-syntax-highlighting)
export moduleOrder
