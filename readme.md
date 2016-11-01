# dotfiles

An archive of a few personal dotfiles for easy access.

### Dependencies

```terminal
OSX/BREW: git cmake tmux stow
LINUX/APTGET: git make tmux stow
```

### Setup

```terminal
git clone --recursive git@github.com:nickbarth/dotfiles.git && cd dotfiles
stow -v2 .
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
