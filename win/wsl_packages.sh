#!/bin/bash
# WSL Package Installation Script

set -e

echo "=== WSL Package Installation ==="
echo ""

# Update package list
echo "Updating package list..."
apt update

# Install Docker
echo "Installing Docker..."
apt install -y docker.io docker-compose

# Add current user to docker group (to run docker without sudo)
echo "Adding user to docker group..."
usermod -aG docker $USER

# Start Docker service
echo "Starting Docker service..."
service docker start

echo ""
echo "=== Installation Complete ==="
echo ""
echo "Note: You may need to restart your WSL session for docker group changes to take effect."
echo "Run: wsl --shutdown (in PowerShell), then reopen WSL"
