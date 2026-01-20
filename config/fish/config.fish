if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_greeting
  atuin init fish | source
  direnv hook fish | source
  zoxide init fish | source
  starship init fish | source
end
