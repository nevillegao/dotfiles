# # Check if not in an interactive shell and don't do anything
# [[ $- != *i* ]] && return


# Check if in an interactive shell and disable XON/XOFF flow control
[[ $- == *i* ]] && stty -ixon


# Check the window size after each command and, if necessary, update the
# values of LINES and COLUMNS
shopt -s checkwinsize


# Load various rc files
RC_FILES=(
    "${HOME}/.bash.d/colors"
    "${HOME}/.bash.d/alias"
    "${HOME}/.bash.d/functions"
)

for rc_file in "${RC_FILES[@]}"; do
    [[ -r "${rc_file}" ]] && . "${rc_file}"
done


# Type Ctrl-D 100 times to exit shell to prevent accidental exiting
IGNOREEOF=100


# Confirm before exit shell
eexit() {
    read -p "${COLOR_ERED}Exit? [y/N] ${COLOR_NO}" REPLY
    if [[ "${REPLY}" =~ ^[Yy]$ ]]; then
        command exit
    fi
}


# History options
shopt -s histappend
HISTCONTROL=ignoredups:erasedups
HISTSIZE=100000
# HISTFILE="${HOME}/.bash_eternal_history"
HISTFILESIZE=1000000
HISTTIMEFORMAT="%F %T "
PROMPT_COMMAND="history -a; history -c; history -r; ${PROMPT_COMMAND:+$PROMPT_COMMAND}"


# Utilities options
export MANPAGER='less -s -M +Gg'
export VISUAL="$(which vim)"
export EDITOR="${VISUAL}"


# Color setup for 'ls'
[[ -x /usr/bin/dircolors ]] && eval "$(dircolors -b)"


# 'less' options
export LESS="-MiR"

# Make 'less' more friendly for non-text input files
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

# 'less' colors for man pages
export LESS_TERMCAP_mb=$(echo -ne "\e[01;31m")     # start blinking
export LESS_TERMCAP_md=$(echo -ne "\e[01;31m")     # start bold mode
export LESS_TERMCAP_me=$(echo -ne "\e[0m")         # end all mode like so, us, mb, md, and mr
export LESS_TERMCAP_so=$(echo -ne "\e[01;44;33m")  # start standout mode
export LESS_TERMCAP_se=$(echo -ne "\e[0m")         # end standout mode
export LESS_TERMCAP_us=$(echo -ne "\e[04;32m")     # start underlining
export LESS_TERMCAP_ue=$(echo -ne "\e[0m")         # end underlining


# Enable Bash completion
BASH_COMPLETION=/etc/bash_completion
[[ -r "${BASH_COMPLETION}" ]] && . "${BASH_COMPLETION}"


# Enable Pinyin completion
PINYIN_COMPLETION="${HOME}/.bash-completion-pinyin/chs_completion"
[[ -r "${PINYIN_COMPLETION}" ]] && . "${PINYIN_COMPLETION}"


# Python startup script
export PYTHONSTARTUP="${HOME}/.pythonrc"


# Load third party scripts
PLUGINS=(
    "${HOME}/.fzf/completion.bash"
    "${HOME}/.fzf/key-bindings.bash"
    "/usr/share/autojump/autojump.sh"
)

for plugin in "${PLUGINS[@]}"; do
    [[ -r "${plugin}" ]] && . "${plugin}"
done


# Terminal prompt string & title
case "${TERM}" in
    screen*)
        update_title() {
            # Ignore git-prompt
            if [[ $1 =~ "setGitPrompt" || $1 =~ "__git_ps1" ]]; then
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
        PROMPT_TIME_ENABLED=1
        PROMPT_HOST_ENABLED=1

        PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }"'echo -ne "\e]0;${PWD/${HOME}/\~}\a"'
        ;;
esac

PROMPT_USER_ENABLED=1
PROMPT_PATH_ENABLED=1

PROMPT_TIME="${PROMPT_TIME_ENABLED:+\[${COLOR_EBLUE}\][\A]\[${COLOR_NO}\]}"
PROMPT_USER="${PROMPT_USER_ENABLED:+\[${COLOR_ECYAN}\][\u\[${COLOR_NO}\]}"
PROMPT_HOST="${PROMPT_HOST_ENABLED:+\[${COLOR_NO}\]@\[${COLOR_EMAGENTA}\]${HOSTNAME%%.*}\[${COLOR_NO}\]}"
PROMPT_PATH="${PROMPT_PATH_ENABLED:+\[${COLOR_NO}\]:\[${COLOR_EYELLOW}\]\W]\[${COLOR_NO}\]}"

PROMPT_STR="${PROMPT_TIME}${PROMPT_USER}${PROMPT_HOST}${PROMPT_PATH}"
PS1="${PROMPT_STR}\\\$ "


# Python virtual environment prompt
virtualenv_info() {
    [[ -n "${VIRTUAL_ENV}" ]] && echo "(venv:${VIRTUAL_ENV##*/}) "
}

export VIRTUAL_ENV_DISABLE_PROMPT=1
PS1="\$(virtualenv_info)${PS1}"


# Third party git prompt
if [[ -e "${HOME}/.bash-git-prompt/gitprompt.sh" ]]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    GIT_PROMPT_FETCH_REMOTE_STATUS=0
    GIT_PROMPT_THEME=Custom

    . "${HOME}/.bash-git-prompt/gitprompt.sh"

# Built-in git prompt
elif [[ -e /usr/lib/git-core/git-sh-prompt ]]; then
    GIT_PS1_SHOWDIRTYSTATE=1
    GIT_PS1_SHOWSTASHSTATE=1
    GIT_PS1_SHOWUNTRACKEDFILES=1
    GIT_PS1_SHOWUPSTREAM="auto"
    GIT_PS1_DESCRIBE_STYLE="default"
    GIT_PS1_SHOWCOLORHINTS=1
    GIT_PS1_HIDE_IF_PWD_IGNORED=1

    PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }"'__git_ps1 "${PROMPT_STR}" "\\\$ "'

    . /usr/lib/git-core/git-sh-prompt
fi
