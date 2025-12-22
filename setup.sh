#!/bin/sh

# Parse command line arguments
USE_HOMEBREW_ON_LINUX=false
for arg in "$@"; do
  case "$arg" in
    --homebrew)
      USE_HOMEBREW_ON_LINUX=true
      ;;
  esac
done

. $HOME/dotfiles/setup_scripts/zsh.sh

# Install homebrew:
# - Always on macOS
# - On Linux/WSL only with --homebrew flag
case "$OSTYPE" in
  darwin*)
    . $HOME/dotfiles/setup_scripts/homebrew.sh
    ;;
  linux*)
    if [ "$USE_HOMEBREW_ON_LINUX" = true ]; then
      echo "--- Installing homebrew on Linux (--homebrew flag specified) ---"
      . $HOME/dotfiles/setup_scripts/homebrew.sh
    else
      echo "--- Skipping homebrew on Linux (use --homebrew flag to install) ---"
    fi
    ;;
esac

. $HOME/dotfiles/setup_scripts/tools.sh

