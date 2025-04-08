# Confirm before exit shell
eexit() {
    read -p "${COLOR_ERED}Exit? [y/N] ${COLOR_NO}" REPLY
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        command exit
    fi
}


# Python virtual environment
pyve() {
    VENV_DIR="${HOME}/.venv"

    while getopts "c:d:s:" opt; do
        case "$opt" in
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
