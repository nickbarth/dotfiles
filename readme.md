# dotfiles

An archive of my personal dotfiles for easy access.

### Dependencies

```terminal
# osx:
brew install git cmake tmux stow rlwrap autojump ack ripgrep bat
# ubuntu: 
apt install git make tmux stow rlwrap autojump ack ripgrep bat
```

### Git

```terminal
git config --global core.excludesfile ~/.gitignore
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
