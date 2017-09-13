# Dotfiles

What do I like when I setup a fancy new computer system for writing software?

## check-deps

There should be a self-contained, portable executable that runs on a basic Unix-type machine without doing anything.

### Basic Dependencies

We've got to have at least some basic tools to get the job done. There are many out there, but these are mine.  Until this list is seven, plus or minus seven, it is not complete.

1. git
1. tmux
1. emacs
1. zsh

### Fancy Dependencies

Sometimes you get a Macintosh computer and your organization likes special software.

1. Zoom
1. Slack
1. 

## setup

There should be a self-contained, portable executable that - maybe if dependencies, maybe if not - does the symlink stuff that would be need to be done if cloning the repo and trying to use the tools they configure.

## How to Start

1. Clone this repository
1. Run `check-deps` and see what it tells you
1. Run `setup`
1. Take the rest of the day off!

## Tmux Plugins

There is a git submodule for tpm. Run `git submodule init` to clone the repository, then make a symlink: ln -sf dotfiles-dir/tpm ~/.tmux/plugins/tpm
Once you get the symlink garbage sorted out, reload your tmux configuration `tmux source-file ~/.tmux.conf`
