#!/usr/bin/env bash
set -e

if ! command -v stow &> /dev/null; then
    echo "Installing stow..."
    brew install stow
fi

PACKAGES=(aerospace nvim ghostty tmux)

for pkg in "${PACKAGES[@]}"; do
    echo "Stowing $pkg..."
    stow -t ~ "$pkg"
done

echo "Done! All packages stowed."
