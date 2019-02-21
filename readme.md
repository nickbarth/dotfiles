# dotfiles

An archive of a few personal dotfiles for easy access.

### Dependencies

```terminal
# osx:
brew install git cmake tmux stow rlwrap autojump ack
# ubuntu: 
apt install git make tmux stow rlwrap autojump ack
```

### Setup

```terminal
git clone git@github.com:nickbarth/dotfiles.git && cd dotfiles
stow -v2 .

# clear old
stow -v2 . &> /dev/stdout | grep Skipping | awk '{ print $3 }' | xargs -I{} rm ~/{}
```

### Vim Plugins

```terminal
# uses vim-plug https://github.com/junegunn/vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim . -c':PlugInstall' -c':qa'
```

### License
The CC0 License

[![CC0](http://i.creativecommons.org/l/zero/1.0/88x31.png)](http://creativecommons.org/publicdomain/zero/1.0/)
