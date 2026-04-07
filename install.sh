#!/usr/bin/env bash
set -e

if ! command -v stow &> /dev/null; then
    echo "Installing stow..."
    brew install stow
fi

PACKAGES=(aerospace nvim)

for pkg in "${PACKAGES[@]}"; do
    echo "Stowing $pkg..."
    stow "$pkg"
done

echo "Done! All packages stowed."
