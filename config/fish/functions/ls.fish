function ls --wraps='lsd --icon never --group-dirs first' --description 'alias ls=lsd --icon never --group-dirs first'
    lsd --icon never --group-dirs first $argv
end
