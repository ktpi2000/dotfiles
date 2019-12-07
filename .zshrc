# -----------------------------
# Lang
# -----------------------------
export LANG=ja_JP.UTF-8

# -----------------------------
# tmux auto attach
# -----------------------------
function is_exists() { type "$1" >/dev/null 2>&1; return $?; }
function is_osx() { [[ $OSTYPE == darwin* ]]; }
function is_screen_running() { [ ! -z "$STY" ]; }
function is_tmux_runnning() { [ ! -z "$TMUX" ]; }
function is_screen_or_tmux_running() { is_screen_running || is_tmux_runnning; }
function shell_has_started_interactively() { [ ! -z "$PS1" ]; }
function is_ssh_running() { [ ! -z "$SSH_CONECTION" ]; }

function tmux_automatically_attach_session()
{
    if is_screen_or_tmux_running; then
        ! is_exists 'tmux' && return 1

        if is_tmux_runnning; then
            echo "${fg_bold[red]} _____ __  __ _   ___  __ ${reset_color}"
            echo "${fg_bold[red]}|_   _|  \/  | | | \ \/ / ${reset_color}"
            echo "${fg_bold[red]}  | | | |\/| | | | |\  /  ${reset_color}"
            echo "${fg_bold[red]}  | | | |  | | |_| |/  \  ${reset_color}"
            echo "${fg_bold[red]}  |_| |_|  |_|\___//_/\_\ ${reset_color}"
        elif is_screen_running; then
            echo "This is on screen."
        fi
    else
        if shell_has_started_interactively && ! is_ssh_running; then
            if ! is_exists 'tmux'; then
                echo 'Error: tmux command not found' 2>&1
                return 1
            fi

            if tmux has-session >/dev/null 2>&1 && tmux list-sessions | grep -qE '.*]$'; then
                # detached session exists
                tmux list-sessions
                echo -n "Tmux: attach? (y/N/num) "
                read
                if [[ "$REPLY" =~ ^[Yy]$ ]] || [[ "$REPLY" == '' ]]; then
                    tmux attach-session
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                elif [[ "$REPLY" =~ ^[0-9]+$ ]]; then
                    tmux attach -t "$REPLY"
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                fi
            fi

            if is_osx && is_exists 'reattach-to-user-namespace'; then
                # on OS X force tmux's default command
                # to spawn a shell in the user's namespace
                tmux_config=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))
                tmux -f <(echo "$tmux_config") new-session && echo "$(tmux -V) created new session supported OS X"
            else
                tmux new-session && echo "tmux created new session"
            fi
        fi
    fi
}
tmux_automatically_attach_session

# -----------------------------
# General
# -----------------------------
#色を使う
autoload -Uz colors ; colors

#括弧の自動補完
setopt auto_param_keys

#8bit文字を有効にする
setopt print_eight_bit

#ヒストリ
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt share_history

# -----------------------------
# alias
# -----------------------------
alias ls='ls --color -F'

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
zplugin light 'zsh-users/zsh-autosuggestions'
zplugin light 'zsh-users/zsh-syntax-highlighting'
zplugin ice from"gh"

# -----------------------------
# configuration
# -----------------------------
#vcs_info読込
autoload -Uz vcs_info
## %b ブランチ名
## %a アクション名(merge, rebase ...)
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{yellow}!'
zstyle ':vcs_info:*' unstagedstr '%F{red}+'
zstyle ':vcs_info:*' formats '%F{green}%c%u[%b]%f '
zstyle ':vcs_info:*' actionformats ' [%b|%a] '
precmd() { vcs_info }
setopt prompt_subst

# -----------------------------
# PROMPT
# -----------------------------
## %B 太字
PROMPT='%B%K{064}%F{255} %n@%m %f%k%K{028}%F{225} %~ %f%k${vcs_info_msg_0_}%F{064}>%f%b'
