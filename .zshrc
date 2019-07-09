# -----------------------------
# Lang
# -----------------------------
export LANG=ja_JP.UTF-8

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
# export
# -----------------------------
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin

# -----------------------------
# Zplugin
# -----------------------------
source "$HOME/.zplugin/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps}  )) && _comps[zplugin]=_zplugin
zplugin load 'zsh-users/zsh-autosuggestions'
zplugin load 'zsh-users/zsh-syntax-highlighting'
zplugin ice from"gh"
zplugin load 'bhilburn/powerlevel9k'

# -----------------------------
# powerlevel9k
# -----------------------------
POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(nvm node_version)
		  
POWERLEVEL9K_OS_ICON_BACKGROUND="green"
POWERLEVEL9K_OS_ICON_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_FOREGROUND="white"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="white"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="white"
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
