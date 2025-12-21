#!/bin/sh

case "$OSTYPE" in
  linux*)
    if [ -z "$(command -v zsh)" ]; then
      echo "--- apt install requirements ---"
      sudo apt update
      sudo apt install zsh build-essential procps curl file git
      echo "--- done ---"
    fi

    echo "--- switch zsh ---"
    which zsh | sudo tee -a /etc/shells
    sudo chsh -s /usr/bin/zsh
    echo "--- done ---"
    ;;
esac
