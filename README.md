## clone & setup
	brew install zsh # I assume you're on a Mac
    chsh -s `which zsh`
    git clone --recursive https://github.com/kleinmann/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
  
## install rbenv
	brew install rbenv ruby-build # I assume you're on a Mac
	rbenv install 2.0.0-p247
	rbenv global 2.0.0-p247
	~/.rbenv/shims/gem install bundler

## initialize
    cd ~/.dotfiles
    ~/.rbenv/shims/bundle
    rake install
    cd ~/.vim/bundles
    git clone https://github.com/gmarik/vundle.git vundle
    vim +BundleInstall +qall

## all done, enjoy working!
