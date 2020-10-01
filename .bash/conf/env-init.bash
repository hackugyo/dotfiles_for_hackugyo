eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# swiftenv
export SWIFTENV_ROOT="$HOME/.swiftenv"
export PATH="$SWIFTENV_ROOT/bin:$PATH"
eval "$(swiftenv init -)"

# openssl
export PATH=/usr/local/Cellar/openssl@1.1/1.1.1g/bin:$PATH
