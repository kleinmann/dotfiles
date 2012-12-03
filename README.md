## clone & setup
    chsh -s `which zsh`
    git clone --recursive https://github.com/kleinmann/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
  
## install rvm
    bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)
    if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi
    rvm get head
    rvm reload
    rvm install 1.9.3
    rvm use 1.9.3 --default

## initialize
    cd ~/.dotfiles
    bundle
    rake install
    cd ~/.vim/bundles
    git clone https://github.com/gmarik/vundle.git vundle
    vim +BundleInstall +qall

## all done, enjoy working!
