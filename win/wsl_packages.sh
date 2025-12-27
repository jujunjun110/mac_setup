#!/bin/bash
# WSL Package Installation Script
#
# パッケージ管理方針:
#   - apt: システム基盤（zsh, docker等）
#   - brew: 開発ツール（gh, uv, node等）
#
# Note: git, curl等のHomebrew依存パッケージはinstall_homebrew.shで入る

set -e

echo "=== WSL System Packages (apt) ==="
echo ""

# Update package list
echo "Updating package list..."
sudo apt update

# Install zsh
echo "Installing zsh..."
sudo apt install -y zsh

# Install Docker
echo "Installing Docker..."
sudo apt install -y docker.io docker-compose

# Add current user to docker group (to run docker without sudo)
echo "Adding user to docker group..."
sudo usermod -aG docker $USER

# Start Docker service
echo "Starting Docker service..."
sudo service docker start

echo ""
echo "=== System Packages Installation Complete ==="
echo ""
echo "Note: You may need to restart your WSL session for docker group changes to take effect."
echo "Run: wsl --shutdown (in PowerShell), then reopen WSL"
echo ""
echo "Next: Run ./install_homebrew.sh to install Homebrew"
echo "Then: Run ./brew_packages.sh to install development tools"
