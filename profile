# vim:ft=sh:

# Set $PATH
BIN_DIR="$HOME/bin"
if [ -d "$BIN_DIR" ]; then
    export PATH="$BIN_DIR:$PATH"
    for i in "$BIN_DIR"/*; do
        if [ -d "$i/bin" ]; then
            export PATH="$i/bin:$PATH"
        elif [ -d "$i" ]; then
            export PATH="$i:$PATH"
        fi
    done
fi

# Recursively add directories from $BIN_DIR
#test -d "$BIN_DIR" && export PATH="$(find -L "$BIN_DIR" -maxdepth 1 -type d -printf "%p:")$PATH"

# Set up SSH agent
if [[ -z "$SSH_AUTH_SOCK" || -z "$SSH_AGENT_PID" ]]; then
    test -x /usr/bin/ssh-agent && eval "$(ssh-agent | sed 's/^echo/#echo/')"
    test -x /usr/bin/ssh-add && ssh-add
fi

# Enable TrackPoint
if [[ -x /usr/bin/xinput ]] && xinput --version &>/dev/null; then
    xinput --set-prop --type=int --format=8 "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
    xinput --set-prop --type=int --format=8 "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
    xinput --set-prop --type=int --format=8 "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
fi

# Load .bashrc if running bash
test -n "$BASH_VERSION" && test -r "$HOME/.bashrc" && . "$HOME/.bashrc"
