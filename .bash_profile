# .bash_profile

# Default Editor
export EDITOR="vim"

# Git Commands
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gl='git pull'
alias gm='git merge'
alias go='git checkout'
alias gp='git push'
alias gs='git status'
alias gt='git tag'

# Autorun Screen - I'm almost never not using it.
if [ $STY ]; then echo "Already in Screen"; else screen -DRR; fi
