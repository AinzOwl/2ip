#!/bin/bash

# Check if Node.js version 20 is already installed
if dpkg -s nodejs | grep -q "Version: 20"; then
    echo "Node.js version 20 is already installed."
    exit 0
fi

echo "Downloading Node.js setup script..."
curl -sL https://deb.nodesource.com/setup_20.x -o nodesource_setup.sh

echo "Running Node.js setup script..."
sudo bash nodesource_setup.sh

echo "Installing Node.js..."
sudo apt install nodejs -y

echo "Node.js installed successfully."