# .bashrc

# Vi Mode Rocks
set editing-mode vi
set keymap vi
set -o vi

# Color Param Prompt
PS1="[\e[1;34m\h\e[0m:\e[1;31m\w\e[0m]$ "

# Simple Command Prompt
# PS1="[\h:\w]$ "

# Default Editor
export EDITOR="vim"

# Update Dotfiles
alias dots='cd ~ && git fetch origin master && git reset --hard origin/master && git submodule update --init --recursive && cd -'

# Git Commands
alias ga='git add'
alias gb='git branch'
alias gc='git commit --verbose'
alias gd='git diff --color'
alias gl='git log --color'
alias grl='git log --color --pretty=format:"%x09%an%x09%ad%x09%s" --author=nickbarth'
alias gu='git pull --rebase'
alias gm='git merge'
alias go='git checkout'
alias gp='git push'
alias gs='git status -sb'
alias gt='git ls-tree master -r --name-only .'
alias gh='alias | grep git'

# Binaries
export PATH=/usr/local/bin/:$PATH

# Tmux Colors
alias tmux='tmux -2'

# Tmux Commands
alias xn='tmux new'
alias xa='tmux a -d'
alias xx='touch /tmp/xx && kill-session'
alias xr='tmux rename-session `basename $(pwd)`'
alias xs='tmux switch -t'
alias xh="alias | grep tmux'

# Color ls
if [[ "$(uname)" == "Darwin" ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color'
fi

# find && cd
fd () {
  cd `find . -type d -name "*$1*"`
}

# Bash History
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000
export HISTFILESIZE=100000
shopt -s histappend

# z
. ~/z/z.sh

# Always TMUX
if [[ $- == *i* ]] && [[ -z "$TMUX" ]]; then
  if [[ "$(uname)" == "Darwin" ]]; then
    tmux new && [[ -e /tmp/xx ]] && rm /tmp/xx && exit
  else
    tmux a -d && [[ -e /tmp/xx ]] && rm /tmp/xx && exit
  fi
fi
