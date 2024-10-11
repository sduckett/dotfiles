set -o allexport && setopt appendhistory autocd && bindkey -e

LC_CTYPE=en_US.UTF-8
LANG=en_US.UTF-8
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
EDITOR="emacsclient -t"
GIT_EDITOR=$EDITOR
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="lambda"
DISABLE_AUTO_UPDATE=false
DISABLE_UPDATE_PROMPT=false
DISABLE_AUTO_TITLE=true
ZSH_DISABLE_COMPFIX=false
# See discussion of double-paste problem here:
# https://github.com/ohmyzsh/ohmyzsh/issues/9562
DISABLE_MAGIC_FUNCTIONS=true

plugins=(docker docker-compose git tmux sudo systemd mise)

source $ZSH/oh-my-zsh.sh

if [ -f $/.programming.zsh ]; then
    source ~/.programming.zsh
fi

if [ -f ~/.zshalias ]; then
   source ~/.zshalias
fi

if [ -f ~/.completions.zsh ]; then
  source ~/.completions.zsh && compinit
fi

if [ -f ~/.tokens.zsh ]; then
  source ~/.tokens.zsh
fi

PATH=$HOME/bin:$HOME/.local/bin:$PATH

GPG_TTY=$(tty)
export GPG_TTY
