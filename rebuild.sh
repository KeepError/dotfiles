#!/usr/bin/env bash
set -e

BREW="/opt/homebrew/bin/brew"
DOTFILES="$HOME/dotfiles"

chmod +x "$DOTFILES/rebuild.sh"

echo "==> Applying macOS settings"
bash "$DOTFILES/macos/settings.sh"

echo "==> Installing Homebrew packages"
$BREW bundle -v --cleanup --file "$DOTFILES/homebrew/Brewfile"

echo "==> Linking dotfiles using stow"
bash "$DOTFILES/stow/stow.sh"

echo "==> Done! 🎉"

