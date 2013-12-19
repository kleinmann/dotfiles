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
" This config is just a part of my "The Big Vim Config" ;)
" look at ~/.vim/config/entrance_point.vim to understand how it gathers together
"
"*****************************************************************************"

"                                                                           "
"*****************************************************************************"
"
" Base settings
"
"*****************************************************************************"
 "                                                                           "

syntax on        " Turn on syntax highlight
set mouse=a      " Mouse everywhere

set nobackup          " Disable creation of backup file.
set nowritebackup     " Disable creation of write backup files

set noswapfile

set nolazyredraw

set clipboard+=unnamed

set autoread

set shell=bash

set report=0 " Tell me changes

scriptencoding utf-8 " Activate utf-8

set autoread " Read file if changed on the outside

set history=1000 " Store lots of :cmdline history

set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,options,resize,tabpages,winsize,winpos " activate session saving

set backspace=indent,eol,start " Allow to navigate from start of line to end of previous line

set wildmenu

set wildmode=list:longest " Make cmdline tab completion similar to bash

set completeopt=longest,menu " (only complete to the longest unambiguous match, and show a menu)
