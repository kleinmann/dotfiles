# Replacement for ls
[[ -x "`which eza`" ]] && alias ls='eza'
[[ -x "`which eza`" ]] && alias l='eza -labF --color auto --git'
