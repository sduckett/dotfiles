# Completions
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/smd/.zshrc'

autoload -Uz compinit
