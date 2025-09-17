# Built-in
alias ..='cd ..'
alias ...='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'

alias ls='ls -F -G'
alias l='ls -l'
alias la='ls -A'
alias lh='la -d .*'  # list hidden files
alias llh='la -ld .*'

alias rm='echo "This is not the command you are looking for. Use \`trash\` instead."; false'  # fallback: \rm
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep -EI --color=always'
alias diff='diff -u --color=always'

alias rg='rg -S'

# WAN IP
alias myip1='dig @resolver1.opendns.com myip.opendns.com +short'
alias myip2='dig @ns1.google.com o-o.myaddr.l.google.com TXT +short'

# Terminal
alias screen='screen -xR'
alias ttmux='tmux attach-session || tmux new-session -A'
alias tmtrw='tmate display-message -p "#{tmate_ssh}"'
alias tmtro='tmate display-message -p "#{tmate_ssh_ro}"'
alias emacs='emacs -nw'
