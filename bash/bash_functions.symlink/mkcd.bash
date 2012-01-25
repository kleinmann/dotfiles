#!/bin/bash

function mkcd() {
	[ -n "$1" ] && mkdir -p "$@" && cd "$1";
}
