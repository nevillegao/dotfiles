# vim:ft=sh:

# Set $PATH
BIN_DIR="$HOME/bin"
if [ -d "$BIN_DIR" ]; then
    export PATH="$BIN_DIR:$PATH"
    for i in ${BIN_DIR}/*; do
        if [ -d "$i/bin" ]; then
            export PATH="$i/bin:$PATH"
        elif [ -d "$i" ]; then
            export PATH="$i:$PATH"
        fi
    done
fi
# Recursively add directories from $BIN_DIR
#test -d $BIN_DIR && export PATH="$(find -L $BIN_DIR -maxdepth 1 -type d -printf "%p:")$PATH"

# Set up SSH agent
#SSH_ENV="$HOME/.ssh/environment"

#start_agent() {
    #echo "Initialising new SSH agent..."
    #/usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    #echo "Succeeded!"
    #chmod 600 "${SSH_ENV}"
    #. "${SSH_ENV}" > /dev/null
    #/usr/bin/ssh-add
#}

# Source SSH settings, if applicable
#if [ -r "${SSH_ENV}" ]; then
    #. "${SSH_ENV}" > /dev/null
    #ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        #start_agent
    #}
#else
    #start_agent
#fi

# Enable TrackPoint
xinput --version &>/dev/null
if [[ $? -eq 0 ]]; then
    xinput --set-prop --type=int --format=8 "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
    xinput --set-prop --type=int --format=8 "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
    xinput --set-prop --type=int --format=8 "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
fi

# Load .bashrc if running bash
test -n "$BASH_VERSION" && test -r $HOME/.bashrc && . $HOME/.bashrc
