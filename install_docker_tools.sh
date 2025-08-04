#!/bin/bash

set -e  # Stop execution on error

# Check if script is run as root
if [ "$EUID" -ne 0 ]; then
	echo "Error: This script must be run as root."
	exit 1
fi

echo "Updating package list..."
apt update

echo "Installing Docker and related tools..."
apt install -y \
	docker.io \
	docker-compose-v2 \
	docker-buildx

if command -v systemctl >/dev/null 2>&1; then
	echo "Enabling and starting Docker service..."
	systemctl enable --now docker
else
	echo "Skipping systemctl (not available in this environment)..."
fi

echo "Pulling nginx:1.28.0 image..."
docker pull nginx:1.28.0

echo "Pulling mysql:8 image..."
docker pull mysql:8

echo "Pulling redis image..."
docker pull redis

echo "Installation and image pulling completed."
