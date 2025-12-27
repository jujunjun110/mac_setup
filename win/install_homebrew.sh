#!/bin/bash
# Homebrew Installation Script for WSL

set -e

echo "=== Installing Homebrew for Linux ==="
echo ""

# Install dependencies for Homebrew
echo "Installing Homebrew dependencies..."
sudo apt update
sudo apt install -y build-essential procps curl file git

# Install Homebrew
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Add Homebrew to PATH
echo "Configuring Homebrew in shell..."
BREW_PREFIX="/home/linuxbrew/.linuxbrew"

# Add to .bashrc if not already present
if ! grep -q "linuxbrew" ~/.bashrc 2>/dev/null; then
    echo '' >> ~/.bashrc
    echo '# Homebrew' >> ~/.bashrc
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
fi

# Add to .zshrc if it exists and not already present
if [ -f ~/.zshrc ] && ! grep -q "linuxbrew" ~/.zshrc 2>/dev/null; then
    echo '' >> ~/.zshrc
    echo '# Homebrew' >> ~/.zshrc
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
fi

# Load Homebrew for current session
eval "$($BREW_PREFIX/bin/brew shellenv)"

echo ""
echo "=== Homebrew Installation Complete ==="
echo ""
echo "Next: Run ./brew_packages.sh to install development tools"
