# Enhanced alternatives to standard utilities
alias_if_exists "ls" \
    "eza" \
    "lsd" \
    "ls -F --color=auto"

alias_if_exists "cat" "bat --paging=never"
alias_if_exists "wc" "cw"
alias_if_exists "sed" "sd"
alias_if_exists "ps" "procs"
alias_if_exists "top" "bottom"
alias_if_exists "du" "dust"


# Standard utilities
alias ..='cd ..'
alias ...='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'

alias l='ls -l'
alias la='ls -A'
alias lla='ls -A -l'
alias lh='la -d .*(DN)'  # list hidden files
alias llh='lla -d .*(DN)'

alias rm='echo "This is not the command you are looking for. Use \`trash\` instead."; false'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep -EI --color=auto'
alias diff='diff -u --color=auto'

alias rg='rg -S'
alias lg='lazygit'


# Terminal
alias screen='screen -xR'
alias ttmux='tmux attach-session || tmux new-session -A'
alias tmtrw='tmate display-message -p "#{tmate_ssh}"'
alias tmtro='tmate display-message -p "#{tmate_ssh_ro}"'
alias emacs='emacs -nw'


# WAN IP
alias myip1='dig @resolver1.opendns.com myip.opendns.com +short'
alias myip2='dig @ns1.google.com o-o.myaddr.l.google.com TXT +short'
