# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# For ROS-Humble
# source /opt/ros/humble/setup.zsh

# Set zinit Directory
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if not exist
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Adding zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Adding Snippet
zinit snippet OMZP::git
zinit snippet OMZP::sudo

# Load Completions
# autoload -U compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.configs/zsh/.p10k.zsh ]] || source ~/.configs/zsh/.p10k.zsh

# Keybinds
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# History
HISTSIZE=5000
HISTFILE=~/.config/zsh/history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt inc_append_history
unsetopt EXTENDED_HISTORY

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls -la --color'
alias c='clear'
alias mkdir='mkdir -pv'
alias mv='mv -i'
alias rm='rm -i'
alias ..='cd ..'
alias gs='git status'
alias q='exit'

# Editor and shell Setup
export EDITOR="nvim"
export SHELL="zsh"
export TERMINAL="alacritty"

# Set up fzf
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

# XDG Base Directory Specification
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"

# GnuPG
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"

# XCursor path
export XCURSOR_PATH="/usr/share/icons:${XDG_DATA_HOME}/icons"

# NodeJs
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME}/java"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

# wget
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'

# Set ZDOTDIR to ~/.config/zsh if it isn't already set
if [[ -z "$ZDOTDIR" ]]; then
  export ZDOTDIR=~/.config/zsh
fi

# Specify the new location for the .zcompdump file
autoload -Uz compinit
compinit -d "$ZDOTDIR/.zcompdump"

# Function to switch shells
switch() {
    chsh -s /bin/bash
}

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Changing Node REPL History file location
export NODE_REPL_HISTORY="$XDG_CONFIG_HOME/node_repl_history"
export npm_config_cache=/home/yagna/.local/share/npm

#nvim kickstarter
alias nvim-kickstart='NVIM_APPNAME=nvim-kickstart nvim'
alias nvim-chad='NVIM_APPNAME=nvim-chad nvim'
