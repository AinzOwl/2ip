#!/bin/bash

# Check the OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
elif [ -f /etc/debian_version ]; then
    OS=debian
else
    echo "Unsupported operating system."
    exit 1
fi

# Check if Docker is already installed
if dpkg -s docker-ce >/dev/null 2>&1; then
    echo "Docker is already installed."
    exit 0
fi

# Update apt-get
echo "Updating apt-get..."
sudo apt-get update

# Install prerequisites
echo "Installing prerequisites..."
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

# Add Docker GPG key and repository
echo "Adding Docker GPG key..."
curl -fsSL https://download.docker.com/linux/$OS/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "Adding Docker repository to apt sources..."
echo "deb [signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/$OS $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update apt-get again
echo "Updating apt-get..."
sudo apt-get update

# Install Docker
echo "Installing Docker..."
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

echo "Done!"
