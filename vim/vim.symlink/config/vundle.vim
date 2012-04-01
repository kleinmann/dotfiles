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
Bundle 'mattn/gist-vim'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'godlygeek/tabular'
Bundle 'airblade/vim-rooter'
Bundle 'jceb/vim-orgmode'
Bundle 'chrisbra/NrrwRgn'
Bundle 'majutsushi/tagbar'
Bundle 'mrtazz/simplenote.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-endwise.git'
Bundle 'kleinmann/Command-T'
Bundle 'nanotech/jellybeans.vim'
Bundle 'sjl/threesome.vim'
Bundle 'acustodioo/vim-tmux'
Bundle 'hallison/vim-markdown'
Bundle 'kchmck/vim-coffee-script'
Bundle 'skwp/vim-rspec'
Bundle 'tpope/vim-cucumber'
Bundle 'Townk/vim-autoclose'
Bundle 'duwanis/tomdoc.vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'altercation/vim-colors-solarized'

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
