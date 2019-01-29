##########################################
# Things for the programming toolbox     #
##########################################

PYTHONDOCS=/usr/share/doc/python2/html/
JAVA_PATHS=/usr/local/jdk-1.7.0/bin
HASKELL_PATHS=$HOME/.cabal/bin
NODE_PATHS=/usr/local/share/npm/bin
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


# If you don't set [default] credentials, you'll never accidentally
# operate on the wrong one; instead, you'll have to call out which
# system you want to manage.
alias "aws-dw=aws --profile=dw"
alias "aws-smd=aws --profile=smd"

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

