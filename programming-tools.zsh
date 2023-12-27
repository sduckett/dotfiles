set -o allexport

NVM_DIR="$HOME/.nvm"
mkdir -p $NVM_DIR
NODE_PATHS="/usr/local/share/npm/bin:$NVM_DIR/bin"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/zsh_completion" ] && source "$NVM_DIR/zsh_completion"

JAVA_PATHS="$HOME/.jenv/bin"
eval "$(jenv init -)"

HASKELL_PATHS=$HOME/.cabal/bin

RUBY_PATHS="$HOME/.rbenv/bin"
eval "$(rbenv init -)"

PYTHONDOCS=/usr/share/doc/python2/html/
PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

source "$HOME/.cargo/env"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# TODO figure out why --smd 🖖
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# provide an path to cleanup
