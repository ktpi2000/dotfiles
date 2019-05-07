# Created by newuser for 5.4.2

# -----------------------------
# Lang
# -----------------------------
#export LANG=ja_JP.UTF-8
#export LESSCHARSET=utf-8


# -----------------------------
# General
# -----------------------------
#色を使う
autoload -Uz colors ; colors

#括弧の自動補完
setopt auto_param_keys

#8bit文字を有効にする
setopt print_eight_bit


# -----------------------------
# zplug
# -----------------------------

source ~/.zplug/init.zsh

# zplug-def
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-syntax-highlighting'

# 未インストール項目をインストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load
