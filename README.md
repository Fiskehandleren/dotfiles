# Dotfiles

My dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Packages

| Package | Contents |
|---------|----------|
| `aerospace` | `.aerospace.toml` (tiling window manager) |
| `nvim` | `.config/nvim/` (NvChad v2.5, catppuccin theme, LSPs, DAP, conform) |
| `ghostty` | `.config/ghostty/` (Ghostty terminal, catppuccin theme, visual config variants) |
| `tmux` | `.config/tmux/tmux.conf` (tmux with tpm, catppuccin, vim-tmux-navigator) |

## Prerequisites

```bash
brew install stow
```

## Usage

Clone this repo and run `stow` from within it to symlink packages into your home directory.

```bash
# Install everything
./install.sh

# Or install individual packages
stow aerospace
stow nvim
stow ghostty

# Remove a package
stow -D aerospace
```

## How it works

Each top-level directory is a "package". The directory structure inside each package mirrors your home directory. When you run `stow <package>`, it creates symlinks in your home directory pointing to the files in this repo.

For example, `stow aerospace` creates `~/.aerospace.toml -> dotfiles/aerospace/.aerospace.toml`.
