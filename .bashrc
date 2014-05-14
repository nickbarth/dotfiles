# .bashrc

# Vi Mode Rocks
set editing-mode vi
set keymap vi
set -o vi

# Simpler Command Prompt
PS1="[\h:\w]$ "

# Default Editor
export EDITOR="vim"

# Git Commands
alias ga='git add'
alias gb='git branch'
alias gc='git commit --verbose'
alias gd='git diff --color'
alias gl='git log --color'
alias gu='git pull --rebase'
alias gm='git merge'
alias go='git checkout'
alias gp='git push'
alias gs='git status -sb'
alias gt='git ls-tree master -r --name-only .'
alias gh='echo "
ga: git add
gb: git branch
gc: git commit
gd: git diff
gl: git log
gu: git pull
gm: git merge
go: git checkout
gp: git push
gs: git status
gt: git ls-tree
"'

# TMUX Keys
alias tmux_keys='tmux -f /dev/null -L temp start-server \; list-keys'

# Binaries
export PATH=/usr/local/bin/:$PATH

# Always TMUX
if [[ $- == *i* ]] && [[ -z "$TMUX" ]]; then
  tmux a -d || tmux new
fi

# Git Reminder
alias whatdid='git log --color --pretty=format:"%x09%an%x09%ad%x09%s" --author=nickb'

# z
. ~/z/z.sh

# Color ls
if [[ "$(uname)" == "Darwin" ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color'
fi

# cd -> cdls
cdls () {
  cd "$1"
  local cderr="$?"
  if [ "$cderr" -eq '0' ]; then
    [ "$1" = '-' ] || pwd
    shift
    ls $@
  fi
  return "$cderr"
}

alias cd='cdls'

# Bash History
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend
