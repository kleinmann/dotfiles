[[ -x `which bat` ]] &> /dev/null && export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export BAT_THEME="base16"
[[ -x `which bat` ]] &> /dev/null && alias cat=bat
