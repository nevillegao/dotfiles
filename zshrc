#Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
# COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
HIST_STAMPS="yyyy-mm-dd"
ZSH_CUSTOM="$HOME/.zsh.d"

# Preloading brew plugin so compinit can correctly find brew completions
# see https://github.com/ohmyzsh/ohmyzsh/issues/12183
source $ZSH/plugins/brew/brew.plugin.zsh

plugins=(
    # Source the plugin directly above
    # uncomment the plugin below once the bug is fixed
    # brew
    fzf
    autojump
    z
    starship
)

source $ZSH/oh-my-zsh.sh


# History options
HISTSIZE=1000000000
SAVEHIST=$HISTSIZE
setopt APPEND_HISTORY          # Don't erase history
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


# Terminal title
_update_title__precmd() {
    printf "\e]0;%s\e\\" "${PWD/${HOME}/~}"
}

add-zsh-hook precmd _update_title__precmd


# Starship
export STARSHIP_CONFIG=~/.starship.toml
