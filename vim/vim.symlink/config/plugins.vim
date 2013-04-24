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
nnoremap <silent> <C-d> :NERDTreeToggle<CR>

""" NERDcommenter
nnoremap <Leader># :call NERDComment(0, "invert")<CR>
vnoremap <Leader># :call NERDComment(0, "invert")<CR>
let NERDCommentWholeLinesInVMode=2
let NERDSpaceDelims=1
let NERDRemoveExtraSpaces=1

""" Ack
nnoremap <Leader>a :Ack<space>

""" Vim-Ruby
" Autocomplete setup
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
if !empty($MY_RUBY_HOME)
 let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/ruby/site_ruby/*'),"\n"),',')
endif


""" gundo
nnoremap <C-u> :GundoToggle<CR>

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
if !has('gui_running')
    let g:indent_guides_auto_colors=0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=237
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=239
endif

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

""" fugitive
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <leader>gp :Git push<CR>

""" easytags
set tags=./tags,~/tags
let g:easytags_include_members=1
let g:easytags_dynamic_files = 1

""" delimitMate
let delimitMate_expand_cr=1
let delimitMate_expand_space=1
let delimitMate_balance_matchpairs=1

""" hammer
" nnoremap <Leader>p :Hammer<CR>

"" Syntastic
" nnoremap <Leader>s :SyntasticCheck<CR>
" let g:syntastic_enable_signs=1
" let g:syntastic_auto_loc_list=1
" let g:syntastic_auto_jump=1
" let g:syntastic_error_symbol='✗'
" let g:syntastic_warning_symbol='⚠'
" let g:syntastic_stl_format='[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
" let g:syntastic_mode_map = { 'mode': 'passive',
                          " \ 'active_filetypes': ['ruby', 'php'],
                          " \ 'passive_filetypes': [] }


"" Golden Ratio
" Disable Golden Ratio plugin when in diff mode
" if &diff
  " let g:loaded_golden_ratio=1
" endif
" let g:golden_ratio_autocommand=0
" nnoremap <Leader>g :GoldenRatioToggle<CR>
" vnoremap <Leader>g :GoldenRatioToggle<CR>

""" ctrlp.vim
nnoremap <Leader>t :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_dotfiles = 0

""" numbers.vim
nnoremap <F3> :NumbersToggle<CR>

""" ultisnips
let g:UltiSnipsSnippetsDir = '~/.vim/bundle/snipmate-snippets/snippets'
let g:UltiSnipsEditSplit = 'horizontal'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

""" vim-rspec
nnoremap <Leader>r :RunSpec<CR>
nnoremap <Leader>rl :RunSpecLine<CR>
