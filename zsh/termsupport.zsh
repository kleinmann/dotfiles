#usage: title short_tab_title looooooooooooooooooooooggggggg_windows_title
#http://www.faqs.org/docs/Linux-mini/Xterm-Title.html#ss3.1
#Fully support screen, iterm, and probably most modern xterm and rxvt
#Limited support for Apple Terminal (Terminal can't set window or tab separately)
function title {
  [ "$DISABLE_AUTO_TITLE" != "true" ] || return
  if [[ "$TERM" == screen* ]]; then 
    print -Pn "\ek$1:q\e\\" #set screen hardstatus, usually truncated at 20 chars
  elif [[ "$TERM" == xterm* ]] || [[ $TERM == rxvt* ]] || [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
    print -Pn "\e]2;$2:q\a" #set window name
    print -Pn "\e]1;$1:q\a" #set icon (=tab) name (will override window name on broken terminal)
  fi
}

ZSH_THEME_TERM_TAB_TITLE_IDLE="%15<..<%~%<<" #15 char left truncated PWD
ZSH_THEME_TERM_TITLE_IDLE="%n@%m: %~"

# Appears when you have the prompt
function precmd {
  # print one line of --- before each prompt
  let fillsize=${COLUMNS}
  fill=""
  while [ "$fillsize" -gt "0" ]
  do
    fill="-${fill}" # fill with underscores to work on 
    let fillsize=${fillsize}-1
  done

  title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE

  zstyle ':vcs_info:*' actionformats \
    "%F{magenta}(%f%s%F{magenta})%F{yellow}-%F{magenta}%F{green}%b%F{yellow}|%F{red}%a%F{magenta}%f" \
    "zsh: %r"

  zstyle ':vcs_info:*' formats \
    "%F{magenta}(%f%s%F{magenta})%F{yellow}-%F{magenta}%F{green}%b%F{red}+%Q%F{magenta}%f%}" \
    "zsh: %r"

  zstyle ':vcs_info:git:*' actionformats \
    "%F{magenta}%F{green}%b%F{red}%c%u%F{yellow}|%F{red}%a%F{magenta}%f" \
    "zsh: %r"

  zstyle ':vcs_info:git:*' formats \
    "%F{magenta}%F{green}%b%F{red}%c%u%F{magenta}%f" \
    "zsh: %r"

  vcs_info
}

# Appears at the beginning of (and during) of command execution
function preexec {
  emulate -L zsh
  setopt extended_glob
  local CMD=${1[(wr)^(*=*|sudo|ssh|-*)]} #cmd name only, or if this is sudo or ssh, the next cmd
  title "$CMD" "%100>...>$2%<<"

  echo -ne "\e[0m"
}
