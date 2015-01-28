# If not running interactively, don't do anything
test -z "${PS1}" && return

# Check the window size after each command and, if necessary, update the
# values of LINES and COLUMNS
shopt -s checkwinsize

# Make 'less' more friendly for non-text input files
test -x /usr/bin/lesspipe && eval "$(SHELL=/bin/sh lesspipe)"

# Load various rc files
test -f "${HOME}/.colors" && . "${HOME}/.colors"
test -f "${HOME}/.alias" && . "${HOME}/.alias"

# Enable programmable completion
test -f /etc/bash_completion && . /etc/bash_completion
test -f "${HOME}/bin/chs_completion" && . "${HOME}/bin/chs_completion"

# Color setup for 'ls'
test -x /usr/bin/dircolors && eval "$(dircolors -b)"

# Terminal title
export PS1="\[${ECYAN}\][\u\[${NO_COLOR}\]:\[${EYELLOW}\]\W]\[${NO_COLOR}\]$ "
case "${TERM}" in
    xterm*|rxvt*)
        export PROMPT_COMMAND='echo -ne "\e]0;$(ppwd)\007"'
        ;;
    screen*)
        export PROMPT_COMMAND='echo -ne "\ek$(ppwd)\e\\"'
        ;;
    *)
        export PS1="\[${EMAGENTA}\][\A]${PS1}"
        ;;
esac

# Terminal color
if [[ -n "${DISPLAY}" && -r /usr/share/terminfo/x/xterm+256color ]]; then
    if [[ "${TERM}" =~ 'xterm' ]]; then
        export TERM='xterm-256color'
    elif [[ "${TERM}" =~ 'screen' ]]; then
        export TERM='screen-256color'
    fi
fi

# Utilities options
export PYTHONSTARTUP="${HOME}/.pythonstartup"
export GREP_OPTIONS='--color=auto -I --exclude-dir=.svn --exclude=*.po'
export LESS='-M -i -R'

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
export PROMPT_COMMAND="history -a; history -c; history -r; ${PROMPT_COMMAND}"

# Type Ctrl-d 100 times to exit shell to prevent accidental exiting
export IGNOREEOF=100

# Custom variables
export EDITOR='/usr/bin/vim'
export GROUP=$(id -gn)

gvim() {
    GVIM_BIN='/usr/bin/gvim'
    GVIM_SERVER_ARGS='--servername GVIM'
    GVIM_CLIENT_ARGS='--remote-tab-silent'

    if [[ $# -lt 1 ]]; then
        "${GVIM_BIN}" "${GVIM_SERVER_ARGS}"
    else
        "${GVIM_BIN}" "${GVIM_SERVER_ARGS}" "${GVIM_CLIENT_ARGS}" "$@"
    fi
}

emacs() {
    EMACS_SERVER_BIN='/usr/bin/emacs'
    EMACS_CLIENT_BIN='/usr/bin/emacsclient'

    if [[ $# -lt 1 ]]; then
        "${EMACS_SERVER_BIN}"
    else
        "${EMACS_CLIENT_BIN}" -a "${EMACS_SERVER_BIN}" "$@"
    fi
}

# Turn on sandbox for Chromium, set CHROME_DEVEL_SANDBOX to an empty string to
# disable it
export CHROME_DEVEL_SANDBOX="${HOME}/bin/chrome-linux/chrome_sandbox"
