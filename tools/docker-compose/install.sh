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
echo "#     Installing Docker Compose           #"
echo "#         by Deep Singh                   #"
echo "###########################################"

echo "Downloading Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
check_success "Failed to download Docker Compose"

echo "Setting execute permission on Docker Compose..."
sudo chmod +x /usr/local/bin/docker-compose
check_success "Failed to set execute permission on Docker Compose"

echo "Verifying Docker Compose installation..."
docker-compose --version
check_success "Failed to verify Docker Compose installation"

echo "###########################################"
echo "#   Docker Compose Installation Complete  #"
echo "###########################################"
