function awsa --wraps='aws --cli-auto-prompt' --description 'alias awsa=aws --cli-auto-prompt'
    aws --cli-auto-prompt $argv
end
