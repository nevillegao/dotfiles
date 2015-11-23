# If not running interactively, don't do anything
test -z "${PS1}" && exit

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
case "${TERM}" in
    xterm*|rxvt*)
        export PS1="\[${ECYAN}\][\u${NO_COLOR}@${EMAGENTA}${HOSTNAME%%.*}\[${NO_COLOR}\]:\[${EYELLOW}\]\W]\[${NO_COLOR}\]$ "
        export PROMPT_COMMAND='echo -ne "\e]0;${PWD/$HOME/\~}\a"'
        ;;
    screen*)
        export PS1="\[${ECYAN}\][\u\[${NO_COLOR}\]:\[${EYELLOW}\]\W]\[${NO_COLOR}\]$ "
        update_title() { printf "\e]0;%s\e\\" "$1"; }

        if [[ -n ${TMUX} ]]; then
            export PROMPT_COMMAND='echo -ne "\ek${USER}@${HOSTNAME%%/*}:${PWD/$HOME/\~}\e\\"; update_title ${PWD/$HOME/\~}'
        else
            export PROMPT_COMMAND='echo -ne "\ek${PWD/$HOME/\~}\e\\"; update_title ${PWD/$HOME/\~}'
        fi

        trap 'update_title "${BASH_COMMAND}"' DEBUG
        ;;
    *)
        export PS1="\[${EMAGENTA}\][\A]${PS1}"
        ;;
esac

# Utilities options
export EDITOR="/usr/bin/vim"
export PYTHONSTARTUP="${HOME}/.pythonrc"
export LESS="-MiR"

# Less colors for man pages
export LESS_TERMCAP_mb=$(echo -ne "\e[01;31m")     # start blinking
export LESS_TERMCAP_md=$(echo -ne "\e[01;31m")     # start bold mode
export LESS_TERMCAP_so=$(echo -ne "\e[01;44;33m")  # start standout mode
export LESS_TERMCAP_se=$(echo -ne "\e[0m")         # end standout mode
export LESS_TERMCAP_us=$(echo -ne "\e[04;32m")     # start underlining
export LESS_TERMCAP_ue=$(echo -ne "\e[0m")         # end underlining
export LESS_TERMCAP_me=$(echo -ne "\e[0m")         # end all mode like so, us, mb, md, and mr

# History options
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=65535
export HISTFILESIZE=1024000
export HISTTIMEFORMAT="%F %T "
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; ${PROMPT_COMMAND}"

# Type Ctrl-d 100 times to exit shell to prevent accidental exiting
export IGNOREEOF=100

# Turn on sandbox for Chromium, set CHROME_DEVEL_SANDBOX to an empty string to
# disable it
export CHROME_DEVEL_SANDBOX="${HOME}/bin/chrome-linux/chrome_sandbox"
