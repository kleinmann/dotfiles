alias gc='git commit'
alias gcm='git commit -m'
alias gcp='git commit -p'
alias gs='git status -sb'
alias gd='git diff --color-words'
alias gdc='git diff --cached --color-words'
alias gm='git merge --no-ff --no-commit'
alias gp='git pull'
alias gpr='git stash ; git pull --rebase ; git stash pop'
alias git-amend='git commit --amend'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --all --decorate"
alias changelog="git log --pretty=format:'%an, %aD: %s%n' --reverse | grep -v Merge"
