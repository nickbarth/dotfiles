#!/bin/bash

# Vi Mode Rocks
set editing-mode vi
set keymap vi
set -o vi

# Color
PS1="[\e[1;34m\u@\h:\e[0m\e[1;31m\w\e[0m]$ "

# Simple Command Prompt
# PS1="[\u@\h:\w]$ "

# Default Editor
export EDITOR="vim"

# Update Dotfiles
alias dots='cd ~ && git fetch origin master && git reset --hard origin/master && git submodule update --init --recursive && cd -'

# IP
alias getip='curl ip.appspot.com'

# Git Commands
alias ga='git add'
alias gb='git branch'
alias gc='git commit --verbose'
alias gd='git diff --color'
alias gl='git log --color --date=iso --pretty=format:"%C(bold red) %cd%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%  %C(reset)%h %C(blue)%s %C(reset)- %an"'
alias gll='git log --color'
alias gu='git pull --rebase'
alias guo='git pull --rebase -u origin master:master'
alias gm='git merge'
alias gco='git checkout'
alias gp='git push'
alias gpo='git push -u origin master:master'
alias gr='git reset --hard HEAD; git clean -fd'
alias gs='git status -sb'
alias gt='git ls-tree master -r --name-only .'
alias gh='alias | grep git'

# Binaries
export PATH=/usr/local/bin/:$PATH

# Tmux Colors
alias tmux='tmux -2'

# Tmux Commands
alias xa='tmux a -t'
alias xh='alias | grep tmux'
alias xl='tmux ls'
alias xn='tmux new'
alias xx='[ $TMUX ] && echo "TMUX ON" || echo "TMUX OFF"'

# Normalize OSX / Linux
if [[ "$(uname)" == "Darwin" ]]; then
  alias ls='ls -G'
  alias copy='pbcopy'
else
  alias ls='ls --color'
  alias copy='xclip -sel clip'
fi

# Keyboard Layout
kk () {
  if [[ "$DISPLAY" ]]; then
    setxkbmap -layout us
    xmodmap ~/.xmodmap
    echo "Updated Keyboard Layout"
  fi
}

# Bash History
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend

# z
. ~/z/z.sh

# Always TMUX No Root
if [[ -z "$TMUX" ]] && [[ $EUID -ne 0 ]]; then
  tmux new
fi

export PATH=/usr/local/bin:$PATH
