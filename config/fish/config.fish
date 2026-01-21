# vim: ft=fish
set -g fish_greeting

if status is-interactive
    # Commands to run in interactive sessions can go here
    atuin init fish | source
    direnv hook fish | source
    zoxide init fish | source
    starship init fish | source

    fish_add_path ~/.local/bin
    fish_add_path ~/bin
    fish_add_path --prepend ~/go/bin

    if test -f ~/.config.local.fish
        source ~/.config.local.fish
    end
end
