function rg --description 'alias rg=rg --hidden --no-ignore --smart-case --no-follow -g "!.terraform" -g "!node_modules"'
    command rg --hidden --no-ignore --smart-case --no-follow -g "!.terraform" -g "!node_modules" $argv
end
