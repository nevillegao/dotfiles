# Homebrew
HOMEBREW_PREFIX="/opt/homebrew"
HOMEBREW_CELLAR="/opt/homebrew/Cellar"
HOMEBREW_REPOSITORY="/opt/homebrew"
PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

# fzf
export FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# Netskope
export REQUESTS_CA_BUNDLE="/Library/Application Support/Netskope/STAgent/download/nscacert.pem"
