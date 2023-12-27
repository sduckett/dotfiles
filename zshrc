set -o allexport && setopt appendhistory autocd && bindkey -e

LC_CTYPE=en_US.UTF-8
LANG=en_US.UTF-8
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
EDITOR="emacsclient"
GIT_EDITOR=$EDITOR
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="lambda"
DISABLE_AUTO_UPDATE=false
DISABLE_MAGIC_FUNCTIONS=true
DISABLE_AUTO_TITLE=true

plugins=(lein git tmux sudo)

source $ZSH/oh-my-zsh.sh

if [ -f ~/.zshalias ]; then
    source ~/.zshalias
fi

if [ -f ~/.completions.zsh ]; then
    source ~/.completions.zsh && compinit
fi

if [ -f ~/.programming-tools.zsh ]; then
    source ~/.programming-tools.zsh
fi

if [ -f ~/.gateless.zsh ]; then
    source ~/.gateless.zsh
fi

if [ -f ~/.tokens.zsh ]; then
    source ~/.tokens.zsh
fi

if [ -f "/opt/homebrew/bin/brew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

PATH="$GATELESS_PATHS:$NODE_PATHS:$JAVA_PATHS:$RUBY_PATHS:/usr/local/sbin:/usr/local/bin:$HOME/bin:$PATH"

function setup-gpg() {
    export GPG_TTY="$(tty)"
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent
}

setup-gpg
