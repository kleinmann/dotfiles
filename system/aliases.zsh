# ls aliases
# colors in ls are different on Mac & Linux
[ `uname` = "Linux" ] && alias ls='ls --color=auto'
[ `uname` = "Darwin" ] && alias ls='ls -G'
alias l='ls -lah'
alias l.='l -d .[^.]*'

# use mvim if I'm using Mac and this isn't a ssh session
[ "$SSH_CLIENT" = "" ] && [ `uname` = "Darwin" ] && alias vim='mvim'

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
alias cdtp='cd $HOME/code/dtp-automation'
alias cds='cd "$HOME/Dropbox/Studium Priv/Vorlesungen/6. Semester - SS12/"'
alias cdp='cd "$HOME/code"'
alias cdd='cd "$HOME/.dotfiles"'

