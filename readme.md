# dotfiles

An archive of a few personal dotfiles for easy access.

### Pre Setup

```terminal
# Install Brew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

brew install git
brew install tmux
brew install cmake
```

### Setup

```terminal
cd ~
git init
git remote add origin https://github.com/nickbarth/dotfiles
git fetch origin master
git reset --hard origin/master
git submodule update --init --recursive
```

### Alternatively

```terminal
git clone --recursive --depth 1 https://github.com/nickbarth/dotfiles
cd dotfiles
cp -rf * ~
cp -rf .* ~
cd ../z && make
```

### License
The CC0 License

[![CC0](http://i.creativecommons.org/l/zero/1.0/88x31.png)](http://creativecommons.org/publicdomain/zero/1.0/)
