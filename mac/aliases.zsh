# Remove all items safely, to Trash (`brew install trash`).
alias rm='trash'

# Case-insensitive pgrep that outputs full path.
alias pgrep='pgrep -fli'

# Lock current session and proceed to the login screen.
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

# Sniff network info.
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
