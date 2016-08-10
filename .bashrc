#!/bin/bash

# Vi Mode Rocks
set editing-mode vi
set keymap vi
set -o vi

# Color
PS1="[\e[1;34m\u@\h:\e[0m\e[1;31m\W\e[0m]$ "

# Simple Command Prompt
# PS1="[\u@\h:\w]$ "

# Default Editor
export EDITOR="vim"

# Nav Commands
alias -- -='cd -'
alias x='exit'
alias ..='cd ..'
alias ...='..;..'

# Git Config
git config --global push.default current

# Git Commands
alias ga='git add'
alias gb='git branch'
alias gc='git commit --verbose'
alias gd='git diff --color'
alias gl='git log --color --date=iso --pretty=format:"%C(bold red) %cd%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%  %C(reset)%h %C(blue)%s %C(reset)- %an"'
alias gll='gl --no-merges master..'
alias glt='gl | grep $(date +%F)'
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

# Tmux Colors
alias tmux='tmux -2'

# Normalize OSX / Linux
if [[ "$(uname)" == "Darwin" ]]; then
  alias ls='ls -G'
  alias copy='pbcopy'
else
  alias ls='ls --color'
  alias copy='xclip -sel clip'
fi

# Keyboard Layout
setkb () {
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
