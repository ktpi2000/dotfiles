# Language
export LANG=ja_JP.UTF-8

# 色を使う
autoload -Uz colors ; colors

# 括弧の自動補完
setopt auto_param_keys

# 8bit文字を有効にする
setopt print_eight_bit

# コマンドのスペルを訂正
setopt correct
# ビープ音を鳴らさない
setopt no_beep

# 自動でlsする
function chpwd() { ls -G }

# スペルミス訂正
setopt correct

# ls color
export LSCOLORS=Gxfxcxdxbxegedabagacad
alias ls="ls -G"
alias ll="ls -lG"
alias la="ls -laG"

# history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt share_history
setopt HIST_IGNORE_DUPS

# ビープ音を鳴らさない
setopt nobeep

# git branch
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd() { vcs_info }
setopt prompt_subst

PROMPT='
%F{118}[%n]%f%~ ${vcs_info_msg_0_}
> '

# 環境変数
export PATH="$PATH:$HOME/flutter/bin"
