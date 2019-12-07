#!/bin/bash

DOTFILES_PATH="$HOME/dotfiles"

echo '###################'
echo '###  DOTFIELS  ####'
echo '###################'

#download dotfiles
printf 'download dotfiles\n'
if [ -d $DOTFILES_PATH ]; then
	printf 'dotfiles: already exists\n'
else
	printf 'downloading dotfiles ...\n'
	git clone https://github.com/ktpi2000/dotfiles.git
	printf 'successfully downloaded!\n'
fi

#symbolic link
. $DOTFILES_PATH/link.sh

#apt install
printf 'sudo apt update\n'
sudo apt update

packagelist=(
	git
	vim
	zsh
	tmux
)
printf 'start apt install ...\n'
for list in ${packagelist[@]}; do
	printf ${list}
	sudo apt install -y ${list}
done

#change login shell
printf 'ZSH\n'
if [ $SHELL == /bin/zsh ]; then
	printf 'already zsh\n'
else
	printf 'change login shell\n'
	chsh -s /bin/zsh
	printf 'sucessfully changed!'
fi

#Zplugins update
printf 'Zplugins install\n'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

zsh
