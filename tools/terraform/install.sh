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
echo "#        Installing Terraform             #"
echo "#         by Deep Singh                   #"
echo "###########################################"

echo "Updating package list and installing dependencies..."
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
check_success "Failed to update package list and install dependencies"

echo "Adding HashiCorp GPG key..."
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
check_success "Failed to add HashiCorp GPG key"

echo "Verifying the HashiCorp GPG key..."
gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
check_success "Failed to verify the HashiCorp GPG key"

echo "Adding the HashiCorp repository..."
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
check_success "Failed to add the HashiCorp repository"

echo "Updating package list..."
sudo apt update
check_success "Failed to update package list"

echo "Installing Terraform..."
sudo apt-get install terraform -y
check_success "Failed to install Terraform"

echo "Verifying Terraform installation..."
terraform --version
check_success "Failed to verify Terraform installation"

echo "###########################################"
echo "#     Terraform Installation Complete     #"
echo "###########################################"
