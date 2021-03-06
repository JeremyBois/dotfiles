#!/usr/bin/env bash

if command -v code >/dev/null 2>&1; then
  code() {
    case "$1" in
    save)
      echo "Saving code extensions..."
      code --list-extensions > ~/.dotfiles/code/extensions.txt
      ;;
    install)
      echo "Installing code extensions..."
      cat ~/.dotfiles/code/extensions.txt | xargs -L 1 code --install-extension
      ;;
    *)
      command code "$@"
      ;;
    esac
  }
fi
