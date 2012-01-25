[[ -x `which ruby` ]] && alias git=hub
alias gs='git status'
alias gd='git diff'
alias gp='git pull'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias changelog="git log --pretty=format:'%an, %aD: %s%n' --reverse | grep -v Merge"
