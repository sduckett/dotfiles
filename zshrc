set -o allexport
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd
bindkey -e

# Completions
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/smd/.zshrc'

autoload -Uz compinit
compinit

# Basic settings.
# I'm using oh-my-zsh by Robby Russell.
LC_CTYPE=en_US.UTF-8
LANG=en_US.UTF-8
PYTHONDOCS=/usr/share/doc/python2/html/
EDITOR="emacsclient -t"
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="darkblood"
DISABLE_AUTO_UPDATE="true"
plugins=(git git-extras archlinux ruby chucknorris gpg-agent lein lol sudo systemd)


[[ $EMACS = t ]] && unsetopt zle
source $ZSH/oh-my-zsh.sh
source ~/.zshalias

JAVA_PATHS=/usr/local/jdk-1.7.0/bin
HASKELL_PATHS=$HOME/.cabal/bin
NODE_PATHS=/usr/local/share/npm/bin
DEPLOYMENT_PATHS=:/usr/local/heroku/bin

PATH=$PATH:$NODE_PATHS:$JAVA_PATHS:$DEPLOYMENT_PATHS:/usr/local/bin:/home/smd/bin
