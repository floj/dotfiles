function get --wraps='curl --continue-at - --location --progress-bar --remote-name --remote-time' --description 'alias get=curl --continue-at - --location --progress-bar --remote-name --remote-time'
    curl --continue-at - --location --progress-bar --remote-name --remote-time $argv
end
