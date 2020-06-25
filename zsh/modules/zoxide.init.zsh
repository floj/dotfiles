if command -v zoxide &>/dev/null; then
  autoload -U add-zsh-hook

_z_cd() {
    cd "$@" || return "$?"

    if [ -n "$_ZO_ECHO" ]; then
        echo "$PWD"
    fi
}

z() {
    if [ "$#" -eq 0 ]; then
        _z_cd ~ || return "$?"
    elif [ "$#" -eq 1 ] && [ "$1" = '-' ]; then
        if [ -n "$OLDPWD" ]; then
            _z_cd "$OLDPWD" || return "$?"
        else
            echo 'zoxide: $OLDPWD is not set'
            return 1
        fi
    else
        result="$(zoxide query "$@")" || return "$?"
        if [ -d "$result" ]; then
            _z_cd "$result" || return "$?"
        elif [ -n "$result" ]; then
            echo "$result"
        fi
    fi
}


alias zi='z -i'
alias za='zoxide add'
alias zq='zoxide query'
alias zr='zoxide remove'


_zoxide_hook() {
    zoxide add
}

[[ -n "${precmd_functions[(r)_zoxide_hook]}" ]] || {
    precmd_functions+=(_zoxide_hook)
}

fi
