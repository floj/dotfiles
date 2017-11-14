#!/bin/zsh
if kubectlbin=$(whence kubectl 2>&1); then 
  kubectl_compl_loaded=0

  kubectl() {
    if [[ "$kubectl_compl_loaded" == 0 ]]; then
      echo "loading kubectl completition"
      source <("$kubectlbin" completion zsh)
      kubectl_compl_loaded=1
    fi
    "$kubectlbin" $*
  }
fi
