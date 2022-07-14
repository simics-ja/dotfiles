# Fig pre block. Keep at the top of this file.
if [[ $OSTYPE==darwin* ]]; then
  [[ -f "$HOME/.fig/shell/zprofile.pre.zsh" ]] && . "$HOME/.fig/shell/zprofile.pre.zsh"
fi

if [[ $OSTYPE==linux* ]]; then
  test -d ~/.linuxbrew && eval "$(~/.linuxbrew/bin/brew shellenv)"
  test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

if [[ $OSTYPE==darwin* ]]; then
  test -e /usr/local/bin/brew && eval "$(/usr/local/bin/brew shellenv)"
  test -e /opt/homebrew/bin/brew && eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Fig post block. Keep at the bottom of this file.
if [[ $OSTYPE==darwin* ]]; then
  [[ -f "$HOME/.fig/shell/zprofile.post.zsh" ]] && . "$HOME/.fig/shell/zprofile.post.zsh"
fi

