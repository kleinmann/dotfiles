" Build objective-c code by using rake
autocmd FileType objc set makeprg=rake

autocmd FileType ruby,haml,eruby,yaml,html,xml,javascript,sass set ai sw=2 sts=2 et

autocmd FileType python set sw=4 sts=4 et

" Sort CSS properties alphabetically
autocmd FileType css nnoremap <leader>css :g#\({\n\)\@<=#.,/}/sort<cr>)"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd FileType go compiler go

autocmd FileType tex nnoremap <buffer> <Leader>m :!make ; make clean ; open -g *.pdf<CR>
