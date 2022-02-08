# Python virtual environment
venvc() {
    VENV_DIR="${HOME}/.venv"

    python3 -m venv --system-site-packages "${VENV_DIR}/$1"
}

venvs() {
    VENV_DIR="${HOME}/.venv"

    source "${VENV_DIR}/$1/bin/activate"
}

venvd() {
    VENV_DIR="${HOME}/.venv"

    rm -rf "${VENV_DIR}/$1"
}


# fzf
fe() {
    local files
    IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
    [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}
