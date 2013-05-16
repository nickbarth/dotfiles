# .bash_profile

# Autorun Screen - I'm almost never not using it.
if [ $STY ]; then echo "Already in Screen"; else screen -DRR; fi
