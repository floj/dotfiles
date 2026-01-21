function ll --wraps=ls --wraps='lsd -Alh --date relative --icon never --group-dirs first -g' --description 'alias ll=lsd -Alh --date relative --icon never --group-dirs first -g'
    lsd -Alh --date relative --icon never --group-dirs first -g $argv
end
