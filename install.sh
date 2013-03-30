#!/usr/bin/env sh

echo 'Installing dotfiles...'

if [ -d ~/.dotfiles ]
then
  echo "You've already installed the dotfiles."
  exit
fi

echo "Downloading dotfiles..."
hash git >/dev/null && /usr/bin/env git clone https://github.com/nickbarth/dotfiles.git ~/.dotfiles || {
  echo "git not installed"
  exit
}

echo "Backing up original dotfiles..."
mkdir ~/.dotfiles/backups
mv ~/.bashrc ~/.dotfiles/backups/ 2> /dev/null
mv ~/.bash_profile ~/.dotfiles/backups/ 2> /dev/null
mv ~/.gemrc ~/.dotfiles/backups/ 2> /dev/null
mv ~/.vimrc ~/.dotfiles/backups/ 2> /dev/null
mv ~/.irbrc ~/.dotfiles/backups/ 2> /dev/null

echo "Copying over dotfiles"
mkdir -p ~/.vim/tmp/
cp ~/.dotfiles/.bashrc ~/.bashrc 2> /dev/null
cp ~/.dotfiles/.bash_profile ~/.bash_profile 2> /dev/null
cp ~/.dotfiles/.gemrc ~/.gemrc 2> /dev/null
cp ~/.dotfiles/.vimrc ~/.vimrc 2> /dev/null
cp ~/.dotfiles/.irbrc ~/.irbrc 2> /dev/null

echo "Successfully installed dotfiles."
