function n --wraps='nautilus . &' --description 'alias n=nautilus . &'
    xdg-open . $argv &>/dev/null &
end
