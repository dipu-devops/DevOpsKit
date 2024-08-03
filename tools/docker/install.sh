#!/bin/bash
check_success() {
  if [ $? -ne 0 ]; then
    echo "Error occurred: $1. Exiting."
    exit 1
  fi
}

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root."
  exit 1
fi

echo "###########################################"
echo "#         Installing Docker               #"
echo "#         by Deep Singh                   #"
echo "###########################################"

echo "Updating package list..."
sudo apt update
check_success "Failed to update package list"

echo "Installing Docker..."
sudo apt install docker.io -y
check_success "Failed to install Docker"

echo "Creating Docker group..."
sudo groupadd docker
check_success "Failed to create Docker group"

echo "Adding current user to Docker group..."
sudo usermod -aG docker $USER
check_success "Failed to add user to Docker group"

echo "Activating Docker group..."
newgrp docker
check_success "Failed to activate Docker group"

echo "Setting permissions for Docker socket..."
sudo chmod 666 /var/run/docker.sock
check_success "Failed to set permissions for Docker socket"

echo "Adding ubuntu user to Docker group..."
sudo usermod -aG docker ${ubuntu}
check_success "Failed to add ubuntu user to Docker group"

echo "Running Docker hello-world to verify installation..."
docker run hello-world
check_success "Failed to run Docker hello-world"

echo "###########################################"
echo "#        Docker Installation Complete     #"
echo "###########################################"
