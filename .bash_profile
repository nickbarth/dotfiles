#!/bin/bash

# vi rocks
export EDITOR="vim"
set editing-mode vi
set keymap vi
set -o vi

# color
export CLICOLOR=1
export TERM=xterm-256color

# command prompt
PS1="[\e[1;34m\u@\h:\e[0m\e[1;31m\W\e[0m]$ "
# PS1="[\u@\h:\w]$ "

# nav
alias -- -='cd -'
alias x='exit'
alias ..='cd ..'

# git config
git config --global push.default current

# git commands
alias ga='git add'
alias gb='git branch'
alias gc='git commit --verbose'
alias gd='git diff --color'
alias gdc='git diff --color --cached'
alias gds='git diff --color --staged'
alias gl='git log --color --date=iso --pretty=format:"%C(bold red) %cd%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%  %C(reset)%C(bold cyan)%h %C(reset)%C(blue)%s %C(reset)- %an"'
alias gg='git log --color --date=iso --graph  --pretty=format:"%C(bold red) %cd%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%  %C(reset)%C(bold cyan)%h %C(reset)%C(blue)%s %C(reset)- %an"'
alias gll='gl --no-merges master..'
alias glt='gl | grep $(date +%F)'
alias gu='git pull --rebase'
alias guo='git pull --rebase -u origin master:master'
alias gm='git merge'
alias gco='git checkout'
alias gp='git pull --rebase && git push'
alias gpo='git push -u origin master:master'
alias gr='git reset --hard HEAD; git clean -fd'
alias gs='git status -sb'
alias gt='git ls-tree master -r --name-only .'
alias gh='alias | grep git'
alias upstream='git branch --set-upstream-to=origin/`git symbolic-ref --short HEAD` `git symbolic-ref --short HEAD`'

gfb() { git fetch && git checkout --track -b $1 origin/$1; } # git fetch branch
gss() { git show HEAD~${1:-0}; } # git show commit

# default params
alias tmux='tmux -2'
alias ls='ls -G'

# Bash History
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
alias z='j'

# fzf
# https://github.com/atweiden/fzf-extras/blob/master/fzf-extras.sh
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# branch switcher
# brew install https://raw.githubusercontent.com/nickbarth/branch/master/branch.rb
alias gbb='branch'

# go lang
# export GOROOT=/usr/local/opt/go/libexec
# export GOPATH=$HOME/.go
# export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# python virtualenv
# export WORKON_HOME=~/virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh

# node
# export PATH=./node_modules/.bin:$PATH

# brew
export PATH=/usr/local/sbin:$PATH
