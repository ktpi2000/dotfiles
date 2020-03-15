#!/bin/bash

DOTFILES_PATH="$HOME/dotfiles"

echo '###################'
echo '###  DOTFIELS  ####'
echo '###################'

#download dotfiles
printf '\n\033[33mdownload dotfiles\033[m\n'
if [ -d $DOTFILES_PATH ]; then
	printf '\n\033[33mdotfiles: already exists\033[m\n'
else
	printf '\n\033[33mdownload dotfiles ...\033[m\n'
	git clone https://github.com/ktpi2000/dotfiles.git
	printf '\n\033[33msuccessfully downloaded!\033[m\n'
fi

#symbolic link
. $DOTFILES_PATH/link.sh

#apt install
printf '\n\033[33msudo apt update\033[m\n'
sudo apt update

packagelist=(
	git
	vim
	zsh
	tmux
)
printf '\n\033[33mstart apt install ...\033[m\n'
for list in ${packagelist[@]}; do
	echo ''
	echo $list
	sudo apt install -y ${list}
done

#change login shell
printf '\n\033[33mZSH\033[m\n'
if [ $SHELL == /bin/zsh ]; then
	printf '\n\033[33malready zsh\033[m\n'
else
	printf '\n\033[33mchange login shell\033[m\n'
	chsh -s /bin/zsh
	printf '\n\033[33menter password\033[m\n'
	printf '\n\033[33msucessfully changed!\033[m\n'
fi

#Zplugins update
printf '\n\033[33mZinit install\033[m\n'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

#shell reboot
printf '\n\033[33mshell reboot\033[m\n'
exec $SHELL -l
