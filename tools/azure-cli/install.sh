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
echo "#      Installing Azure-CLI               #"
echo "#         by Deep Singh                   #"
echo "###########################################"

echo "Downloading and running the Azure-CLI installation script..."
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
check_success "Failed to download and run the Azure-CLI installation script"

echo "Updating package list..."
sudo apt-get update
check_success "Failed to update package list"

echo "Installing required dependencies..."
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y
check_success "Failed to install required dependencies"

echo "Setting up Microsoft package repository..."
sudo mkdir -p /etc/apt/keyrings
curl -sLS https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
check_success "Failed to download Microsoft package signing key"
sudo chmod go+r /etc/apt/keyrings/microsoft.gpg
check_success "Failed to set permissions on the Microsoft package signing key"

AZ_DIST=$(lsb_release -cs)
echo "Types: deb
URIs: https://packages.microsoft.com/repos/azure-cli/
Suites: ${AZ_DIST}
Components: main
Architectures: $(dpkg --print-architecture)
Signed-by: /etc/apt/keyrings/microsoft.gpg" | sudo tee /etc/apt/sources.list.d/azure-cli.sources
check_success "Failed to set up Azure-CLI package repository"

echo "Updating package list again..."
sudo apt-get update
check_success "Failed to update package list"

echo "Installing Azure-CLI..."
sudo apt-get install azure-cli -y
check_success "Failed to install Azure-CLI"

echo "Verifying Azure-CLI installation..."
az --version
check_success "Failed to verify Azure-CLI installation"

echo "###########################################"
echo "#      Azure-CLI Installation Complete    #"
echo "###########################################"
