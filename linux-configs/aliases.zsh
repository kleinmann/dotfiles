# display aliases
# test apps with 'DISPLAY=:1.0 app'
alias xeph='Xephyr -ac -br -noreset -screen 1024x768 :1'
alias brightness_plus='echo `cat /sys/class/backlight/nvidia_backlight/brightness` + 100 | bc | sudo tee /sys/class/backlight/nvidia_backlight/brightness > /dev/null 2>&1'
alias brightness_minus='echo `cat /sys/class/backlight/nvidia_backlight/brightness` - 100 | bc | sudo tee /sys/class/backlight/nvidia_backlight/brightness > /dev/null 2>&1'

# system aliases
alias aptu='sudo aptitude update ; sudo aptitude full-upgrade'
alias suspend='echo -n "mem" | sudo tee -a /sys/power/state'

alias yu='yaourt -Syua'
