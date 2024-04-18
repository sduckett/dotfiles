#
# Things for the programming toolbox
#


HASKELL_PATHS=$HOME/.cabal/bin
DEPLOYMENT_PATHS=:/usr/local/heroku/bin

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
