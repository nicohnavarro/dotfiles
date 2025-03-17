# =============================================================================
# ZSH Configuration - Improved
# =============================================================================

# --------------------------------
# Core ZSH Settings
# --------------------------------
setopt prompt_subst
setopt auto_cd                 # Auto change directory without cd
setopt auto_pushd              # Push the current directory onto the stack
setopt pushd_ignore_dups       # Don't push duplicates onto the stack
setopt extended_glob           # Extended globbing
setopt hist_ignore_all_dups    # Don't save duplicates in history
setopt hist_ignore_space       # Don't save commands starting with space
setopt share_history           # Share history between sessions
setopt interactive_comments    # Allow comments in interactive shells

# History configuration
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Completion system
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' verbose yes
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

autoload -Uz compinit bashcompinit
compinit
bashcompinit

# --------------------------------
# Key Bindings
# --------------------------------
# Vi mode
bindkey -v
bindkey jj vi-cmd-mode
export KEYTIMEOUT=20  # Reduce delay when switching modes

# Custom key bindings
bindkey '^w' autosuggest-execute
bindkey '^e' autosuggest-accept
bindkey '^u' autosuggest-toggle
bindkey '^L' vi-forward-word
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search
bindkey '^r' atuin-search  # Enhanced history search with atuin
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^[[1;5C' forward-word  # Ctrl+right
bindkey '^[[1;5D' backward-word # Ctrl+left

# --------------------------------
# Aliases
# --------------------------------
# General
alias cat="bat"
alias cl="clear && printf '\e[3J\e[H\e[2J' && clear"
alias ls="lsd"
alias ll="ls -la"
alias la="tree"
alias grep="grep --color=auto"
alias mkdir="mkdir -p"
alias df="df -h"
alias du="du -h"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# Git
alias gg="lazygit"
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'
alias gf='git fetch --all'

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"
alias dstop='docker stop $(docker ps -q 2>/dev/null) 2>/dev/null'
alias dprune="docker system prune -af"

# Directory navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Eza (modern ls replacement)
alias l="eza -l --icons --git -a"
alias lt="eza --tree --level=2 --long --icons --git"
alias ltree="eza --tree --level=2 --icons --git"
alias lm="eza -l --icons --git -a --sort=modified"
alias lsize="eza -l --icons --git -a --sort=size"

# Tmux
alias dev="tmux a -t dev || tmux new -s dev"
alias work="tmux a -t work || tmux new -s work"

# HTTP requests
alias http="xh"

# Nmap
alias nm="nmap -sC -sV -oN nmap"

# Python
alias pip="pip3"
alias python="python3"
alias venv="python -m venv .venv && source .venv/bin/activate"
alias activate="source .venv/bin/activate 2>/dev/null || source venv/bin/activate 2>/dev/null || echo 'No virtual environment found'"

# VIM
alias v="/Users/nicohnavarro/.nix-profile/bin/nvim"
alias vim="nvim"

# --------------------------------
# Environment Variables
# --------------------------------
# Language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Editor
export EDITOR=/opt/homebrew/bin/nvim
export VISUAL=/opt/homebrew/bin/nvim

# GO
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

# FZF
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --preview 'bat --color=always {}'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"
export FZF_ALT_C_OPTS="--preview 'eza --tree --level=1 --icons --git {}'"

# Starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# --------------------------------
# Path Configuration
# --------------------------------
# Ensure path arrays don't contain duplicates
typeset -U path PATH

# Set path components
path=(
  /opt/homebrew/bin
  /usr/local/bin
  /usr/bin
  /bin
  /usr/sbin
  /sbin
  $HOME/.local/bin
  $GOPATH/bin
  $HOME/.cargo/bin
  $PNPM_HOME
  $path
)

export PATH

# --------------------------------
# Functions
# --------------------------------
# Enhanced navigation
cx() { cd "$@" && l; }
fcd() { cd "$(fd --type d --hidden --exclude .git | fzf)" && l; }
f() { echo "$(fd --type f --hidden --exclude .git | fzf)" | pbcopy; }
fv() { nvim "$(fd --type f --hidden --exclude .git | fzf)"; }

# Create and enter directory
mkcd() { mkdir -p "$1" && cd "$1"; }

# Extract various archive formats
extract() {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Git clone and cd into it
gclone() {
  git clone "$1" && cd "$(basename "$1" .git)"
}

# --------------------------------
# Plugin Initialization
# --------------------------------
# Load syntax highlighting and autosuggestions
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Initialize tools
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
eval "$(direnv hook zsh)"

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use  # This loads nvm without using it immediately
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# PNPM
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# --------------------------------
# Kubernetes (Uncomment when needed)
# --------------------------------
#export KUBECONFIG=~/.kube/config
#alias k="kubectl"
#alias ka="kubectl apply -f"
#alias kg="kubectl get"
#alias kd="kubectl describe"
#alias kdel="kubectl delete"
#alias kl="kubectl logs -f"
#alias kgpo="kubectl get pod"
#alias kgd="kubectl get deployments"
#alias kc="kubectx"
#alias kns="kubens"
#alias ke="kubectl exec -it"
#alias kcns='kubectl config set-context --current --namespace'

# --------------------------------
# Performance Optimization
# --------------------------------
# Lazy load nvm for faster shell startup
nvm() {
  unset -f nvm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  nvm "$@"
}

node() {
  unset -f node
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  node "$@"
}

npm() {
  unset -f npm
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  npm "$@"
}

# --------------------------------
# Custom Local Configuration
# --------------------------------
# Source local configuration if it exists
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
