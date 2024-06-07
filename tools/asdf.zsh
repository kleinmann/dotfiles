[ -f $(brew --prefix asdf)/asdf.sh ] && . $(brew --prefix asdf)/asdf.sh
[ -f $(brew --prefix asdf)/libexec/asdf.sh ] && . $(brew --prefix asdf)/libexec/asdf.sh
export PATH="$HOME/.asdf/shims:$PATH"
