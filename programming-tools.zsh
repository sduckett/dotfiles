#
# Things for the programming toolbox
#


HASKELL_PATHS=$HOME/.cabal/bin
DEPLOYMENT_PATHS=:/usr/local/heroku/bin

eval "$(rbenv init -)"
eval "$(jenv init -)"
# export PYENV_ROOT="$HOME/.pyenv"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# https://mise.jdx.dev/getting-started.html
eval "$(mise activate zsh)"

export NVM_DIR="$HOME/.nvm"
mkdir -p $NVM_DIR
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

function dirty-repos() {
    for gitprojpath in `find . -type d -name .git | sed "s/\/\.git//"`; do
        pushd . >/dev/null

        cd $gitprojpath

        isdirty=$(git status -s | grep "^.*")

        if [ -n "$isdirty" ]; then
            echo "DIRTY:" $gitprojpath
        fi

        popd >/dev/null
    done
}

function run-hasktags() {
  hasktags --ignore-close-implementation --etags .
}

function cleanup-repos() {
    for i in $1/*; do
	pushd $i && git fetch -p
	popd
    done
}

# It can be nice to wipe out old Docker images without using the GUI 🚮
function stale-images() {
    docker images | grep '<none>' | tr -s ' ' | cut -d ' ' -f 3
}

function rm-stale-images() {
    docker rmi `stale-images`
}
