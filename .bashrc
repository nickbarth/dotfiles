# .bashrc

# Vi Mode Rocks
set editing-mode vi
set keymap vi
set -o vi

# Simpler Command Prompt
# PS1="[\h:\w]$ "
PS1="[\e[1;34m\h\e[0m:\e[1;31m\w\e[0m]$ "

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
alias gh='cat $0 | grep git'

# TMUX Keys
alias tmux_keys='tmux -f /dev/null -L temp start-server \; list-keys'

# Binaries
export PATH=/usr/local/bin/:$PATH

# Always TMUX
if [[ $- == *i* ]] && [[ -z "$TMUX" ]]; then
  if [[ "$(uname)" == "Darwin" ]]; then
    tmux new && [[ -e /tmp/xx ]] && rm /tmp/xx && exit
  else
    tmux a -d && [[ -e /tmp/xx ]] && rm /tmp/xx && exit
  fi
fi

# Kill Newest TMUX if not needed
alias tx='tmux list-sessions -F "#{session_created} #{session_name}" | sort -r | awk "{print \$2}" | head -1 | xargs tmux kill-session -t'
alias xx='touch /tmp/xx && tx'

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

# find cd
fd () {
  cd `find . -type d -name "*$1*"`
}

# Bash History
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend
