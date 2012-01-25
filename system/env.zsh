# Set up editor
export EDITOR=/usr/bin/vim
[ "$SSH_CLIENT" = "" ] && [ `uname` = "Darwin" ] && export EDITOR='~/bin/vim -f'
export SVN_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR

# Use CDPATH, cd searches there automatically
export CDPATH=.:$HOME

# Load colors
if [ -x /usr/bin/dircolors ]; then
	eval "`dircolors -b`"
fi
