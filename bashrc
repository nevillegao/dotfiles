# Load various rc files
test -f $HOME/.colors && . $HOME/.colors
test -f $HOME/.alias && . $HOME/.alias
test -f /etc/bash_completion && . /etc/bash_completion
test -f $HOME/bin/chs_completion && . $HOME/bin/chs_completion

# Color setup for 'ls'
eval $(dircolors -b)

# Terminal title
#export PS1='\u:\w> '
export PS1="\[${ECYAN}\][\u\[${NO_COLOR}\]:\[${EYELLOW}\]\w]\[${NO_COLOR}\]$ "
case $TERM in
    xterm*|rxvt*)
        export PROMPT_COMMAND='echo -ne "\e]0;$(ppwd)\007"'
        ;;
    screen*)
        export PROMPT_COMMAND='echo -ne "\ek$(basename "$(ppwd)")\e\\"'
        ;;
    *)
        export PS1="\[${EMAGENTA}\][\A]$PS1"
        ;;
esac

# Terminal color
if [[ -n $COLORTERM && -r /usr/share/terminfo/x/xterm+256color ]]; then
    if [[ $TERM =~ 'xterm' ]]; then
        export TERM='xterm-256color'
    elif [[ $TERM =~ 'screen' ]]; then
        export TERM='screen-256color'
    fi
fi

# Utilities options
export PYTHONSTARTUP="$HOME/.pythonstartup"
export EDITOR='/usr/bin/vim'
export GREP_OPTIONS='--color=auto -I --exclude-dir=.svn --exclude=*.po'
export LESS='-M -i -R'
export APT_CONFIG="$HOME/.apt/config"

# Less colors for man pages
export GROFF_NO_SGR='yes'               # enable manpage color
export LESS_TERMCAP_mb=$'\E[01;31m'     # enter blink mode
export LESS_TERMCAP_md=$'\E[01;31m'     # enter bold mode
export LESS_TERMCAP_me=$'\E[0m'         # exit attribute mode
export LESS_TERMCAP_so=$'\E[01;44;33m'  # enter standout-mode
export LESS_TERMCAP_se=$'\E[0m'         # exit standout mode
export LESS_TERMCAP_us=$'\E[01;32m'     # enter underline mode
export LESS_TERMCAP_ue=$'\E[0m'         # exit underline mode

# History options
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=1000000
export HISTFILESIZE=1024000000
export HISTTIMEFORMAT='%F %T '
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Type Ctrl-D 100 times to exit shell to prevent accidental exiting
export IGNOREEOF=100

# Custom variables
export GROUP=$(id -gn)

# Run this whenever you have an agent session running and a terminal that
# can't see it.
ssh-reagent() {
    for agent in /tmp/ssh-*/agent.*; do
        export SSH_AUTH_SOCK=$agent
        if /usr/bin/ssh-add -l 2>&1 > /dev/null; then
            echo "Found working SSH Agent:"
            /usr/bin/ssh-add -l
            return
        fi
    done
    echo "Cannot find ssh agent - maybe you should reconnect and forward it?"
}

gvim() {
    GVIM_BIN="/usr/bin/gvim"
    GVIM_SERVER_ARGS="--servername GVIM"
    GVIM_CLIENT_ARGS="--remote-tab-silent"

    if [[ $# -lt 1 ]]; then
        "$GVIM_BIN" "$GVIM_SERVER_ARGS"
    else
        "$GVIM_BIN" "$GVIM_SERVER_ARGS" "$GVIM_CLIENT_ARGS" "$@"
    fi
}

emacs() {
    EMACS_SERVER_BIN="/usr/bin/emacs"
    EMACS_CLIENT_BIN="/usr/bin/emacsclient"

    if [[ $# -lt 1 ]]; then
        "$EMACS_SERVER_BIN"
    else
        "$EMACS_CLIENT_BIN" -a "$EMACS_SERVER_BIN" "$@"
    fi
}

# Turn on sandbox for Chromium, set CHROME_DEVEL_SANDBOX to an empty string to
# disable it
export CHROME_DEVEL_SANDBOX="$HOME/bin/chrome-linux/chrome_sandbox"
