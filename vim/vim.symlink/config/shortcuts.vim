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
" look at ~/.vim/config/common.vim to understand how it gathers together
"
"*****************************************************************************"

 "                                                                           "
"*****************************************************************************"
"
" Key maps
"
"*****************************************************************************"
 "                                                                           "

" Set leader key
let mapleader=","

"" Previous - Next buffer
map <C-S-Left> :bprev<CR>
map <C-S-Right> :bnext<CR>

"" Delete buffer
map <Leader>bd :bd<CR>

"" Folding
nnoremap <silent> <Space> @=(foldlevel('.')?'za':'l')<CR>
vnoremap <Space> zf

"" Windows

" Navigate between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Rolodex for vim
"toggles whether or not the current window is automatically zoomed
function! ToggleMaxWins()
  if exists('g:windowMax')
    au! maxCurrWin
    exe "normal \<c-w>="
    unlet g:windowMax
  else
    augroup maxCurrWin
    " au BufEnter * exe "normal \<c-w>_\<c-w>\<Bar>"
    "
    " only max it vertically
    au! WinEnter * exe "normal \<c-w>_"
    augroup END
    do maxCurrWin WinEnter
    let g:windowMax=1
  endif
endfunction
map <Leader>max :call ToggleMaxWins()<CR>

"" Move block of text
vmap <C-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z

"" Get to normal mode from insert mode via jj
inoremap jj <Esc>


"" Strip trailing whitespace from file
function! StripWhitespace ()
    exec ':%s/ \+$//gc'
endfunction
"map <Leader>s :call StripWhitespace ()<CR>

nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j

"" Set working directory to that of the current file
nnoremap <Leader>cwd :cd %:p:h<CR>:pwd<CR>

nnoremap <Leader>m :!make ; make clean ; open *.pdf<CR>

" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-d> :call ToggleVExplorer()<CR>
