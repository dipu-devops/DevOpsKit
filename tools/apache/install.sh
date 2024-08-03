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
echo "#          Installing Apache              #"
echo "#           by Deep Singh                 #"
echo "###########################################"

echo "Updating package list..."
sudo apt update
check_success "Failed to update package list"

echo "Installing Apache..."
sudo apt install apache2 -y
check_success "Failed to install Apache"

echo "Verifying Apache installation..."
curl http://localhost
check_success "Failed to verify Apache installation"

echo "###########################################"
echo "#        Apache Installation Complete     #"
echo "###########################################"
