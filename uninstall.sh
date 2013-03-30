#!/usr/bin/env sh

echo 'Uninstalling dotfiles...'

if [ ! -d ~/.dotfiles ]
then
  echo "You do not have these dotfiles installed."
  exit
fi

echo "Restoring original dotfiles..."
mkdir ~/.dotfiles/backups
mv ~/.dotfiles/backups/.bashrc ~/.bashrc
mv ~/.dotfiles/backups/.bash_profile ~/.bash_profile
mv ~/.dotfiles/backups/.gemrc ~/.gemrc
mv ~/.dotfiles/backups/.vimrc ~/.vimrc
mv ~/.dotfiles/backups/.irbrc ~/.irbrc

echo "Removing installation folder..."
rm -rf ~/.dotfiles/

source ~/.bashrc
source ~/.bash_profile

echo "Successfully removed dotfiles."
