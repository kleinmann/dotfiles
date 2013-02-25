"*****************************************************************************"
"
"     ______        _____
"   ||      |     ||     |
"    \\     /     \\     |
"     ||   |       /    /
"     ||   |      /    /
"     ||   |     /    /
"      ||   |   /    /
"      ||   | _/   _/
"      ||   |/    |_|
"      ||        / ___ __              ___    ___
"       ||     _/ \\ | \\ \−-_−-_    ||  _/ // _|
"   _   ||    /   || | || /\ /\ |    || |  || |_
"  |_|   ||__/    ||_| ||_||_||_|_   ||_|   \\__|
"
"
"                                         by Aleksandr Koss (http://nocorp.me)
"
"*****************************************************************************"

"                                                                           "
"*****************************************************************************"
"
" $ cat ~/.vimrc
"
" My ~/.vimrc run this file, so if you want to use my vim config you
" should type in rc file just a one line below
"
" runtime! config/entrance_point.vim
"
"*****************************************************************************"
 "                                                                           "

 "                                                                           "
"*****************************************************************************"
"
" Vundle
"
"*****************************************************************************"
 "                                                                           "

filetype on
filetype off 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle take care of itself
Bundle 'gmarik/vundle'

" Github Repositories
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-git'
Bundle 'vim-ruby/vim-ruby'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-rails'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'godlygeek/tabular'
Bundle 'airblade/vim-rooter'
Bundle 'tpope/vim-endwise.git'
Bundle 'hallison/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'skwp/vim-rspec'
Bundle 'tpope/vim-cucumber'
Bundle 'Raimondi/delimitMate'
Bundle 'duwanis/tomdoc.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'matthias-guenther/hammer.vim'
Bundle 'scrooloose/syntastic'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tpope/vim-repeat'
Bundle 'kien/ctrlp.vim'
Bundle 'myusuf3/numbers.vim'
Bundle 'rodjek/vim-puppet'
Bundle 'tpope/vim-sleuth'
Bundle 'othree/html5.vim'
Bundle 'mattn/zencoding-vim'
Bundle 'xolox/vim-easytags'

" Snippets
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'kleinmann/snipmate-snippets'

" Themes
Bundle 'Zenburn'
Bundle 'altercation/vim-colors-solarized'
Bundle 'nanotech/jellybeans.vim'
Bundle 'CSApprox'

" Visuals
Bundle 'rainbow_parentheses.vim'
" Installed via pip install --user git+git://github.com/Lokaltog/powerline
python from powerline.bindings.vim import source_plugin; source_plugin()
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'roman/golden-ratio'

" vim-scripts
Bundle 'ack.vim'
Bundle 'L9'
Bundle 'utl.vim'
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'xmledit'
Bundle 'matchit.zip'

 "                                                                           "
"*****************************************************************************"
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * "
"* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
"*****************************************************************************"
 "                                                                           "
