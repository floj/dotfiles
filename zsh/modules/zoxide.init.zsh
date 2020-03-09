if command -v zoxide &>/dev/null; then
  autoload -U add-zsh-hook

  _zoxide_precmd() {
      zoxide add
  }

  add-zsh-hook precmd _zoxide_precmd
  z() {
      if [ $# -ne 0 ]; then
          _Z_RESULT=$(zoxide query "$@")
          case $_Z_RESULT in
              "query: "*)
                  cd "${_Z_RESULT:7}"
                  ;;
              *)
                  echo "${_Z_RESULT}"
                  ;;
          esac
      fi
  }

  alias zi="z -i"

  alias za="zoxide add"
  alias zq="zoxide query"
  alias zr="zoxide remove"
fi
