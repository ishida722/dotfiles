#PATH
export PATH=/usr/local/bin:/bin:/usr/bin
export PATH=~/dotfiles/bin:$PATH
export NODE_PATH=/usr/local/lib/node_modules
export JAVA_HOME='/usr/lib/jvm/java-8-oracle/jre'
export GOPATH=~/bin/go
export PATH=$PATH:$HOME/bin:$GOPATH/bin

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
