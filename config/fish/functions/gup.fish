function gup --wraps='git fetch && git rebase --autostash FETCH_HEAD' --description 'alias gup=git fetch && git rebase --autostash FETCH_HEAD'
    git fetch && git rebase --autostash FETCH_HEAD $argv
end
