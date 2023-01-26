# Uses git's autocompletion for inner commands. Assumes an install of git's
# bash `git-completion` script at $completion below (this is where Homebrew
# tosses it, at least).
[ -f /usr/local/share/zsh/site-functions/_git ] && completion=/usr/local/share/zsh/site-functions/_git
[ -f /opt/homebrew/share/zsh/site-functions/_git ] && completion=/opt/homebrew/share/zsh/site-functions/_git

if [[ -f $completion ]];
then
  export FPATH="$completion:$FPATH"
fi
