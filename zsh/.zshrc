# Fig pre block. Keep at the top of this file.
if [[ $OSTYPE==darwin* ]]; then
  [[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && . "$HOME/.fig/shell/zshrc.pre.zsh"
fi
#

# Environment variables
#

# PATH
export PATH=$PATH:$HOME/.cargo/bin

# GOPATH
export GOPATH=$HOME/.go

# fzf
export FZF_DEFAULT_OPTS='--height 60% --reverse --border'

# grep
export GREP_COLOR='01:31'

#
# Initialization
#

# asdf
. /usr/local/opt/asdf/libexec/asdf.sh

# sheldon
eval "$(sheldon source)"

# starship
eval "$(starship init zsh)"


#
# Customization
#

# zsh history optimizer
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_NO_STORE

# anyframe keybind
bindkey '^p' anyframe-widget-put-history
bindkey '^r' anyframe-widget-execute-history

# exa
alias ls='exa'
alias la='exa -la'
alias l='exa -lG'
alias ll='exa -laG'

# zoxide & auto exa
j(){z $@ && exa --icons}
ji(){zi && exa --icons}

# Fig post block. Keep at the bottom of this file.
if [[ $OSTYPE==darwin* ]]; then
  [[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
fi
