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
" Plugin configurations
"
"*****************************************************************************"
 "                                                                           "

""" NERDTree
" Ctrl+D map to toggle NERDTree
nmap <silent> <C-D> :NERDTreeToggle<CR>
imap <silent> <C-D> :NERDTreeToggle<CR>

""" Ack
nmap <Leader>a :Ack 

""" FuzzyFinder
nnoremap ,ff :FufFile<CR>
nnoremap ,fb :FufBuffer<CR>
nnoremap ,fd :FufDir<CR>
nnoremap ,fl :FufLine<CR>
let g:fuf_buffer_keyDelete = '<C-S-d>'
let g:fuf_keyOpenSplit = '<C-i>'
let g:fuf_keyOpenVsplit = '<C-v>'

""" Vim-Ruby
" Autocomplete setup
let g:rubycomplete_buffer_loading = 1
let g:rubes_in_global = 1
let g:rubycomplete_rails = 1

""" vim-rails
map <Leader>rc :Rcontroller<Space>
map <Leader>rm :Rmodel<Space>
map <Leader>rv :Rview<Space>
map <Leader>rh :Rhelper<Space>
map <Leader>rj :Rjavascript<Space>
map <Leader>rl :Rlayout<Space>
map <Leader>rs :Rspec<Space>
map <Leader>re :Renvironment<Space>
map <Leader>ri :Rinitializer<Space>

""" tagbar
map <Leader>t :TagbarToggle<CR>

""" gundo
nnoremap <C-u> :GundoToggle<CR>

""" Snipmate
let g:snippets_dir = "~/.vim/snippets"

""" Tabularize
if exists(":Tabularize")
  nmap <Leader>t= :Tabularize /=<CR>
  vmap <Leader>t= :Tabularize /=<CR>
  nmap <Leader>t: :Tabularize /:\zs<CR>
  vmap <Leader>t: :Tabularize /:\zs<CR>
  nmap <Leader>t, :Tabularize /,\zs<CR>
  vmap <Leader>t, :Tabularize /,\zs<CR>
  nmap <Leader>t> :Tabularize /=>\zs<CR>
  vmap <Leader>t> :Tabularize /=>\zs<CR>
endif

""" Rainbow parentheses
nmap <Leader>ra :RainbowParenthesesToggle<CR>

""" Powerline
let g:Powerline_symbols = 'fancy'

""" Indent Guides
let g:indent_guides_enable_on_vim_startup=1
