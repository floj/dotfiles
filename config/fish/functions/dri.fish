function dri --wraps='docker run -ti --rm' --description 'alias dri=docker run -ti --rm'
    docker run -ti --rm $argv
end
