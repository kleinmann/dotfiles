#!/bin/bash

function upd() {
	CURRENT_DIR=`pwd`
	cd .dotfiles/ ; git pull ; git submodule update --init
	if [[ -x `which rake` ]]; then
		rake install
	else
		./install
	fi
	git submodule foreach git checkout master
	git submodule foreach git pull origin master
	cd $CURRENT_DIR
}
