if [[ $OSTYPE==linux* ]]; then
  if [[ -x "$HOME/.linuxbrew/bin/brew" ]]; then
    eval "$("$HOME/.linuxbrew/bin/brew" shellenv)"
  elif [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi
fi

if [[ $OSTYPE==darwin* ]]; then
  test -e /usr/local/bin/brew && eval "$(/usr/local/bin/brew shellenv)"
  test -e /opt/homebrew/bin/brew && eval "$(/opt/homebrew/bin/brew shellenv)"
fi

export PATH="$HOME/.local/bin:$PATH"
