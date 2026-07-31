# Confirm before exit shell
eexit() {
    read "reply?${COLOR_ERED}Exit? [y/N] ${COLOR_NO}"
    if [[ $reply =~ ^[Yy]$ ]]; then
        exit
    fi
}


# Command replacement helper
alias_if_exists() {
    local alias_name=$1
    shift

    local candidate
    for candidate in "$@"; do
        # First word is the executable to test.
        local exe=${candidate%% *}

        if command -v "$exe" >/dev/null 2>&1; then
            alias "$alias_name=$candidate"
            return 0
        fi
    done

    # No alias -> falls back to the original command.
    return 1
}


# Python virtual environment
pyve() {
    VENV_DIR="${HOME}/.venv"

    while getopts "lc:d:s:" opt; do
        case "$opt" in
        l)
            ls -1 "${VENV_DIR}"
            ;;
        c)
            python3 -m venv --system-site-packages "${VENV_DIR}/$OPTARG"
            ;;
        d)
            rm -rf "${VENV_DIR}/$OPTARG"
            ;;
        s)
            source "${VENV_DIR}/$OPTARG/bin/activate"
            ;;
        esac
    done
}


# fzf
fe() {
    local files
    IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
    [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}
