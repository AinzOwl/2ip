#!/bin/bash

# Pull the Docker image and start the container
echo "Pulling the Mysterium Network Docker image and starting the container..."
docker pull mysteriumnetwork/myst
docker run --cap-add NET_ADMIN -d -p 4449:4449 --name myst -v myst-data:/var/lib/mysterium-node --restart unless-stopped mysteriumnetwork/myst:latest service --agreed-terms-and-conditions

# Stop the container
echo "Stopping the myst container..."
docker stop myst

# Delete the contents of /var/lib/docker/volumes/myst-data/_data/keystore
echo "Deleting the contents of /var/lib/docker/volumes/myst-data/_data/keystore..."
rm -rf /var/lib/docker/volumes/myst-data/_data/keystore/*

# Copy the contents of /root/keystore to /var/lib/docker/volumes/myst-data/_data/keystore
echo "Copying the contents of /root/keystore to /var/lib/docker/volumes/myst-data/_data/keystore..."
cp -R /root/keystore/* /var/lib/docker/volumes/myst-data/_data/keystore/

# Start the container
echo "Starting the myst container..."
docker start myst

echo "Done!"
