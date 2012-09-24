# COLOR_NC="\033[0m" # No Color
# COLOR_WHITE="\033[1;37m"
# COLOR_BLACK="\033[0;30m"
# COLOR_BLUE="\033[0;34m"
# COLOR_LIGHT_BLUE="\033[1;34m"
# COLOR_GREEN="\033[0;32m"
# COLOR_LIGHT_GREEN="\033[1;32m"
# COLOR_CYAN="\033[0;36m"
# COLOR_LIGHT_CYAN="\033[1;36m"
# COLOR_RED="\033[0;31m"
# COLOR_LIGHT_RED="\033[1;31m"
# COLOR_PURPLE="\033[0;35m"
# COLOR_LIGHT_PURPLE="\033[1;35m"
# COLOR_BROWN="\033[0;33m"
# COLOR_YELLOW="\033[1;33m"
# COLOR_GRAY="\033[1;30m"
# COLOR_LIGHT_GRAY="\033[0;37m"

LIGHTNING_BOLT="⚡︎"
UP_ARROW="↑"
DOWN_ARROW="↓"
UD_ARROW="↕"
FF_ARROW="→"
RECYCLE="♺"
MIDDOT="•"
PLUSMINUS="±"

ZSH_THEME_GIT_PROMPT_DIRTY="\e[0;31m$MIDDOT\e[0m"
ZSH_THEME_GIT_PROMPT_CLEAN="\e[0;32m$MIDDOT\e[0m"
ZSH_THEME_GIT_PROMPT_AHEAD="\e[1;33m$UP_ARROW\e[0m"

# Save a smiley to a local variable if the last command didn't exit with success.
local smiley=$'%(?,%{\e[0;32m%}%{\e[0m%},%{\e[0;31m%}☹%{\e[0m%})'

function battery_charge {
  if [[ $(ioreg -rc AppleSmartBattery 2> /dev/null) != "" ]] {
    echo " "
    echo `batcharge` 2>/dev/null
  }
}

# user, host, full path, and time/date
# on two lines for easier vgrepping
# entry in a nice long thread on the Arch Linux forums: http://bbs.archlinux.org/viewtopic.php?pid=521888#p521888
PROMPT=$'$fill
%{\e[0;34m%}%B┌─%{\e[0m%}%B[%b%{\e[0m%}%{\e[1;32m%}%n%{\e[1;30m%}@%{\e[0m%}%{\e[0;33m%}%m%{\e[0m%}%B]%b%{\e[0m%}:%b%{\e[0m%}%B[%b%{\e[1;32m%}%~%{\e[0m%}%B]%b%{\e[0m%} - %B(%b$(rvm_prompt_info)%B)%b - %B[%b${vcs_info_msg_0_}%B]%b - %{\e[0;34m%}%B[%b%{\e[0;34m%}'%D{"%a %b %d, %I:%M:%S"}%b$'%{\e[0;34m%}%B]%b%{\e[0m%}
%{\e[0;34m%}%B└─${LIGHTNING_BOLT}%{\e[0m%}%{\e[0;37m%}%{\e[0m%}%B '
PS2=$'%{\e[0;34m%}%B└─\e[0;34m%}%B(%b%{\e[0m%}%_%B)>%{\e[0m%}%b '
RPROMPT=$'${smiley}$(git-cwd-info 2> /dev/null)$(battery_charge)'
