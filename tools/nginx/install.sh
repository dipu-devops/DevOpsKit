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
echo "#           Installing Nginx              #"
echo "#           by Deep Singh                 #"
echo "###########################################"

echo "Updating package list..."
sudo apt update
check_success "Failed to update package list"

echo "Installing Nginx..."
sudo apt install nginx -y
check_success "Failed to install Nginx"

echo "###########################################"
echo "#         Nginx Installation Complete     #"
echo "###########################################"
