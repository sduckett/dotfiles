PATH=$PATH:/Users/smd/bin

# Configure
eval $(docker-machine env default)

alias "uplog=krak up --verbose &> kraken.log
