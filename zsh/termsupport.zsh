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
function prompt_hook {
  # print one line of --- before each prompt
  let fillsize=${COLUMNS}
  fill=""
  while [ "$fillsize" -gt "0" ]
  do
    fill="-${fill}" # fill with underscores to work on
    let fillsize=${fillsize}-1
  done

  title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE

  CLEAN_INFO=''
  if [[ $(git rev-parse --git-dir 2> /dev/null) != "" ]] {
    # checks if we are in a git repository
    if [[ $(git ls-files -m 2> /dev/null) == "" ]] {
      # checks for any changed files
      CLEAN_INFO=' %F{green}✔%f '
    }
  }
  if [[ $(git diff --name-only --cached 2> /dev/null) != "" ]] {
    # staged files
    CLEAN_INFO=' %F{red}✗%f'
  }
  if [[ $(git ls-files -m 2> /dev/null) != "" ]] {
    # modified files
    CLEAN_INFO=' %F{red}✗%f'
  }

  zstyle ':vcs_info:*' stagedstr '%f'
  zstyle ':vcs_info:*' unstagedstr '%f'
  zstyle ':vcs_info:*' actionformats \
    "%f(%s)%F{yellow}-%F{blue}%b%f@%F{yellow}%i%F{magenta}|%F{red}%a%f" \
    "zsh: %r"
  zstyle ':vcs_info:*' formats \
    "%f(%s)%F{yellow}-%F{blue}%b%f@%F{yellow}%i%F{red}%f" \
    "zsh: %r"
  zstyle ':vcs_info:(hg*|git*):*' actionformats \
    "%f(%s)%F{yellow}-%F{blue}%b%f@%F{yellow}%7.7i%F{magenta}|%F{red}%a%f%{$CLEAN_INFO%}" \
    "zsh: %r"
  zstyle ':vcs_info:(hg*|git*):*' formats \
    "%f(%s)%F{yellow}-%F{blue}%b%f@%F{yellow}%7.7i%F{red}%u%c%f%{$CLEAN_INFO%}" \
    "zsh: %r"

  vcs_info
}
precmd_functions+=(prompt_hook)

_Z_NO_RESOLVE_SYMLINKS=1
. $HOME/bin/z

# Appears at the beginning of (and during) of command execution
function preexec {
  emulate -L zsh
  setopt extended_glob
  local CMD=${1[(wr)^(*=*|sudo|ssh|-*)]} #cmd name only, or if this is sudo or ssh, the next cmd
  title "$CMD" "%100>...>$2%<<"

  echo -ne "\e[0m"
}
