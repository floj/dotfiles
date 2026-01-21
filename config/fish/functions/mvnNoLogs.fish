function mvnNoLogs --wraps='JUNIT_LOG_LEVEL_STDOUT=OFF mvn -nsu' --description 'alias mvnNoLogs=JUNIT_LOG_LEVEL_STDOUT=OFF mvn -nsu'
    JUNIT_LOG_LEVEL_STDOUT=OFF mvn -nsu $argv
end
