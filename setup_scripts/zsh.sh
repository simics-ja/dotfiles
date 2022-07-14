#!/bin/sh

if [ -z "$(command -v zsh)" ]; then
  if [ $OSTYPE=linux* ]; then
    echo "--- apt install requirements ---"
    sudo apt update
    sudo apt install zsh build-essential procps curl file git
    echo "--- done ---"
    echo "--- switch zsh ---"
    which zsh | sudo tee -a /etc/shells
    sudo chsh -s $(which zsh)
    echo "--- done ---"
  fi
fi
