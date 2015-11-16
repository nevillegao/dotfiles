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
test -f "${HOME}/bin/bash-completion-pinyin/chs_completion" && \
. "${HOME}/bin/bash-completion-pinyin/chs_completion"

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

# Utilities options
export PYTHONSTARTUP="${HOME}/.pythonrc"
export LESS="-M -i -R"

# Less colors for man pages
export GROFF_NO_SGR="yes"               # enable manpage color
export LESS_TERMCAP_mb=$'\E[01;31m'     # enter blink mode
export LESS_TERMCAP_md=$'\E[01;31m'     # enter bold mode
export LESS_TERMCAP_me=$'\E[0m'         # exit attribute mode
export LESS_TERMCAP_so=$'\E[01;44;33m'  # enter standout-mode
export LESS_TERMCAP_se=$'\E[0m'         # exit standout mode
export LESS_TERMCAP_us=$'\E[01;32m'     # enter underline mode
export LESS_TERMCAP_ue=$'\E[0m'         # exit underline mode

# History options
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=65535
export HISTFILESIZE=1024000
export HISTTIMEFORMAT="%F %T "
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; ${PROMPT_COMMAND}"

# Type Ctrl-d 100 times to exit shell to prevent accidental exiting
export IGNOREEOF=100

# Custom variables
export EDITOR="/usr/bin/vim"
export GROUP=$(id -gn)

# Turn on sandbox for Chromium, set CHROME_DEVEL_SANDBOX to an empty string to
# disable it
export CHROME_DEVEL_SANDBOX="${HOME}/bin/chrome-linux/chrome_sandbox"
