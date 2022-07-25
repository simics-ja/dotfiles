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
. $(brew --prefix)/opt/asdf/libexec/asdf.sh

# sheldon
eval "$(sheldon source)"

# starship
eval "$(starship init zsh)"

#
# Customization
#

# Unpushed dotfiles reminder
if test -n "$(git -C $HOME/dotfiles status --porcelain)" ||
  ! git -C $HOME/dotfiles diff --exit-code --stat --cached origin/main > /dev/null ; then
  echo -e "\e[33mNotice: Unpushed dotfiles are detected. Please commit and push the dotfiles."
fi


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
if type exa > /dev/null 2>&1; then 
  alias ls='exa'
  alias la='exa -la'
  alias l='exa -lG'
  alias ll='exa -laG'
fi

# zoxide & auto exa alias
if type z > /dev/null 2>&1 && type exa > /dev/null 2>&1; then 
  j(){z $@ && exa --icons}
  ji(){zi && exa --icons}
fi

# Fig post block. Keep at the bottom of this file.
if [[ $OSTYPE==darwin* ]]; then
  [[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && . "$HOME/.fig/shell/zshrc.post.zsh"
fi
