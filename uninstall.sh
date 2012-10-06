#!/usr/bin/env sh

echo 'Uninstalling NB dotfiles...'

if [ ! -d ~/.nbdotfiles ]
then
  echo "You don't have these dotfiles installed."
  exit
fi

echo "Restoring backed up dotfiles..."
mkdir ~/.nbdotfiles/backups
mv ~/.nbdotfiles/backups/.bashrc ~/.bashrc
mv ~/.nbdotfiles/backups/.bash_profile ~/.bash_profile
mv ~/.nbdotfiles/backups/.gemrc ~/.gemrc
mv ~/.nbdotfiles/backups/.vimrc ~/.vimrc
mv ~/.nbdotfiles/backups/.irbrc ~/.irbrc

echo "Removing installation folder..."
rm -rf ~/.nbdotfiles/
rm -rf ~/.vim/tmp/

source ~/.bashrc
source ~/.bash_profile
echo "NB dotfiles Successfully Removed!"
