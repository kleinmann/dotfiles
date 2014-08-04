syntax on        " Turn on syntax highlight
set mouse=a      " Mouse everywhere

set backup
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//

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

set completeopt=longest,menuone,preview
