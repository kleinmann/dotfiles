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

 "                                                                           "
"*****************************************************************************"
"
" Look and feel
"
"*****************************************************************************"
 "                                                                           "

""" Line options

set number        " Turn on line numbers
set numberwidth=5 " Show 5 numbers max
set cul           " Highlight current line

set laststatus=2    " Always show status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] " Set status line

""" Tabulation

" Tab size

set tabstop=2
set softtabstop=2
set shiftwidth=2  " Make indent equal 2 spaces
set ai            " Auto indent to current level
set si            " Smart indent
set stal=2
set expandtab     " Use spaces

filetype on
filetype plugin on
filetype indent on

" Soft wrap text

set wrap
map j gj
map k gk
map [Up] gk
map [Down] gj

set backspace=2            " Backspace over everything in insert mode

set whichwrap+=<,>,h,l,[,] " Backspace and cursors wrap lines

""" Buffers

set hidden " Allow dirty unsaved buffers

""" Appearance

colorscheme zenburn         " Color theme
set list                    " Show invisible characters
set listchars=tab:▸\ ,eol:¬ " Use my favorite invisible characters

""" Search

set ignorecase " Ignore case when searching
set smartcase  " Case-sensitive if using upper-space characters
set showcmd    " Show incomplete cmds down the bottom
set showmode   " Show current mode down the bottom

set incsearch  " Find the next match as we type the search
set nohlsearch " Don't hilight searches by default

" Page Up & Page Down behaviour

set nostartofline " Don't jump to first line

" Stop beeping!

set visualbell

" Show 3 line after and before cursor when scrolling

set scrolloff=3

 "                                                                           "
"*****************************************************************************"
"
" GUI settings
"
"*****************************************************************************"
 "                                                                           "
