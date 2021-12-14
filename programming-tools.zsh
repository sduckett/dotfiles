set -o allexport

##########################################
# Things for the programming toolbox     #
##########################################

PYTHONDOCS=/usr/share/doc/python2/html/
HASKELL_PATHS=$HOME/.cabal/bin
NODE_PATHS=/usr/local/share/npm/bin
DEPLOYMENT_PATHS=:/usr/local/heroku/bin

eval "$(rbenv init -)"
eval "$(jenv init -)"

NVM_DIR="$HOME/.nvm"
NVM_SRC="/usr/local/opt/nvm/nvm.sh"

mkdir -p $NVM_DIR

if [ -f  $NVM_SRC ]; then
   source $NVM_SRC
fi

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


# provide an path to cleanup
function cleanup-repos() {
    for i in $1/*; do
	pushd $i && git fetch -p
	popd
    done
}

function setup-gpg() {
    export GPG_TTY="$(tty)"
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent
}
