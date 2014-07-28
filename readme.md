# dotfiles

An archive of a few personal dotfiles for easy access.

### Pre Setup

```terminal
# Install Brew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

brew install git
brew install tmux
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

### License
WTFPL &copy; 2014 Nick Barth
