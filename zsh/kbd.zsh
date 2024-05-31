#
# used showkey -a to get the codes
#
typeset -A keymap
#set some defaults

keymap[Insert]="^[[2~"
keymap[Delete]="^[[3~"
keymap[Home]="^[[H"
keymap[End]="^[[F"
keymap[PageUp]="^[[5~"
keymap[PageDown]="^[[6~"
keymap[Backspace]="^?"

keymap[Up]="^[[A"
keymap[Down]="^[[B"
keymap[Left]="^[[D"
keymap[Right]="^[[C"

keymap[ShiftTab]="^[[Z"

keymap[Alt]="^["
keymap[Ctrl]="^"

keymap[AltLeft]="${keymap[Alt]}${keymap[Left]}"
keymap[AltRight]="${keymap[Alt]}${keymap[Right]}"
keymap[CtrlLeft]="${keymap[Ctrl]}${keymap[Left]}"
keymap[CtrlRight]="${keymap[Ctrl]}${keymap[Right]}"

keymap[AltBackspace]="${keymap[Alt]}${keymap[Backspace]}"

if [[ -n $TILIX_ID ]]; then
  keymap[Home]="^[[H"
  keymap[End]="^[[F"

  keymap[AltLeft]="^[[1;3D"
  keymap[AltRight]="^[[1;3C"
  keymap[CtrlLeft]="^[[1;5D"
  keymap[CtrlRight]="^[[1;5C"
fi

if [[ -n $TMUX ]]; then
  keymap[Home]="^[[1~"
  keymap[End]="^[[4~"

  keymap[AltLeft]="^[[1;3D"
  keymap[AltRight]="^[[1;3C"
  keymap[CtrlLeft]="^[[1;5D"
  keymap[CtrlRight]="^[[1;5C"
fi

bindkey "${keymap[Home]}"     beginning-of-line
bindkey "${keymap[End]}"      end-of-line
bindkey "${keymap[Insert]}"   overwrite-mode
bindkey "${keymap[Delete]}"   delete-char
# bindkey "${keymap[Up]}"       history-substring-search-up
# bindkey "${keymap[Down]}"     history-substring-search-down
bindkey "${keymap[Left]}"     backward-char
bindkey "${keymap[Right]}"    forward-char
bindkey "${keymap[ShiftTab]}" reverse-menu-complete

bindkey "${keymap[AltBackspace]}"   backward-delete-word
bindkey "${keymap[AltLeft]}"        backward-word
bindkey "${keymap[AltRight]}"       forward-word
bindkey "${keymap[CtrlLeft]}"       beginning-of-line
bindkey "${keymap[CtrlRight]}"      end-of-line
unset keymap
