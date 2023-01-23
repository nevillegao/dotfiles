# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Python
export PATH="$HOMEBREW_PREFIX/opt/python@3.11/libexec/bin${PATH+:$PATH}"

# Netskope
export REQUESTS_CA_BUNDLE="/Library/Application Support/Netskope/STAgent/download/nscacert.pem"
