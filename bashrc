# Check the window size after each command and, if necessary, update the
# values of LINES and COLUMNS
shopt -s checkwinsize

# Check if in an interactive shell and disable XON/XOFF flow control
[[ $- == *i* ]] && stty -ixon

# Load various rc files
test -r "${HOME}/.colors" && . "${HOME}/.colors"
test -r "${HOME}/.alias" && . "${HOME}/.alias"

# Enable programmable completion
test -r /etc/bash_completion && . /etc/bash_completion

if [[ -e "${HOME}/.bash-completion-pinyin/chs_completion" ]]; then
    . "${HOME}/.bash-completion-pinyin/chs_completion"
fi

# Enable 'autojump'
test -r /usr/share/autojump/autojump.sh && . /usr/share/autojump/autojump.sh

# Terminal prompt string & title
case "${TERM}" in
    screen*)
        update_title() {
            # Ignore git-prompt
            if [[ $1 =~ "__git_ps1" || $1 =~ "setGitPrompt" ]]; then
                return
            fi

            printf "\e]0;%s\e\\" "$1";
        }

        if [[ -n "${TMUX}" ]]; then
            PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }"'echo -ne "\ek${USER}@${HOSTNAME%%/*}:${PWD/${HOME}/\~}\e\\"; update_title ${PWD/${HOME}/\~}'

            trap 'update_title "${BASH_COMMAND}"' DEBUG
        else
            PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }"'echo -ne "\ek${PWD/${HOME}/\~}\e\\"'
        fi
        ;;
    *)
        PROMPT_HOST_ENABLE=1
        PROMPT_TIME_ENABLE=1

        PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }"'echo -ne "\e]0;${PWD/${HOME}/\~}\a"'
        ;;
esac

PROMPT_USER="\[${COLOR_ECYAN}\][\u\[${COLOR_NO}\]"
PROMPT_HOST="${PROMPT_HOST_ENABLE:+\[${COLOR_NO}\]@\[${COLOR_EMAGENTA}\]${HOSTNAME%%.*}\[${COLOR_NO}\]}"
PROMPT_PATH="\[${COLOR_NO}\]:\[${COLOR_EYELLOW}\]\W]\[${COLOR_NO}\]"
PROMPT_TIME="${PROMPT_TIME_ENABLE:+\[${COLOR_EBLUE}\][\A]\[${COLOR_NO}\]}"
PROMPT_STR="${PROMPT_TIME}${PROMPT_USER}${PROMPT_HOST}${PROMPT_PATH}"

PS1="${PROMPT_STR}${PROMPT_GIT}\\\$ "

# Enable third party git prompt
if [[ -e "${HOME}/.bash-git-prompt/gitprompt.sh" ]]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    GIT_PROMPT_FETCH_REMOTE_STATUS=0
    GIT_PROMPT_THEME=Custom

    . "${HOME}/.bash-git-prompt/gitprompt.sh"

# Enable built-in git prompt
elif [[ -e /usr/lib/git-core/git-sh-prompt ]]; then
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWUPSTREAM="verbose"
    GIT_PS1_DESCRIBE_STYLE="branch"
    GIT_PS1_SHOWCOLORHINTS=1
    GIT_PS1_HIDE_IF_PWD_IGNORED=1

    PROMPT_GIT="\[${COLOR_ERED}\]\$(__git_ps1 ' (%s)')\[${COLOR_NO}\]"

    if [[ -n "${GIT_PS1_SHOWCOLORHINTS}" ]]; then
        PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }"'__git_ps1 "${PROMPT_STR}" "\\\$ "'
    fi

    . /usr/lib/git-core/git-sh-prompt
fi

# History options
HISTCONTROL=ignoredups:erasedups
HISTSIZE=65535
HISTFILESIZE=1024000
HISTTIMEFORMAT="%F %T "
shopt -s histappend
PROMPT_COMMAND="history -a; history -c; history -r; ${PROMPT_COMMAND:+$PROMPT_COMMAND}"

# Type Ctrl-d 100 times to exit shell to prevent accidental exiting
IGNOREEOF=100

# Color setup for 'ls'
test -x /usr/bin/dircolors && eval "$(dircolors -b)"

# Utilities options
export VISUAL="$(which vim)"
export EDITOR="${VISUAL}"
export PYTHONSTARTUP="${HOME}/.pythonrc"
export LESS="-MiR"

# Make 'less' more friendly for non-text input files
test -x /usr/bin/lesspipe && eval "$(SHELL=/bin/sh lesspipe)"

# 'less' colors for man pages
export LESS_TERMCAP_mb=$(echo -ne "\e[01;31m")     # start blinking
export LESS_TERMCAP_md=$(echo -ne "\e[01;31m")     # start bold mode
export LESS_TERMCAP_me=$(echo -ne "\e[0m")         # end all mode like so, us, mb, md, and mr
export LESS_TERMCAP_so=$(echo -ne "\e[01;44;33m")  # start standout mode
export LESS_TERMCAP_se=$(echo -ne "\e[0m")         # end standout mode
export LESS_TERMCAP_us=$(echo -ne "\e[04;32m")     # start underlining
export LESS_TERMCAP_ue=$(echo -ne "\e[0m")         # end underlining

# Turn on sandbox for Chromium, set CHROME_DEVEL_SANDBOX to an empty string to
# disable it
export CHROME_DEVEL_SANDBOX="${HOME}/bin/chrome-linux/chrome_sandbox"

# Confirm before exit shell
eexit() {
    read -p "${COLOR_ERED}Exit? ${COLOR_NO}" REPLY
    if [[ "${REPLY}" =~ ^[Yy]$ ]]; then
        command exit
    fi
}

venv() {
    VENV_DIR="${HOME}/venv"

    source "${VENV_DIR}/$1/bin/activate"
}
