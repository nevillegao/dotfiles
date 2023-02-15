# Homebrew
# Environment variables
eval "$(/opt/homebrew/bin/brew shellenv)"
# Shell completion
export FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# Python
export PATH="$HOMEBREW_PREFIX/opt/python@3.11/libexec/bin${PATH+:$PATH}"

# Netskope
export REQUESTS_CA_BUNDLE="/Library/Application Support/Netskope/STAgent/download/nscacert.pem"
