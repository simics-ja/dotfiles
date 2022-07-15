#!/bin/sh

# mkdir
mkdir -p $HOME/.config
mkdir -p $HOME/.sheldon

# zsh
ln -sf $HOME/dotfiles/zsh/.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/zsh/.zprofile $HOME/.zprofile

# sheldon
ln -sf $HOME/dotfiles/sheldon/plugins.toml $HOME/.sheldon/plugins.toml

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

# lepton
ln -sf $HOME/dotfiles/lepton/leptonr $HOME/.leptonrc 
