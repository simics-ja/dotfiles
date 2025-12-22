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

OS=$(uname -s)

. $HOME/dotfiles/setup_scripts/zsh.sh

# Install homebrew:
# - Always on macOS
# - On Linux/WSL only with --homebrew flag
case "$OS" in
  Darwin)
    . $HOME/dotfiles/setup_scripts/homebrew.sh
    ;;
  Linux)
    if [ "$USE_HOMEBREW_ON_LINUX" = true ]; then
      echo "--- Installing homebrew on Linux (--homebrew flag specified) ---"
      . $HOME/dotfiles/setup_scripts/homebrew.sh
    else
      echo "--- Using apt on Linux (use --homebrew flag to use homebrew) ---"
      . $HOME/dotfiles/setup_scripts/apt.sh
    fi
    ;;
esac

. $HOME/dotfiles/setup_scripts/tools.sh
