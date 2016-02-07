set -o allexport
setopt appendhistory autocd
bindkey -e

LC_CTYPE=en_US.UTF-8
LANG=en_US.UTF-8
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
EDITOR="emacsclient -t"

# I have a few completions that might be useful
source ~/.completions.zsh
compinit

# Oh My Zsh interupts your shell environment
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="darkblood"
DISABLE_AUTO_UPDATE="false"
plugins=(git git-extras archlinux ruby gpg-agent lein sudo systemd)

source $ZSH/oh-my-zsh.sh
source ~/.democracy-works.zsh
source ~/.programming-tools.zsh
source ~/.zshalias



PATH=$PATH:$NODE_PATHS:$JAVA_PATHS:$DEPLOYMENT_PATHS:/usr/local/bin:/home/smd/bin
