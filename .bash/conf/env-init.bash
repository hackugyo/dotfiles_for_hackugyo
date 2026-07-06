# 対話シェルではmiseのフックも動かす。
eval "$(mise activate zsh)"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# swiftenv
# export SWIFTENV_ROOT="$HOME/.swiftenv"
# export PATH="$SWIFTENV_ROOT/bin:$PATH"
# eval "$(swiftenv init -)"

# openssl
export PATH=/usr/local/Cellar/openssl@1.1/1.1.1g/bin:$PATH

# stdio.h
export SDKROOT="$(xcrun --sdk macosx --show-sdk-path)"

# sbin
export PATH="/usr/local/sbin:$PATH"

# Ruby
#export PATH="/usr/local/opt/ruby/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/ruby/lib"
#export LDFLAGS="-L/usr/local/opt/readline/lib"
# export CPPFLAGS="-I/usr/local/opt/ruby/include"
#export CPPFLAGS="-I/usr/local/opt/readline/include"
# export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
#export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig/"

#export RUBY_CFLAGS="-w"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

