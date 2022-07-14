#!/bin/sh

# Install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# zsh
ln -sf $HOME/dotfiles/zsh/.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/zsh/.zprofile $HOME/.zprofile
ln -sf $HOME/dotfiles/zsh/.profile $HOME/.profile

# git
ln -sf $HOME/dotfiles/git $HOME/.config/git

# asdf
ln -sf $HOME/dotfiles/asdf/.tool-versions $HOME/.tool-versions

# starship
ln -sf $HOME/dotfiles/starship/starship.toml $HOME/.config/starship.toml

# vim
ln -sf $HOME/dotfiles/vim/init.vim $HOME/.vimrc

# lepton
ln -sf $HOME/dotfiles/lepton/leptonr $HOME/.leptonrc

