#!/bin/sh

# mkdir
mkdir -p $HOME/.config

# zsh
ln -sf $HOME/dotfiles/zsh/.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/zsh/.zprofile $HOME/.zprofile

# sheldon
ln -sf $HOME/dotfiles/sheldon $HOME/.config/

# git
ln -sf $HOME/dotfiles/git $HOME/.config/

# starship
ln -sf $HOME/dotfiles/starship/starship.toml $HOME/.config/starship.toml

# vim
## Install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf $HOME/dotfiles/vim/init.vim $HOME/.vimrc

case "$OSTYPE" in
   darwin*)
      # lepton
      ln -sf "$HOME/dotfiles/lepton/.leptonrc" "$HOME/.leptonrc"

      # hammerspoon
      ln -sfn "$HOME/dotfiles/hammerspoon" "$HOME/.hammerspoon"

      # docker compose
      if command -v colima > /dev/null 2>&1; then
         ln -sfn "$HOMEBREW_PREFIX/opt/docker-compose/bin/docker-compose" "$HOME/.docker/cli-plugins/docker-compose"
      fi
      ;;
esac
