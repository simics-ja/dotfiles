#!/bin/sh
echo "--- zsh.sh ---"


OS=$(uname -s)

case "$OS" in
  Linux)
    if [ -z "$(command -v zsh)" ]; then
      echo "--- apt install requirements ---"
      sudo apt update
      sudo apt install -y zsh build-essential procps curl file git
      echo "--- done ---"
    fi

    echo $USER
    echo "--- switch zsh ---"
    which zsh | sudo tee -a /etc/shells
    sudo chsh -s /usr/bin/zsh "$USER"
    echo "--- done ---"
    ;;
esac
