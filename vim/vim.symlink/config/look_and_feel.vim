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

set encoding=utf-8  " Activate unicode glyphs
set laststatus=2    " Always show status line
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%04l,%04v][%p%%]\ [LEN=%L] " Set status line

""" Tabulation

" Tab size

set tabstop=2
set softtabstop=2
set shiftwidth=2  " Make indent equal 2 spaces
set shiftround
set ai            " Auto indent to current level
set si            " Smart indent
set stal=2
set expandtab     " Use spaces

filetype on
filetype plugin on
filetype indent on

" Soft wrap text
set wrap
" Scroll screen lines, not file lines
nmap j gj
nmap k gk
nmap <Up> gk
nmap <Down> gj
vmap j gj
vmap k gk
vmap <Up> gk
vmap <Down> gj

" Use sane regexes
nnoremap / /\v
vnoremap / /\v
cnoremap s/ s/\v
nnoremap ? ?\v
vnoremap ? ?\v
cnoremap s? s?\v

set backspace=2            " Backspace over everything in insert mode

set whichwrap+=<,>,h,l,[,] " Backspace and cursors wrap lines

" netrw
let g:netrw_liststyle=3 " Use tree-mode as default view
let g:netrw_browse_split=4 " Open file in previous buffer
let g:netrw_preview=1 " preview window shown in a vertically split
let g:netrw_altv=1 " split to right
let g:netrw_winsize=40

""" Buffers

set hidden " Allow dirty unsaved buffers

""" Appearance

"colorscheme solarized         " Color theme
colorscheme zenburn
set background=dark
set list                    " Show invisible characters
set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮ " Use my favorite invisible characters
set showbreak=↪

""" Search

set ignorecase " Ignore case when searching
set smartcase  " Case-sensitive if using upper-space characters
set showcmd    " Show incomplete cmds down the bottom
set showmode   " Show current mode down the bottom

set incsearch  " Find the next match as we type the search
set nohlsearch " Don't hilight searches by default

" Page Up & Page Down behaviour

set nostartofline " Don't jump to first line

" Save and load folding automatically
au BufWinLeave ?* mkview
au BufWinEnter ?* silent loadview

" Activate audible bell for WAT driven development. See http://jrom.net/wat-driven-development
"let &t_vb = "\<C-G>\e|50f"

" Show 3 line after and before cursor when scrolling

set scrolloff=3

 "                                                                           "
"*****************************************************************************"
"
" GUI settings
"
"*****************************************************************************"
 "                                                                           "
