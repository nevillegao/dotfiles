# History options
HISTSIZE=1000000000
SAVEHIST=$HISTSIZE
setopt BANG_HIST               # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY        # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY      # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY           # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST  # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS        # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS    # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS       # Do not display a line previously found.
setopt HIST_IGNORE_SPACE       # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS       # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS      # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY             # Don't execute immediately upon history expansion.
setopt HIST_BEEP               # Beep when accessing nonexistent history.

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
