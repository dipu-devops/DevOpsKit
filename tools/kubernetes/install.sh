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
echo "#        Installing Kubernetes            #"
echo "#         by Deep Singh                   #"
echo "###########################################"

echo "Downloading kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
check_success "Failed to download kubectl"

echo "Installing kubectl..."
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
check_success "Failed to install kubectl"

echo "Verifying kubectl installation..."
kubectl version --client
check_success "Failed to verify kubectl installation"

echo "###########################################"
echo "#    Kubernetes Installation Complete     #"
echo "###########################################"
