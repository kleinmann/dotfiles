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
#alias s='screen -rxA'
#alias sn='screen -t $@'

# tmux aliases
alias t='tmux attach'

# cd aliases
alias ..='cd .. ; '
alias ...='cd ../.. ; '
alias cdw='cd "$HOME/code/k10r"'
alias cdp='cd "$HOME/code"'
alias cdc='cd "$HOME/code/checkout"'
alias cdd='cd "$HOME/.dotfiles"'
alias cdgo='cd "$GOPATH"'

alias ip6="curl -6 icanhazip.com"
alias ip4="curl -4 icanhazip.com"
alias p8="ping 8.8.8.8"
