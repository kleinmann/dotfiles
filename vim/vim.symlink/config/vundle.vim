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
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-git'
Bundle 'vim-ruby/vim-ruby'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-rails'
Bundle 'Townk/vim-autoclose'
Bundle 'mattn/gist-vim'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'godlygeek/tabular'
Bundle 'airblade/vim-rooter'
Bundle 'jceb/vim-orgmode'
Bundle 'chrisbra/NrrwRgn'
Bundle 'majutsushi/tagbar'
Bundle 'kleinmann/simplenote.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'tpope/vim-endwise.git'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Raimondi/delimitMate'
Bundle 'kleinmann/Command-T'

" vim-scripts
Bundle 'ack.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'CSApprox'
Bundle 'Zenburn'
Bundle 'easytags.vim'
Bundle 'codepad'
Bundle 'utl.vim'
Bundle 'haskell.vim'
Bundle 'rainbow_parentheses.vim'
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'glsl.vim'
Bundle "ZoomWin"

 "                                                                           "
"*****************************************************************************"
" * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * "
"* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *"
"*****************************************************************************"
 "                                                                           "
