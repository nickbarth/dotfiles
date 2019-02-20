# dotfiles

An archive of a few personal dotfiles for easy access.

### Dependencies

```terminal
# osx:
brew install git cmake tmux stow rlwrap autojump
# ubuntu: 
apt install git make tmux stow rlwrap autojump
```

### Setup

```terminal
git clone --recursive https://github.com/nickbarth/dotfiles && cd dotfiles
stow -v2 .

# clear old
stow -v2 . &> /dev/stdout | grep Skipping | awk '{ print $3 }' | xargs -I{} rm ~/{}
```
### Extras

```bash
# golang
git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go

# python
git clone --recursive https://github.com/davidhalter/jedi-vim.git ~/.vim/bundle/jedi-vim

# vuejs
git clone https://github.com/posva/vim-vue.git ~/.vim/bundle/vim-vue
```

### License
The CC0 License

[![CC0](http://i.creativecommons.org/l/zero/1.0/88x31.png)](http://creativecommons.org/publicdomain/zero/1.0/)
