#!/bin/bash

# Check if Docker is already installed
if dpkg -s docker-ce >/dev/null 2>&1; then
    echo "Docker is already installed."
    exit 0
fi

echo "Updating apt-get..."
sudo apt-get update
echo "Installing prerequisites..."
sudo apt-get install ca-certificates curl gnupg -y
echo "Adding Docker GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo "Adding Docker repository to apt sources..."
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo "Updating apt-get again..."
sudo apt-get update
echo "Installing Docker..."
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
echo "Done!"