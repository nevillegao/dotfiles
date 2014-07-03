# vim:ft=sh:

# When leaving the console clear the screen to increase privacy
if [[ "$SHLVL" -eq 1 ]]; then
    test -x /usr/bin/clear_console && clear_console -q
fi
