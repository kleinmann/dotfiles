if which rbenv > /dev/null; then
  eval "$(rbenv init - --no-rehash)"
fi

function rbenv_prompt_info() {
  version_string=$(rbenv version-name)
  [ -f "$(pwd)/.rbenv-gemsets" ] && gemset_string=" ⟡$(rbenv gemset active | cut -d' ' -f1)"
  if [ ! $version_string = '' ]; then
    echo "$version_string$gemset_string"
  fi
}
