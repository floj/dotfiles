function mkcd
    if test (count $argv) -gt 0
        mkdir -p $argv[1]; and cd $argv[1]
    end
end
