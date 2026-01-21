function mcp --wraps='mvnNoLogs clean package' --description 'alias mcp=mvnNoLogs clean package'
    mvnNoLogs clean package $argv
end
