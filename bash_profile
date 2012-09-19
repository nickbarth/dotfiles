# .bash_profile

source ~/.bashrc

# Autorun Screen - I'm almost never not using it.
if [ $STY ]; then echo "Already in Screen"; else screen -DRR; fi
