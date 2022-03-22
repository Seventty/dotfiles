# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# ---
## Use powerline
#USE_POWERLINE="true"
# Source manjaro-zsh-configuration
#if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
#  source /usr/share/zsh/manjaro-zsh-config
#fi
## Use manjaro zsh prompt
#if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#  source /usr/share/zsh/manjaro-zsh-prompt
#fi
## To customize prompt, run `p10k configure` or edit /usr/share/zsh/p10k.zsh.
#[[ ! -f /usr/share/zsh/p10k.zsh ]] || source /usr/share/zsh/p10k.zsh

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# ---
# Use "the genuine" powerline
# See https://wiki.archlinux.org/index.php/Powerline#Zsh
#prompt off
powerline-daemon -q
. /usr/share/powerline/bindings/zsh/powerline.zsh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

plugins=(
	colorize
	copyfile
	docker
	docker-compose
	git
	gitfast
	kubectl
	safe-paste	
)

while IFS= read -r script
do
    source "$script"
done < <(find /usr/share/zsh/plugins/ -maxdepth 2 -type f -name "*.zsh" ! -name '*plugin.zsh')

source $(dirname $(gem which colorls))/tab_complete.sh

# the detailed meaning of the below three variable can be found in `man zshparam`.
export HISTFILE=~/.histfile
export HISTSIZE=1000000   # the number of items for the internal history list
export SAVEHIST=1000000   # maximum number of items for the history file

export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
alias ls='ls $LS_OPTIONS'


# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution
setopt EXTENDED_HISTORY  # record command start time

setopt autocd extendedglob nomatch notify appendhistory sharehistory incappendhistory HIST_IGNORE_SPACE COMPLETE_ALIASES
unsetopt beep
bindkey -e

alias ls='colorls'
alias la='colorls -a'
alias lla='ls -la'
alias x='ranger'
alias pfile='pcmanfm'
alias vi=vim
alias v=nvim
alias icat="kitty +kitten icat"
