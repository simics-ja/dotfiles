#!/bin/sh

if [ -z "$(command -v brew)" ]; then
  echo "--- install homebrew ---"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  case "$OSTYPE" in
    linux*)
      echo "--- install for linux---"
      test -d "$HOME/.linuxbrew" && eval "$("$HOME"/.linuxbrew/bin/brew shellenv)"
      test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
      brew bundle --file "$HOME/dotfiles/Brewfile.filtered"
      ;;
    darwin*)
      echo "--- install for macOS---"
      test -e /usr/local/bin/brew && eval "$(/usr/local/bin/brew shellenv)"
      test -e /opt/homebrew/bin/brew && eval "$(/opt/homebrew/bin/brew shellenv)"
      sudo xcodebuild -license accept
      brew bundle --file "$HOME/dotfiles/Brewfile"
      ;;
  esac
fi
