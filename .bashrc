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
alias gd='git diff'
alias gl='git pull --rebase'
alias gm='git merge'
alias go='git checkout'
alias gp='git push'
alias gs='git status'
alias gt='git tag'
alias gh='echo "
ga: git add
gb: git branch
gc: git commit
gd: git diff
gl: git pull
gm: git merge
go: git checkout
gp: git push
gs: git status
gt: git tag
"'

# Binaries
export PATH=/usr/local/bin/:$PATH

# Single TMUX
if [[ -z "$TMUX" ]]; then
  tmux a -d || tmux new
  exit
fi
