#!/bin/bash
# WSL環境用dotfilesセットアップスクリプト

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
DOTFILES_DIR="$REPO_ROOT/dotfiles"

echo "=== WSL Dotfiles Setup ==="
echo ""

# Helper function to check if command exists
function command_exists {
    command -v "$1" > /dev/null 2>&1
}

# Backup existing dotfiles
function backup_if_exists {
    local file=$1
    if [ -f "$file" ] || [ -d "$file" ]; then
        echo "Backing up existing $file to ${file}.backup"
        mv "$file" "${file}.backup"
    fi
}

# Check if dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "Error: dotfiles directory not found at $DOTFILES_DIR"
    exit 1
fi

echo "Repository root: $REPO_ROOT"
echo "Dotfiles directory: $DOTFILES_DIR"
echo ""

# Check for required commands
echo "Checking for required commands..."
if ! command_exists zsh ; then
    echo "Warning: zsh is not installed. Install it with: sudo apt install zsh"
fi
if ! command_exists vim ; then
    echo "Warning: vim is not installed. Install it with: sudo apt install vim"
fi
if ! command_exists git ; then
    echo "Warning: git is not installed. Install it with: sudo apt install git"
fi
echo ""

# Copy dotfiles
echo "Setting up dotfiles..."

# Backup and copy .vimrc
if [ -f "$DOTFILES_DIR/.vimrc" ]; then
    backup_if_exists ~/.vimrc
    cp "$DOTFILES_DIR/.vimrc" ~/
    echo "✓ Copied .vimrc"
fi

# Backup and copy .vim directory
if [ -d "$DOTFILES_DIR/.vim" ]; then
    backup_if_exists ~/.vim
    cp -r "$DOTFILES_DIR/.vim" ~/
    echo "✓ Copied .vim directory"
fi

# Backup and copy .ideavimrc
if [ -f "$DOTFILES_DIR/.ideavimrc" ]; then
    backup_if_exists ~/.ideavimrc
    cp "$DOTFILES_DIR/.ideavimrc" ~/
    echo "✓ Copied .ideavimrc"
fi

# Backup and copy .zshrc
if [ -f "$DOTFILES_DIR/.zshrc" ]; then
    backup_if_exists ~/.zshrc
    cp "$DOTFILES_DIR/.zshrc" ~/
    echo "✓ Copied .zshrc"
fi

# Backup and copy .gitconfig
if [ -f "$DOTFILES_DIR/.gitconfig" ]; then
    backup_if_exists ~/.gitconfig
    cp "$DOTFILES_DIR/.gitconfig" ~/
    echo "✓ Copied .gitconfig"
fi

# Create .gitignore
echo ".DS_Store" > ~/.gitignore
echo "✓ Created .gitignore"

echo ""
echo "=== Setup Complete ==="
echo ""

# Suggest changing default shell to zsh
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "To change your default shell to zsh, run:"
    echo "  chsh -s \$(which zsh)"
    echo ""
fi

echo "Note: Restart your terminal or run 'source ~/.zshrc' to apply changes."
