set -o allexport && setopt appendhistory autocd && bindkey -e

LC_CTYPE=en_US.UTF-8
LANG=en_US.UTF-8
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
EDITOR="emacsclient -t"
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="miloshadzic"
DISABLE_AUTO_UPDATE="false"
plugins=(lein git tmux sudo systemd)

source $ZSH/oh-my-zsh.sh
source ~/.vip.zsh
source ~/.democracy-works.zsh
source ~/.programming-tools.zsh
source ~/.zshalias
source ~/.completions.zsh && compinit

PATH=$PATH:$NODE_PATHS:$JAVA_PATHS:$DEPLOYMENT_PATHS:/usr/local/bin:$HOME/smd/bin:$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"
if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
  source ~/.gnupg/.gpg-agent-info
  export GPG_AGENT_INFO
else
  eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi
