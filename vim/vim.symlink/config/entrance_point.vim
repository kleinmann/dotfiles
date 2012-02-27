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
" $ cat ~/.vimrc
"
" My ~/.vimrc run this file, so if you want to use my vim config you
" should type in rc file just a one line below
"
" runtime! config/entrance_point.vim
"
"*****************************************************************************"
 "                                                                           "

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

 "                                                                           "
"*****************************************************************************"
"
" Auto commands
"
"*****************************************************************************"
 "                                                                           "
