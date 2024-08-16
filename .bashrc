#!/bin/bash

# vi mode
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

# git config
git config --global push.default current
git config --global pull.rebase false

# git commands
alias ga='git add'
alias gb='git branch'
alias gc='git commit --verbose'
alias gd='git diff --color'
alias gdc='git diff --color --cached'
alias gds='git diff --color --staged'
alias gg='git log --color --date=iso --graph  --pretty=format:"%C(bold red) %cd%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%  %C(reset)%C(bold cyan)%h %C(reset)%C(blue)%s %C(reset)- %an"'
alias gl='git log --color --date=iso --pretty=format:"%C(bold red) %cd%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%x08%  %C(reset)%C(bold cyan)%h %C(reset)%C(blue)%s %C(reset)- %an"'
alias gll='gl --no-merges master..'
alias glt='gl | grep $(date +%F)'
alias gm='git merge'
alias gco='git checkout'
alias gp='git push -u'
alias gr='git reset --hard HEAD; git clean -fd'
alias gs='git status -sb'
alias gt='git ls-tree master -r --name-only .'
alias gu='git pull'

# convenience
alias tmux='tmux -2'
alias ls='ls -G'
alias dd='date +%Y-%m-%d'
alias x='exit'

# history
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[ -f /usr/share/autojump/autojump.sh ] && . /usr/share/autojump/autojump.sh
alias z='j'

# fzf
# https://github.com/atweiden/fzf-extras/blob/master/fzf-extras.sh
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# switch branch
gbb() {
  eval $(echo git checkout "$(git branch --all \
                 | fzf --height 10 \
                 | tr -d '[:space:]' \
                 | tr -d '*' \
                 | sed 's/remotes\//\-\-track /g')")
}

# brew
export PATH=/usr/local/sbin:$PATH
