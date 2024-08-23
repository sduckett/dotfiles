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

plugins=(docker docker-compose lein git tmux sudo systemd mise)
export DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}

source $ZSH/oh-my-zsh.sh
source ~/.programming-tools.zsh
source ~/.zshalias

autoload -U compinit; compinit

# TODO I once had some completions defined, but I've lost them now...
#source ~/.completions.zsh && compinit

if [ -f $/.programming.zsh ]; then
    source ~/.programming.zsh
fi

if [ -f ~/.zshalias ]; then
   source ~/.zshalias
fi

if [ -f ~/.completions.zsh ]; then
  source ~/.completions.zsh && compinit
fi

PATH=$NODE_PATHS:$JAVA_PATHS:$DEPLOYMENT_PATHS:$HOME/.rbenv/bin:$HOME/.jenv/bin:/usr/local/opt/postgresql@9.6/bin:$PATH
PATH=/usr/local/bin:$HOME/bin:$HOME/repos/gitlab.com/gateless/sh/bin:$PATH


if [ -f ~/.tokens.zsh ]; then
  source ~/.tokens.zsh
fi

if [ -f ~/.work.zsh ]; then
  source ~/.work.zsh
fi

PATH=$HOME/bin:$HOME/.local/bin:$HOME/repos/gitlab.com/gateless/sh/bin:$PATH

function code-artifact() {
     CODEARTIFACT_AUTH_TOKEN=`aws codeartifact get-authorization-token --domain gateless --domain-owner 546781284141 --query authorizationToken --output text`
 }

if [ -f "which code-artifact" ]; then
  code-artifact
fi

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# begin bitcar
export BITCAR_WORKSPACE_DIR="/Users/sean/repos"
export BITCAR_EDITOR_CMD="emacsclient"
source $HOME/.bitcar/cli.sh
source $HOME/.bitcar/completions.sh
# end bitcar

# #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/sean/.sdkman"
[[ -s "/Users/sean/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/sean/.sdkman/bin/sdkman-init.sh"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
