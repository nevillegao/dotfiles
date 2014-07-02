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
SSH_ENV="$HOME/.ssh/environment"

start_agent() {
    echo "Initializing new SSH agent..."

    if [[ -x /usr/bin/ssh-agent ]]; then
        ssh-agent | sed 's/^echo/#echo/' > "$SSH_ENV"
        echo "Succeeded!"
    fi

    chmod 600 "$SSH_ENV"
    . "$SSH_ENV" > /dev/null

    test -x /usr/bin/ssh-add && ssh-add
}

# Source SSH settings, if applicable
if [[ -r "$SSH_ENV" ]]; then
    . "$SSH_ENV" > /dev/null
    ps -ef | grep "$SSH_AGENT_PID" | grep ssh-agent$ &>/dev/null || {
        start_agent
    }
else
    start_agent
fi

# Enable TrackPoint
if [[ -x /usr/bin/xinput ]] && xinput --version &>/dev/null; then
    xinput --set-prop --type=int --format=8 "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
    xinput --set-prop --type=int --format=8 "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
    xinput --set-prop --type=int --format=8 "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
fi

# Load .bashrc if running bash
test -n "$BASH_VERSION" && test -r "$HOME/.bashrc" && . "$HOME/.bashrc"
