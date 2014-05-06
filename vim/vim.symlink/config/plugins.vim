""" NERDTree
" Ctrl+D map to toggle NERDTree
nnoremap <silent> <C-d> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeMinimalUI=1
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_open_on_console_startup=1

""" vim-commentary
nmap <Leader># <Plug>CommentaryLine
vmap <Leader># <Plug>Commentary

""" Ag
nnoremap <Leader>a :Ag<space>

""" taglist.vim
map <Leader>l :TagbarToggle<CR>

""" ctags
map <Leader>ct :!ctags -R *<CR>

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

""" Indent Guides
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

""" fugitive
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <leader>gp :Git push<CR>

set tags=./tags,~/tags,tags;,./TAGS,TAGS;

"" Syntastic
nnoremap <Leader>s :SyntasticCheck<CR>
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1
let g:syntastic_auto_jump=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_stl_format='[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_mode_map = { 'mode': 'passive',
                          \ 'active_filetypes': ['ruby'],
                          \ 'passive_filetypes': [] }
let g:syntastic_ruby_checkers = ['mri', 'rubocop']


""" ctrlp.vim
nnoremap <Leader>t :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_dotfiles = 0
let g:ctrlp_max_files = 0
let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }

""" ultisnips
let g:UltiSnipsExpandTrigger = '<Tab>'
let g:UltiSnipsJumpForwardTrigger = '<Tab>'
let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
let g:UltiSnipsListSnippets = '<C-Tab>'
let g:UltiSnipsSnippetDirectories = ["UltiSnips"]
function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippetOrJump()
  if g:ulti_expand_or_jump_res == 0
    if pumvisible()
      return "\<C-N>"
    else
      return "\<TAB>"
    endif
  endif

  return ""
endfunction
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

""" vim-bufferline
let g:bufferline_echo=0

""" vim-airline
let g:airline_powerline_fonts=1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_enable_branch = 1
let g:airline_branch_prefix = ' '
let g:airline_readonly_symbol = ''
let g:airline_linecolumn_prefix = ' '

""" selecta
" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, vim_command)
  try
    silent! exec a:vim_command . " " . system(a:choice_command . " | selecta")
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
  endtry
  redraw!
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
map <leader>f :call SelectaCommand("find $(git rev-parse --show-toplevel) -type f", ":e")<cr>

""" vim-dispatch
autocmd FileType java let b:dispatch = 'javac %'
autocmd FileType coffee let b:dispatch = 'coffee -c %'
autocmd FileType html let b:dispatch = 'open %'
autocmd FileType ruby let b:dispatch = 'rspec %'
nnoremap <leader>d :Dispatch<CR>

""" vim-rspec
let g:rspec_command = "Dispatch bundle exec rspec {spec}"

""" vim-ruby-xmpfilter
autocmd FileType ruby nmap <buffer> <C-m> <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <C-m> <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> <C-n> <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <C-n> <Plug>(xmpfilter-run)

""" vim-latex
let g:tex_flavor='latex'
