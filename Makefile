.PHONY: dotfiles
SHELL := zsh
#.SHELLFLAGS := -eu -o pipefail -c

dotfiles = zshrc zshalias tmux.conf programming-tools completions.zsh psqlrc

init:
	export DOTS=$$HOME/src/dotfiles; cd $$HOME; ln -sf $$DOTS/zshrc .zshrc; ln -sf $$DOTS/zshalias .zshalias; ln -sf $$DOTS/programming-tools.zsh .programming-tools.zsh; ln -sf $$DOTS/tmux.conf .tmux.conf; ln -sf $$DOTS/completions.zsh .completions.zsh; ln -sf $$DOTS/psqlrc .psqlrc; source $$HOME/.zshrc

clean:
	rm $$HOME/.zshrc $$HOME/.zshalias $$HOME/.programming-tools.zsh $$HOME/.tmux.conf $$HOME/.completions.zsh $$HOME/.psqlrc
