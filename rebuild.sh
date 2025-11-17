#!/usr/bin/env bash
set -e

BREW="/opt/homebrew/bin/brew"
DOTFILES="."

chmod +x "$DOTFILES/rebuild.sh"

echo "==> Installing Homebrew packages"
$BREW bundle -v --cleanup --file "$DOTFILES/Brewfile"

echo "==> Applying macOS settings"
bash "$DOTFILES/macsettings.sh"

echo "==> Linking dotfiles using stow"
bash "$DOTFILES/stow.sh"

echo "==> Done! 🎉"

