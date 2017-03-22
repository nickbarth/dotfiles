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
# complete -W "`grep ^Host ~/.ssh/config | awk '{print $2}' | xargs`" ssh
alias -- -='cd -'
alias x='exit'
alias ..='cd ..'

# Git Config
git config --global push.default current

# Git Commands
alias ga='git add'
alias gb='git branch'
alias gc='git commit --verbose'
alias gd='git diff --color'
alias gl='git log --color --date=iso --pretty=format:"%C(bold red) %cd%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%  %C(reset)%C(bold cyan)%h %C(reset)%C(blue)%s %C(reset)- %an"'
alias gg='git log --color --date=iso --graph  --pretty=format:"%C(bold red) %cd%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%  %C(reset)%C(bold cyan)%h %C(reset)%C(blue)%s %C(reset)- %an"'
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

# default params
alias tmux='tmux -2'
alias ls='ls -G'

# Bash History
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend

# z
. ~/z/z.sh

# go lang
# export GOROOT=/usr/local/opt/go/libexec
# export GOPATH=$HOME/.go
# export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# python virtualenv
# export WORKON_HOME=~/virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh

# node
# export PATH=./node_modules/.bin:$PATH