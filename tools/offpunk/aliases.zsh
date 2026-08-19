#!/usr/bin/env zsh

if [ -x `which offpunk` &>/dev/null ]; then
  alias offpunk-sync="offpunk --sync --assume-yes --cache-validity 51840"
  alias offpunk-sync-short="offpunk --sync tour to_fetch --assume-yes --cache-validity 51840"
  alias offpunk-later="offpunk --fetch-later `pbpaste`"
fi
