#!/bin/sh

DOTFILES_DIR=$HOME/dotfiles

if [ -n "$(command -v brew)" ]; then
  brew bundle dump --file $DOTFILES_DIR/Brewfile -f
  grep -v '^cask' $DOTFILES_DIR/Brewfile | grep -v '^vscode' | grep -v '^go' > $DOTFILES_DIR/Brewfile.filtered
fi

if [ -n "$(command -v apt)" ]; then
  apt-mark showmanual > $DOTFILES_DIR/apt_packages.txt
fi
