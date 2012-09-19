#!/usr/bin/env sh

echo 'Installing NB dotfiles...'

if [ -d ~/.nbdotfiles ]
then
  echo "You've already installed the dotfiles."
  exit
fi

echo "Cloning dotfiles..."
hash git >/dev/null && /usr/bin/env git clone https://github.com/nickbarth/dotfiles.git ~/.nbdotfiles || {
  echo "git not installed"
  exit
}

echo "Backing up original dotfiles..."
mkdir ~/.nbdotfiles/backups
mv ~/.bashrc ~/.nbdotfiles/backups/
mv ~/.bash_profile ~/.nbdotfiles/backups/
mv ~/.gemrc ~/.nbdotfiles/backups/
mv ~/.vimrc ~/.nbdotfiles/backups/
mv ~/.irbrc ~/.nbdotfiles/backups/

echo "Copying over Cool New Dotfiles"
cp ~/.nbdotfiles/.bashrc ~/
cp ~/.nbdotfiles/.bash_profile ~/
cp ~/.nbdotfiles/.gemrc ~/
cp ~/.nbdotfiles/.vimrc ~/
cp ~/.nbdotfiles/.irbrc ~/

source ~/.bashrc
source ~/.bash_profile

echo "NB dotfiles Successfully Installed!"
