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

""" Ack
nmap <Leader>a :Ack 

""" FuzzyFinder
nnoremap ,ff :FufFile<CR>
nnoremap ,fb :FufBuffer<CR>
let g:fuf_buffer_keyDelete = '<C-S-d>'
let g:fuf_keyOpenSplit = '<C-i>'
let g:fuf_keyOpenVsplit = '<C-v>'

""" Vim-Ruby
" Autocomplete setup
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
if !empty($MY_RUBY_HOME)
 let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/ruby/site_ruby/*'),"\n"),',')
endif


""" tagbar
nmap <Leader>o :TagbarToggle<CR>

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

""" Command-T
nnoremap <silent> <C-t> :CommandT<CR>

""" fugitive
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gl :Glog<CR>

""" easytags
set tags=./tags,~/tags
let g:easytags_dynamic_files = 1
