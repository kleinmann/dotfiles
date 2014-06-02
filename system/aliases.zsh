# ls aliases
# colors in ls are different on Mac & Linux
[ `uname` = "Linux" ] && alias ls='ls --color=auto'
[ `uname` = "Darwin" ] && alias ls='ls -G'
alias l='ls -lah'
alias l.='l -d .[^.]*'

if [[ -x "`which src-hilite-lesspipe.sh`" ]]; then
  export LESSOPEN="| `which src-hilite-lesspipe.sh` %s"
  export LESS=' -R '
fi

# screen aliases
alias s='screen -rxA'
alias sn='screen -t $@'

# tmux aliases
alias t='tmux attach'

# cd aliases
alias ..='cd .. ; '
alias ...='cd ../.. ; '
alias cdw='cd $HOME/code/codekunst'
alias cdp='cd "$HOME/code"'
alias cdc='cd "$HOME/code/checkout"'
alias cdd='cd "$HOME/.dotfiles"'
alias cdv='cd "$HOME/.vim/config"'
alias cdgo='cd "$GOPATH"'

alias smile='curl http://smiley.meatcub.es:1337'

