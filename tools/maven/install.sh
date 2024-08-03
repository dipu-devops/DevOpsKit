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
echo "#       Installing Apache Maven           #"
echo "#           by Deep Singh                 #"
echo "###########################################"

echo "Updating package list..."
sudo apt update
check_success "Failed to update package list"

echo "Installing OpenJDK..."
sudo apt install default-jdk -y
check_success "Failed to install OpenJDK"

echo "Verifying Java installation..."
java -version
check_success "Failed to verify Java installation"

echo "Updating package list again..."
sudo apt update
check_success "Failed to update package list"

echo "Installing Maven..."
sudo apt install maven -y
check_success "Failed to install Maven"

echo "Verifying Maven installation..."
mvn -version
check_success "Failed to verify Maven installation"

echo "###########################################"
echo "#     Apache Maven Installation Complete  #"
echo "###########################################"
