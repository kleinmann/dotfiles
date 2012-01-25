# speedup by compiling configuration
ZSHRC_COMPILE=1

export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

fpath=($ZSH/zsh/functions $fpath)

autoload -U $ZSH/zsh/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

setopt noflowcontrol

# Remove the slash and dot from WORDCHARS, so it separates words when skipping
export WORDCHARS="${WORDCHARS:s@/@}"
export WORDCHARS="${WORDCHARS:s@\.@}"


bindkey '^[b' backward-word
bindkey '^[f' forward-word
bindkey '^[[1;9A' beginning-of-line
bindkey '^[[1;9B' end-of-line
bindkey '^[[3~' delete-char
