#!/bin/sh

DOTFILES_DIR=$HOME/dotfiles
brew bundle dump --file $DOTFILES_DIR/Brewfile -f
grep -v '^cask' Brewfile | grep -v '^vscode' | grep -v '^go' > $DOTFILES_DIR/Brewfile.filtered
