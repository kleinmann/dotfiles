" Build objective-c code by using rake
autocmd FileType objc set makeprg=rake

autocmd FileType ruby,haml,eruby,yaml,html,xml,javascript,sass set ai sw=2 sts=2 et

autocmd FileType python set sw=4 sts=4 et

autocmd BufNewFile,BufReadPost *.json set filetype=json

" Sort CSS properties alphabetically
autocmd FileType css nnoremap <leader>css :g#\({\n\)\@<=#.,/}/sort<cr>)"

autocmd FileType php set sw=4 sts=4 et

autocmd BufNewFile,BufReadPost Capfile set filetype=ruby
autocmd BufNewFile,BufReadPost Cheffile set filetype=ruby
autocmd BufNewFile,BufReadPost Dockerfile set filetype=dockerfile
autocmd BufNewFile,BufReadPost Guardfile set filetype=ruby
autocmd BufNewFile,BufReadPost Procfile set filetype=ruby
autocmd BufNewFile,BufReadPost *.ru set filetype=ruby
autocmd BufNewFile,BufReadPost Vagrantfile set filetype=ruby

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

autocmd FileType tex nnoremap <buffer> <Leader>m :!make ; make clean ; open -g *.pdf<CR>
