#
# PATH variables
#

# PATH
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.go/bin
export PATH=$PATH:$HOME/.composer/vendor/bin
export PATH="/opt/homebrew/opt/bison/bin:$PATH"
export PATH="/opt/homebrew/opt/m4/bin:$PATH"

# GOPATH
export GOPATH=$HOME/.go

#
# Initialization
#

# homebrew
export HOMEBREW_NO_AUTO_UPDATE=1
# Comment out the following line if you want to install old versions of software
# export HOMEBREW_NO_INSTALL_FROM_API=1

# mise
eval "$(mise activate zsh)"

# sheldon
eval "$(sheldon source)"

# starship
eval "$(starship init zsh)"

# direnv
export EDITOR=vim
eval "$(direnv hook zsh)"

# local settings for individual machine
# need to make .zshrc.local (ignored by git)
test -e $HOME/dotfiles/zsh/.zshrc.local && source $HOME/dotfiles/zsh/.zshrc.local

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

# fzf
export FZF_DEFAULT_OPTS='--height 60% --reverse --border'

# grep
export GREP_COLOR='01:31'

# eza
if type eza > /dev/null 2>&1; then 
  alias ls='eza'
  alias la='eza -la'
  alias l='eza -lG'
  alias ll='eza -laG'
fi

# zoxide & auto eza alias
if type z > /dev/null 2>&1 && type eza > /dev/null 2>&1; then 
  j(){z $@ && eza --icons}
  ji(){zi $@ && eza --icons}
fi

disable r

alias npx='echo "WARNING: npx is not allowed" && false'
alias npm='echo "WARNING: npm is not allowed" && false'
