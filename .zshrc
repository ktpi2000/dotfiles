# Language
export LANG=ja_JP.UTF-8

# 色を使う
autoload -Uz colors ; colors

# 括弧の自動補完
setopt auto_param_keys

# 8bit文字を有効にする
setopt print_eight_bit

# エディタをvimに設定
export EDITOR=vim

# コマンドのスペルを訂正
setopt correct

# ビープ音を鳴らさない
setopt no_beep

# 自動でlsする
function chpwd() { ls -G }

setopt prompt_subst

precmd () { 
  if [ -n "$(git status --short 2>/dev/null)" ];then
    export GIT_HAS_DIFF="+"
    export GIT_NON_DIFF=""
  else 
    export GIT_HAS_DIFF=""
    export GIT_NON_DIFF="✔"
  fi
  # git管理されているか確認
  git status --porcelain >/dev/null 2>&1
  if [ $? -ne 0 ];then
    export GIT_HAS_DIFF=""
    export GIT_NON_DIFF=""
  fi
  export BRANCH_NAME=$(git branch --show-current 2>/dev/null)
}

PROMPT=" 
%F{cyan}[%n@%m]%f%~"
PROMPT=${PROMPT}'%F{green}  ${BRANCH_NAME} ${GIT_NON_DIFF}%F{red}${GIT_HAS_DIFF} 
%f$ '

# スペルミス訂正
setopt correct

# ls color
export LSCOLORS=Gxfxcxdxbxegedabagacad
alias ls="ls -G"
alias ll="ls -lG"
alias la="ls -laG"

# zsh log
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=30000
export SAVEHIST=30000
setopt hist_ignore_all_dups
setopt EXTENDED_HISTORY
setopt share_history

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
