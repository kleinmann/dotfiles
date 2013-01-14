# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# approximate matching
zstyle ':completion:*' completer _expand _complete _match _approximate
zstyle ':completion*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# tab completion for PIDs
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

unsetopt nomatch

fpath=(/usr/local/share/zsh-completions $fpath)
