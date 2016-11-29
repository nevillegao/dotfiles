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

# Enable ThinkPad TrackPoint
TRACK_POINT_NAME="TPPS/2 IBM TrackPoint"
if [[ -n "${DISPLAY}" && -x /usr/bin/xinput ]] && /usr/bin/xinput list | grep "${TRACK_POINT_NAME}" &> /dev/null; then
    /usr/bin/xinput set-prop --type=int --format=8 "${TRACK_POINT_NAME}" "Evdev Wheel Emulation" 1
    /usr/bin/xinput set-prop --type=int --format=8 "${TRACK_POINT_NAME}" "Evdev Wheel Emulation Button" 2
    /usr/bin/xinput set-prop --type=int --format=8 "${TRACK_POINT_NAME}" "Evdev Wheel Emulation Axes" 6 7 4 5
fi

# Disable ThinkPad TouchPad
TOUCH_PAD_NAME="SynPS/2 Synaptics TouchPad"
if [[ -n "${DISPLAY}" && -x /usr/bin/xinput ]] && /usr/bin/xinput list | grep "${TOUCH_PAD_NAME}" &> /dev/null; then
    /usr/bin/xinput --disable "${TOUCH_PAD_NAME}"
fi

# Enable 'Num Lock'
if [[ -x /usr/bin/numlockx ]]; then
    /usr/bin/numlockx on
fi

# Load .bashrc
test -r "${HOME}/.bashrc" && . "${HOME}/.bashrc"
