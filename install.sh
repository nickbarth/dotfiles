#!/usr/bin/env sh

echo 'Installing dotfiles...'

if [ -d ~/.dotfiles ]
then
  echo "You've already installed the dotfiles."
  exit
fi

echo "Downloading dotfiles..."
hash git >/dev/null && /usr/bin/env git clone https://github.com/nickbarth/dotfiles.git ~/.nbdotfiles || {
  echo "git not installed"
  exit
}

echo "Backing up original dotfiles..."
mkdir ~/.dotfiles/backups
mv ~/.bashrc ~/.dotfiles/backups/
mv ~/.bash_profile ~/.dotfiles/backups/
mv ~/.gemrc ~/.dotfiles/backups/
mv ~/.vimrc ~/.dotfiles/backups/
mv ~/.irbrc ~/.dotfiles/backups/

echo "Copying over dotfiles"
mkdir -p ~/.vim/tmp/
cp ~/.dotfiles/.bashrc ~/.bashrc
cp ~/.dotfiles/.bash_profile ~/.bash_profile
cp ~/.dotfiles/.gemrc ~/.gemrc
cp ~/.dotfiles/.vimrc ~/.vimrc
cp ~/.dotfiles/.irbrc ~/.irbrc

echo "Successfully installed dotfiles."
