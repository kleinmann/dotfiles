# Remove all items safely, to Trash (`brew install trash`).
(( $+commands[trash] )) && alias rm='trash'

# Case-insensitive pgrep that outputs full path.
[ `uname` = "Darwin" ] && alias pgrep='pgrep -fli'

# Lock current session and proceed to the login screen.
[ `uname` = "Darwin" ] && alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

# Sniff network info.
[ `uname` = "Darwin" ] && alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
