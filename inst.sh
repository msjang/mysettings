#!/bin/bash

BAK_DIR=~/cfg_bak_$(date +%s)

back() {
	mkdir -p $BAK_DIR
	mv ~/$1 $BAK_DIR
}

inst() {
	back $2
	ln -s $PWD/cfg/$1 ~/$2
}

inst bash_profile      .bash_profile
inst bashrc            .bashrc
inst gitconfig         .gitconfig
inst gitconfig_vimdiff .gitconfig.bak

ls -al ~ | grep "\->"
