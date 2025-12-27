#!/bin/bash
# Development Tools Installation Script (Homebrew)
#
# 開発ツールはBrewで管理（Brewfileで宣言的に）
# Homebrewが未インストールの場合は先に install_homebrew.sh を実行

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "=== Development Tools (Homebrew) ==="
echo ""

# Load Homebrew if not in PATH (for sh execution)
if ! command -v brew &> /dev/null; then
    if [ -f /home/linuxbrew/.linuxbrew/bin/brew ]; then
        eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    else
        echo "Error: Homebrew is not installed."
        echo "Run ./install_homebrew.sh first."
        exit 1
    fi
fi

# Update Homebrew
echo "Updating Homebrew..."
brew update

# Install from Brewfile
echo ""
echo "Installing packages from Brewfile..."
brew bundle --file="$SCRIPT_DIR/Brewfile"

echo ""
echo "=== Development Tools Installation Complete ==="
echo ""
echo "To verify: brew list"
echo "To update Brewfile from installed packages: brew bundle dump --file=./Brewfile --force"
