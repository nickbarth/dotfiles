#!/usr/bin/env sh

echo 'Uninstalling dotfiles...'

if [ ! -d ~/.dotfiles ]
then
  echo "You do not have these dotfiles installed."
  exit
fi

echo "Restoring original dotfiles..."
mkdir ~/.dotfiles/backups
mv ~/.dotfiles/backups/.bashrc ~/.bashrc 2> /dev/null
mv ~/.dotfiles/backups/.bash_profile ~/.bash_profile 2> /dev/null
mv ~/.dotfiles/backups/.gemrc ~/.gemrc 2> /dev/null
mv ~/.dotfiles/backups/.vimrc ~/.vimrc 2> /dev/null
mv ~/.dotfiles/backups/.irbrc ~/.irbrc 2> /dev/null

echo "Removing installation folder..."
rm -rf ~/.dotfiles/

echo "Successfully removed dotfiles."
