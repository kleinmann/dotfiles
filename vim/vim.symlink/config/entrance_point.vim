" "Vundle" config
runtime! config/vundle.vim

" "Basics" config
runtime! config/basics.vim

" "Look and Feel" config
runtime! config/look_and_feel.vim

" "Shortcuts" config
runtime! config/shortcuts.vim

" "Plugins" config
runtime! config/plugins.vim

" "Filetype" custom config
runtime! config/filetypes.vim

" "Local" machine config
if filereadable(expand("~/.vimrc_local"))
  source ~/.vimrc_local
endif
