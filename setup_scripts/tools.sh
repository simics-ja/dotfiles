#!/bin/sh
echo "--- tools.sh ---"

OS=$(uname -s)

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

# mise
BREW_PREFIX=$(brew --prefix)
MISE_CONFIG="$HOME/.config/mise/config.toml"

if [ -d "$BREW_PREFIX" ]; then
    LIBZIP="$BREW_PREFIX/opt/libzip"
    OPENSSL="$BREW_PREFIX/opt/openssl"
    
    PHP_OPTS="--with-libzip=$LIBZIP --with-openssl=$OPENSSL"
    LDFLAGS="-L$LIBZIP/lib -L$OPENSSL/lib"
    CPPFLAGS="-I$LIBZIP/include -I$OPENSSL/include"

    mkdir -p "$(dirname "$MISE_CONFIG")"
    [ ! -f "$MISE_CONFIG" ] && touch "$MISE_CONFIG"

    if command -v mise > /dev/null 2>&1; then
        if ! grep -q "PHP_CONFIGURE_OPTIONS" "$MISE_CONFIG" 2>/dev/null; then
            echo "Injecting PHP build settings into mise config..."
            mise set --global PHP_CONFIGURE_OPTIONS="$PHP_OPTS"
            mise set --global LDFLAGS="$LDFLAGS"
            mise set --global CPPFLAGS="$CPPFLAGS"
            echo "mise environment variables for PHP have been set."
        fi
    fi
fi

# vim
## Install vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sf $HOME/dotfiles/vim/init.vim $HOME/.vimrc

case "$OS" in
   Darwin)
      # hammerspoon
      ln -sfn "$HOME/dotfiles/hammerspoon" "$HOME/.hammerspoon"

      # docker compose
      if command -v colima > /dev/null 2>&1; then
         ln -sfn "$HOMEBREW_PREFIX/opt/docker-compose/bin/docker-compose" "$HOME/.docker/cli-plugins/docker-compose"
      fi
      ;;
esac
