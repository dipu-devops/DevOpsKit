#!/bin/bash
check_success() {
  if [ $? -ne 0 ]; then
    echo "Error occurred: $1. Exiting."
    exit 1
  fi
}

check_file() {
  if [ ! -f "$1" ]; then
    echo "File $1 does not exist. Exiting."
    exit 1
  elif [ ! -x "$1" ]; then
    echo "File $1 is not executable. Setting execute permission."
    chmod +x "$1"
    check_success "Failed to set execute permission on $1"
  fi
}

check_root() {
  if [ "$EUID" -ne 0 ]; then
    echo "Please run as root."
    exit 1
  fi
}

check_network() {
  ping -c 1 google.com &> /dev/null
  check_success "No network connection"
}

check_disk_space() {
  FREE_SPACE=$(df / | tail -1 | awk '{print $4}')
  if [ "$FREE_SPACE" -lt 1048576 ]; then
    echo "Insufficient disk space. At least 1GB free space is required. Exiting."
    exit 1
  fi
}

check_root

echo "Checking network connectivity..."
check_network

echo "Checking disk space..."
check_disk_space

echo "Installing necessary packages (figlet and lolcat)..."
sudo apt-get update
check_success "Failed to update package list"
sudo apt-get install -y figlet lolcat
check_success "Failed to install figlet and lolcat"

clear

figlet "DevOpsKit" | lolcat

echo "###########################################"
echo "#         Welcome to DevOpsKit            #"
echo "#         by Deep Singh                   #"
echo "###########################################"

echo "Updating package list..."
sudo apt update
check_success "Failed to update package list"

echo "Installing unzip..."
sudo apt install unzip -y
check_success "Failed to install unzip"

echo "Select the tools to install (separate choices with spaces):"
echo "1) Git"
echo "2) AWS-CLI"
echo "3) Azure-CLI"
echo "4) Docker"
echo "5) Docker-Compose"
echo "6) Kubernetes"
echo "7) Terraform"
echo "8) Jenkins"
echo "9) Ansible"
echo "10) Nginx"
echo "11) Apache"
echo "12) Maven"
echo "13) Quit"

read -p "Enter the numbers of the tools you want to install: " -a tools

for tool in "${tools[@]}"; do
  case $tool in
    1)
      check_file "tools/git/install.sh"
      bash tools/git/install.sh
      check_success "Failed to install Git"
      ;;
    2)
      check_file "tools/aws-cli/install.sh"
      bash tools/aws-cli/install.sh
      check_success "Failed to install AWS-CLI"
      ;;
    3)
      check_file "tools/azure-cli/install.sh"
      bash tools/azure-cli/install.sh
      check_success "Failed to install Azure-CLI"
      ;;
    4)
      check_file "tools/docker/install.sh"
      bash tools/docker/install.sh
      check_success "Failed to install Docker"
      ;;
    5)
      check_file "tools/docker-compose/install.sh"
      bash tools/docker-compose/install.sh
      check_success "Failed to install Docker-Compose"
      ;;
    6)
      check_file "tools/kubernetes/install.sh"
      bash tools/kubernetes/install.sh
      check_success "Failed to install Kubernetes"
      ;;
    7)
      check_file "tools/terraform/install.sh"
      bash tools/terraform/install.sh
      check_success "Failed to install Terraform"
      ;;
    8)
      check_file "tools/jenkins/install.sh"
      bash tools/jenkins/install.sh
      check_success "Failed to install Jenkins"
      ;;
    9)
      check_file "tools/ansible/install.sh"
      bash tools/ansible/install.sh
      check_success "Failed to install Ansible"
      ;;
    10)
      check_file "tools/nginx/install.sh"
      bash tools/nginx/install.sh
      check_success "Failed to install Nginx"
      ;;
    11)
      check_file "tools/apache/install.sh"
      bash tools/apache/install.sh
      check_success "Failed to install Apache"
      ;;
    12)
      check_file "tools/maven/install.sh"
      bash tools/maven/install.sh
      check_success "Failed to install Maven"
      ;;
    13)
      echo "Quitting..."
      exit 0
      ;;
    *)
      echo "Invalid selection: $tool. Skipping."
      ;;
  esac
done

echo "###########################################"
echo "#        Installation Complete!           #"
echo "#      Thank you for using DevOpsKit      #"
echo "###########################################"
