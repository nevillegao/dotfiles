# vim:ft=sh:

# Only when the shell is a login shell on a Linux console
if [[ $(tty) = /dev/tty[1-9] && $(ps -o comm= -p "${PPID}") = login ]]; then
    if [[ "${SHLVL}" -eq 1 && -x /usr/bin/clear_console ]]; then
        /usr/bin/clear_console -q
    fi
fi
