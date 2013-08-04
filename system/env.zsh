# Set up editor
export EDITOR=/usr/bin/vim
[ "$SSH_CLIENT" = "" ] && [ `uname` = "Darwin" ] && export EDITOR="$HOME/bin/vim -f"
export SVN_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR
export PAGER=less

# Load colors
if [ -x /usr/bin/dircolors ]; then
	eval "`dircolors -b`"
fi
