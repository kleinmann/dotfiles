## Prerequisites
I assume you're on a Mac, currently with Mac OS X Mavericks (10.9).

You need:

* Homebrew

## clone & setup
    brew install zsh # I assume you're on a Mac
    chsh -s `which zsh`
    git clone --recursive https://github.com/kleinmann/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles

## install rbenv
    brew install rbenv ruby-build
    rbenv install 2.2.0
    rbenv global 2.2.0
    ~/.rbenv/shims/gem install bundler

## initialize
    cd ~/.dotfiles
    brew install gnupg
    ~/.rbenv/shims/bundle
    rake install
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    vim +BundleInstall +qall

## all done, enjoy working!
