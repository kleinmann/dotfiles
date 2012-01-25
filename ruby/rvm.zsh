export rvm_project_rvmrc_default=1
export rvm_pretty_print_flag=1
export LAYOUT_OPTS="--author:Uwe Kleinmann:--type:ruby"

# get the name of the branch we are on
function rvm_prompt_info() {
  ruby_version=$(~/.rvm/bin/rvm-prompt 2> /dev/null) || return
  echo "$ruby_version"
}
