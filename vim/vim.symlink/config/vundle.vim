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
Bundle 'thoughtbot/vim-rspec'
Bundle 'duwanis/tomdoc.vim'
" Bundle 'scrooloose/syntastic'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tpope/vim-repeat'
Bundle 'kien/ctrlp.vim'
Bundle 'rodjek/vim-puppet'
Bundle 'tpope/vim-sleuth'
Bundle 'othree/html5.vim'
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'
Bundle 'tpope/vim-classpath'
Bundle 'Raimondi/delimitMate'
Bundle 'webgefrickel/vim-typoscript'
Bundle 'tpope/vim-dispatch'
Bundle 'rking/ag.vim'
Bundle 'vim-scripts/taglist.vim'

" Snippets
Bundle "SirVer/ultisnips"
Bundle 'kleinmann/snipmate-snippets'

" Themes
Bundle 'Zenburn'
Bundle 'altercation/vim-colors-solarized'
Bundle 'CSApprox'

" Visuals
Bundle 'rainbow_parentheses.vim'
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
Bundle 'nathanaelkane/vim-indent-guides'

" vim-scripts
Bundle 'L9'
Bundle 'utl.vim'
Bundle 'xmledit'
Bundle 'matchit.zip'
Bundle 'paredit.vim'

 "                                                                           "
"*****************************************************************************"
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * "
"* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
"*****************************************************************************"
 "                                                                           "
