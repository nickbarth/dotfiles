# dotfiles

An archive of a few personal dotfiles for easy access.

### Dependencies

```terminal
OSX/BREW: git cmake tmux
LINUX/APTGET: git make tmux
```

### Setup

```terminal
git clone git@github.com:nickbarth/dotfiles.git
cd dotfiles
git submodule update --init --recursive
cp -rf * ~
cp -rf .* ~
cd ../z && make
```

### License
The CC0 License

[![CC0](http://i.creativecommons.org/l/zero/1.0/88x31.png)](http://creativecommons.org/publicdomain/zero/1.0/)
