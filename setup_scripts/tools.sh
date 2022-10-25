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

# asdf
ln -sf $HOME/dotfiles/asdf/.tool-versions $HOME/.tool-versions

# starship
ln -sf $HOME/dotfiles/starship/starship.toml $HOME/.config/starship.toml

# vim
## Install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf $HOME/dotfiles/vim/init.vim $HOME/.vimrc

if [ $OSTYPE==darwin* ]; then
   # lepton
   ln -sf $HOME/dotfiles/lepton/.leptonrc $HOME/.leptonrc

   # hammerspoon
   ln -sfn $HOME/dotfiles/hammerspoon $HOME/.hammerspoon
fi
