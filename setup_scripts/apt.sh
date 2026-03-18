#!/bin/sh
echo "--- apt.sh ---"

if [ -z "$(command -v mise)" ]; then
  sudo install -dm 755 /etc/apt/keyrings
  curl -fSs https://mise.jdx.dev/gpg-key.pub | sudo tee /etc/apt/keyrings/mise-archive-keyring.pub 1> /dev/null
  echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.pub arch=amd64] https://mise.jdx.dev/deb stable main" | sudo tee /etc/apt/sources.list.d/mise.list
  sudo apt update
  sudo apt install -y mise
fi

if [ -z "$(command -v sheldon)" ]; then
  curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
    | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin
fi

if [ -z "$(command -v starship)" ]; then
  curl -sS https://starship.rs/install.sh | sh
fi

if [ -z "$(command -v direnv)" ]; then
  sudo apt install -y direnv
fi

xargs -a $HOME/dotfiles/apt_packages.txt sudo apt install -y