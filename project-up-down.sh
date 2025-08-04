#!/bin/bash

echo "Choose option :"
echo "0.install docker tools"
echo "1.download project files"
echo "2.startup project"
echo "3.shutdown project"
read enter
case $enter in
	"0")
        echo "choose 0 install tools..."
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

        docker pull nginx:1.28.0
        echo "Pulling mysql:8 image..."
        docker pull mysql:8

        echo "Pulling redis image..."
        docker pull redis

        echo "Installation and image pulling completed."
        ;;
    "1")
        echo "choose 1 download project file..."
        echo "download megatools..."
        sudo apt install megatools -y

        echo "download JDK17..."
        megatools dl 'https://mega.nz/file/F4gGmBjC#TJqBitRWbdWubIB7fRTsCzLQoe0XxkYWWWCKXXc-Be4'

        echo "download artticleManagementSystem.jar..."
        megatools dl 'https://mega.nz/file/h5JyQL6Y#plLNKqQu7008ycIZyJ-Zktx1j9OZVdbaDyh7-j4UehI'
        echo "done"
        ;;
    "2")
        echo "choose 2 startup project..."
        sudo docker compose up -d
        echo "done"
        ;;
    "3")
        echo "choose 3 shutdown project..."
        sudo docker compose down
        echo "done"
        ;;
esac
