# speedup by compiling configuration
ZSHRC_COMPILE=1

export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

# Prevent OS X from creating ._ files.
export COPYFILE_DISABLE=true

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

bindkey -v

bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "^H" backward-delete-word
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey '^i' expand-or-complete-prefix
bindkey '\e[3~' delete-char
bindkey '^R' history-incremental-search-backward

# Include local settings if there are any
[ -f $HOME/.zshrc_local ] && source $HOME/.zshrc_local
