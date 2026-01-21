function unstash --wraps='git stash pop' --description 'alias unstash=git stash pop'
    git stash pop $argv
end
