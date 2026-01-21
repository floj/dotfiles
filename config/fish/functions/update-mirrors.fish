function update-mirrors --wraps='sudo reflector --verbose -c Germany -p https --age 12 --sort score -f 5 --save /etc/pacman.d/mirrorlist' --description 'alias update-mirrors=sudo reflector --verbose -c Germany -p https --age 12 --sort score -f 5 --save /etc/pacman.d/mirrorlist'
    sudo reflector --verbose -c Germany -p https --age 12 --sort score -f 5 --save /etc/pacman.d/mirrorlist $argv
end
