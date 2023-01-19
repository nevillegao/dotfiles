# Emulate Bash $IGNOREEOF behavior
bash-ctrl-d() {
  if [[ $CURSOR == 0 && -z $BUFFER ]]; then
    [[ -z $IGNOREEOF || $IGNOREEOF == 0 ]] && exit

    if [[ $LASTWIDGET == bash-ctrl-d ]]; then
      (( --__BASH_IGNORE_EOF <= 0 )) && exit
    else
      (( __BASH_IGNORE_EOF = IGNOREEOF ))
    fi
  fi
}

zle -N bash-ctrl-d
bindkey "^d" bash-ctrl-d

# Type Ctrl-D 101 times to exit shell to prevent accidental exiting
IGNOREEOF=100
setopt ignore_eof


# Confirm before exit shell
eexit() {
    read "reply?${COLOR_ERED}Exit? [y/N] ${COLOR_NO}"
    if [[ $reply =~ ^[Yy]$ ]]; then
        exit
    fi
}


# Terminal title
_update_title__precmd() {
    printf "\e]0;%s\e\\" "${PWD/${HOME}/~}"
}

add-zsh-hook precmd _update_title__precmd


# Disable *-magic plugins in Oh My Zsh
DISABLE_MAGIC_FUNCTIONS="true"
