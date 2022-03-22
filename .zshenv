export LC_ALL=en_US.UTF-8
export TERMINAL=alacritty
export PAGER=less
export EDITOR=nvim
export TERM="xterm-256color"
export GPG_TTY=$(tty)
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'
export RANGER_LOAD_DEFAULT_RC=FALSE
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000
export DISABLE_AUTO_UPDATE="false"
export ZSH=/usr/share/zsh

# PIP
export PATH=$HOME/.local/bin:$PATH

sh .scripts/ghosts
