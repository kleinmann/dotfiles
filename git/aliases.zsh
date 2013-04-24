[[ -x `which ruby` ]] && [[ `ruby -v` != *jruby* ]] && alias git=hub && alias hub=$HOME/bin/hub
if type compdef >/dev/null; then
   compdef hub=git
fi
alias gs='git status -sb'
alias gd='git diff'
alias gp='git pull'
alias gpr='git stash ; git pull --rebase ; git stash pop'
alias git-amend='git commit --amend'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias changelog="git log --pretty=format:'%an, %aD: %s%n' --reverse | grep -v Merge"
