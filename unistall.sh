#!/usr/bin/env sh

echo 'Uninstalling NB dotfiles...'

if [ ! -d ~/.nbdotfiles ]
then
  echo "You don't have these dotfiles installed."
  exit
fi

echo "Restoring backed up dotfiles..."
mkdir ~/.nbdotfiles/backups
~/.nbdotfiles/backups/.bashrc ~/
~/.nbdotfiles/backups/.bash_profile ~/
~/.nbdotfiles/backups/.gemrc ~/
~/.nbdotfiles/backups/.vimrc ~/
~/.nbdotfiles/backups/.irbrc ~/

echo "Removing installation folder..."
rm -rf ~/.nbdotfiles/

echo "NB dotfiles Successfully Removed!"
