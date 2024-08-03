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
echo "#          Installing Jenkins             #"
echo "#           by Deep Singh                 #"
echo "###########################################"

echo "Updating package list..."
sudo apt update
check_success "Failed to update package list"

echo "Installing OpenJDK 21..."
sudo apt install openjdk-21-jre -y
check_success "Failed to install OpenJDK 21"

echo "Verifying Java installation..."
java -version
check_success "Failed to verify Java installation"

echo "Adding Jenkins key..."
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
check_success "Failed to add Jenkins key"

echo "Adding Jenkins repository..."
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
check_success "Failed to add Jenkins repository"

echo "Updating package list again..."
sudo apt-get update
check_success "Failed to update package list"

echo "Installing Jenkins..."
sudo apt-get install jenkins -y
check_success "Failed to install Jenkins"

echo "###########################################"
echo "#        Jenkins Installation Complete    #"
echo "###########################################"

echo "Unlocking Jenkins..."
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
check_success "Failed to unlock Jenkins"

echo "###########################################"
echo "#  Use the above password to unlock Jenkins #"
echo "###########################################"
