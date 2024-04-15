# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"
#
# PATH variables
#

# PATH
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.go/bin
export PATH=$PATH:$HOME/.composer/vendor/bin
export PATH="/opt/homebrew/opt/bison/bin:$PATH"

# GOPATH
export GOPATH=$HOME/.go

#
# Initialization
#

# mise
eval "$(/opt/homebrew/bin/mise activate zsh)"

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
  ji(){zi $@ && exa --icons}
fi

disable r

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/simics-ja/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"
