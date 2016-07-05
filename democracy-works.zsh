PATH=$PATH:/Users/smd/bin

alias "uplog=krak up --verbose &> kraken.log"
alias "figgywheel=cd ~/dw/turbovote-web && rlwrap lein do clean, figwheel"
alias "cleanup-repos=cd /Users/smd/dw; for i in *; do cd $i && git fetch -p && cd -; done"
