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

PATH=$PATH:$NODE_PATHS:$JAVA_PATHS:$DEPLOYMENT_PATHS:/usr/local/bin:$HOME/bin:$HOME/.rbenv/bin:~/.cabal/bin:$PATH
eval "$(rbenv init -)"

if [ -f ~/.tokens.zsh ]; then
  source ~/.tokens.zsh
fi

# if [ -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)" ]; then
#   source ~/.gnupg/.gpg-agent-info
#   export GPG_AGENT_INFO
# else
#   eval $(gpg-agent --quiet --daemon ~/.gnupg/.gpg-agent-info)
# fi

GPG_TTY=$(tty)
export GPG_TTY

mkdir -p ~/.nvm
export NVM_DIR="$HOME/.nvm"
export NVM_SRC="/usr/local/opt/nvm/nvm.sh"
if [ -f  $NVM_SRC ]; then
   source $NVM_SRC
fi

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/Cellar/terraform/0.11.11/bin/terraform terraform
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi
