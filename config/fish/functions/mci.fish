function mci --wraps='mvnNoLogs clean install' --description 'alias mci=mvnNoLogs clean install'
    mvnNoLogs clean install $argv
end
