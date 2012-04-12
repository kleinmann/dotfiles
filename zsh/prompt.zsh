autoload colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:(hg*|git*):*' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b'
zstyle ':vcs_info:*' enable git svn hg

setopt no_beep
setopt auto_cd
setopt multios
setopt prompt_subst
