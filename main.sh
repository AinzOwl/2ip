#!/bin/bash

# check os if its not ubuntu 20.04 > exit
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
elif [ -f /etc/debian_version ]; then
    OS=debian
else
    echo "Unsupported operating system."
    exit 1
fi
# check if nodejs is not installed
if dpkg -s nodejs | grep -q "Version: 20"; then
    echo "Node.js version 20 is already installed."
else
    echo "Downloading Node.js setup script..."
    
    sudo apt-get update
    sudo apt-get install -y ca-certificates curl gnupg
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

    NODE_MAJOR=20
    echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

    sudo apt-get update
    sudo apt-get install nodejs -y

    echo "Node.js installed successfully."
fi

# check if docker is not installed
if dpkg -s docker-ce >/dev/null 2>&1; then
    echo "Docker is already installed."
else
    echo "Docker is not installed, installing it"

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
fi

# cd to app and run npm install
# cd app
# npm install
# node index.js $1 $2