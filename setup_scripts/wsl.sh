#!/bin/sh
set -eu

echo "--- wsl.sh ---"

SCRIPT_DIR=$(CDPATH= cd "$(dirname "$0")" && pwd)
DOTFILES_DIR=$(dirname "$SCRIPT_DIR")

copy_sample() {
  sample=$1
  target=$2

  if [ -e "$target" ] || [ -L "$target" ]; then
    echo "Keeping existing $target"
  else
    cp "$sample" "$target"
    echo "Created $target"
  fi
}

copy_sample "$DOTFILES_DIR/git/local.wsl.sample" "$DOTFILES_DIR/git/local"
copy_sample "$DOTFILES_DIR/zsh/.zshrc.local.wsl.sample" "$DOTFILES_DIR/zsh/.zshrc.local"
