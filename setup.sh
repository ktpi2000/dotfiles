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
if [ $SHELL == $(which zsh) ]; then
	printf 'already zsh\n'
else
	print 'change login shell\n'
	grep "$(which zsh)" /etc/shells &>/dev/null || sudo sh -c "echo $(which zsh) >> /etc/shells"
	chsh -s $(which zsh)
	printf 'sucessfully changed!'
fi

#Zplugins update
printf 'Zplugins update\n'
zplugin update --all

source ~/.zshrc

printf 'done!'
