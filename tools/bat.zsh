[[ -x `which bat` ]] &> /dev/null && export MANPAGER="sh -c 'col -bx | bat -l man -p --wrap=never'"
export BAT_THEME="Catppuccin Mocha"
[[ -x `which bat` ]] &> /dev/null && alias cat="bat --wrap=never"
