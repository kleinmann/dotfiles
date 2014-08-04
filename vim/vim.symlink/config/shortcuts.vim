" Set leader key
let mapleader=","

"" Previous - Next buffer
map <C-S-Left> :bprev<CR>
map <C-S-Right> :bnext<CR>

"" Delete buffer
map <Leader>bd :Bdelete<CR>

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

"" Split current file vertically (h) or horizontally (v)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

noremap H ^
noremap L g_
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A
cnoremap <c-a> <home>
cnoremap <c-e> <end>

"" Set working directory to that of the current file
nnoremap <Leader>cwd :cd %:p:h<CR>:pwd<CR>

" Toggle Vexplore with Ctrl-E (or use :Lexplore)
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
" map <silent> <C-d> :call ToggleVExplorer()<CR>

"" Save with :W
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))

"" Completion
inoremap <C-c> <C-x><C-o>

""" Ruby
"" Convert Ruby 1.8 hashes to Ruby 1.9 syntax
nnoremap <leader>: :%s/:\([^ ]*\)\(\s*\)=>/\1:/gc<CR>
"" Add whitespace inside of braces
nnoremap <leader>{ :%s/{\([^ ]\)/{ \1/gc<CR>

""" Tags
"" Pop tag stack
nnoremap t <C-]>

""" Leader shortcuts
nnoremap <Leader>w :w<CR>
" Format XML
nnoremap nmap <leader>xml :%!xmllint --format -<CR>
" Format JSON, thanks to:
" http://blog.realnitro.be/2010/12/20/format-json-in-vim-using-pythons-jsontool-module/
nnoremap <leader>js :%!python -m json.tool<cr>:%s/ \{4\}/  /<CR>:noh<CR>gg

" Source
vnoremap <leader>S y:execute @@<CR>
nnoremap <leader>S ^vg_y:execute @@<CR>

" Calculator as seen in @sjl's vimrc
inoremap <C-B> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

" Write with sudo
cmap w!! w !sudo tee % >/dev/null

" Filetype switching {{{
nnoremap _rb :set ft=ruby<CR>
nnoremap _php :set ft=php<CR>
" }}}
