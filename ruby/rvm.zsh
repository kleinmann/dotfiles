export rvm_project_rvmrc_default=1
export rvm_pretty_print_flag=1
export LAYOUT_OPTS="--author:Uwe Kleinmann:--type:ruby"

[ -f "$HOME/.rvm/scripts/rvm" ] && source $HOME/.rvm/scripts/rvm

# Fix rvm-prompt-info
[ -f "$HOME/.rvm/scripts/rvm" ] && rvm use default 

[ -f "$HOME/.rvm/scripts/rvm" ] && PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# get the name of the branch we are on
function rvm_prompt_info() {
  ruby_version=$(~/.rvm/bin/rvm-prompt 2> /dev/null) || return
  echo "$ruby_version"
}
