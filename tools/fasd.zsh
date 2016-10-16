fasd_cache="$HOME/.fasd-init-zsh"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init auto >| "$fasd_cache"
fi
[ -f "$fasd_cache" ] && source "$fasd_cache"
unset fasd_cache

alias v='f -e vim'
alias k='f -e kak'
alias o='a -e open'
