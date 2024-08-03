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
echo "#          Installing Ansible             #"
echo "#           by Deep Singh                 #"
echo "###########################################"

echo "Updating package list..."
sudo apt update
check_success "Failed to update package list"

echo "Installing software-properties-common..."
sudo apt install software-properties-common -y
check_success "Failed to install software-properties-common"

echo "Adding Ansible PPA repository..."
sudo add-apt-repository --yes --update ppa:ansible/ansible
check_success "Failed to add Ansible PPA repository"

echo "Updating package list again..."
sudo apt update
check_success "Failed to update package list"

echo "Installing Ansible..."
sudo apt install ansible -y
check_success "Failed to install Ansible"

echo "Verifying Ansible installation..."
ansible --version
check_success "Failed to verify Ansible installation"

echo "###########################################"
echo "#        Ansible Installation Complete    #"
echo "###########################################"
