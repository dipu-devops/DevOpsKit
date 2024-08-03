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
echo "#       Installing AWS-CLI                #"
echo "#         by Deep Singh                   #"
echo "###########################################"

echo "Downloading AWS-CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
check_success "Failed to download AWS-CLI"

echo "Unzipping AWS-CLI package..."
unzip awscliv2.zip
check_success "Failed to unzip AWS-CLI package"

echo "Installing AWS-CLI..."
sudo ./aws/install
check_success "Failed to install AWS-CLI"

echo "Verifying AWS-CLI installation..."
aws --version
check_success "Failed to verify AWS-CLI installation"

echo "###########################################"
echo "#       AWS-CLI Installation Complete     #"
echo "###########################################"
