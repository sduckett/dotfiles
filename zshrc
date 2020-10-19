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
DISABLE_AUTO_UPDATE="false"
DISABLE_AUTO_TITLE=true

plugins=(lein git tmux sudo systemd)

source $ZSH/oh-my-zsh.sh
source ~/.programming-tools.zsh
source ~/.zshalias
source ~/.completions.zsh && compinit

PATH=$NODE_PATHS:$JAVA_PATHS:$DEPLOYMENT_PATHS:/usr/local/bin:$HOME/bin:$HOME/.rbenv/bin:/usr/local/opt/postgresql@9.6/bin:$HOME/.jenv/bin:$PATH


if [ -f ~/.tokens.zsh ]; then
  source ~/.tokens.zsh
fi

GPG_TTY=$(tty)
export GPG_TTY
