# Homebrew
# Environment variables
eval "$(/opt/homebrew/bin/brew shellenv)"
# Shell completion
export FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# Netskope
export REQUESTS_CA_BUNDLE="/Library/Application Support/Netskope/STAgent/download/nscacert.pem"
