# tmux always runs as a login shell, which means /etc/profile is read.
# On macOS, a utility called path_helper, which is run from /etc/profile,
# always prepends /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin to the PATH.
# The following ensures that PATH is empty before path_helper runs
if [ $(uname -s) = "Darwin" ] && [ -n "$TMUX" ] && [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi
