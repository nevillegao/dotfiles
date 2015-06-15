# vim:ft=sh:

# Recursively add directories from ${BIN_DIR}
BIN_DIR="${HOME}/bin"
#test -d "${BIN_DIR}" && export PATH="$(find -L "${BIN_DIR}" -maxdepth 1 -type d -printf "%p:")${PATH}"
if [[ -d "${BIN_DIR}" ]]; then
    export PATH="${BIN_DIR}:${PATH}"
    for i in "${BIN_DIR}"/*; do
        if [[ -d "${i}/bin" ]]; then
            export PATH="${i}/bin:${PATH}"
        elif [[ -d "${i}" ]]; then
            export PATH="${i}:${PATH}"
        fi
    done
fi

# Enable TrackPoint on laptop
DEV_NAME="TPPS/2 IBM TrackPoint"
if [[ -x /usr/bin/xinput ]] && xinput list | grep "${DEV_NAME}" &>/dev/null; then
    /usr/bin/xinput set-prop --type=int --format=8 "${DEV_NAME}" "Evdev Wheel Emulation" 1
    /usr/bin/xinput set-prop --type=int --format=8 "${DEV_NAME}" "Evdev Wheel Emulation Button" 2
    /usr/bin/xinput set-prop --type=int --format=8 "${DEV_NAME}" "Evdev Wheel Emulation Axes" 6 7 4 5
fi

# Load .bashrc if running bash
test -n "${BASH_VERSION}" && test -r "${HOME}/.bashrc" && . "${HOME}/.bashrc"
