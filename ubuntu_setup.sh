#!/bin/bash

# エラー or 未定義変数があったら停止
set -eu

# コマンドがあるか
function has() {
    return `type $1 > /dev/null 2>&1`
}

# update
yes | sudo apt update
yes | sudo apt upgrade

# install
sudo apt install -y git curl zsh

# 日本語フォルダを英語表記に変更
env LANGUAGE=C LC_MESSAGES=C xdg-user-dirs-gtk-update

# dotfilesのダウンロード
DOTFILES_PATH="$HOME/dotfiles"
cd $HOME
if [ ! -d $DOTFILES_PATH ]; then
    if has 'git'; then
        git clone https://github.com/ktpi2000/dotfiles
    elif has 'wget'; then
        wget https://github.com/ktpi2000/dotfiles/archive/master.tar.gz
        tar -zxvf master.tar.gz
        mv -f dotfiles-master ~/dotfiles
    fi
fi

# dotfilesがあるか確認
cd ~/dotfiles
if [ $? -ne 0 ]; then
    echo "dotfiles not found!!!"
fi

# zinitのインストール
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

# シェルの変更
chsh -s /bin/zsh
zsh

# シンボリックリンク
cd ~/dotfiles
chmod +x link.sh
./link.sh

exec $SHELL -l
