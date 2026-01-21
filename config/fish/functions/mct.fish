function mct --wraps='mvnNoLogs clean test' --description 'alias mct=mvnNoLogs clean test'
    mvnNoLogs clean test $argv
end
