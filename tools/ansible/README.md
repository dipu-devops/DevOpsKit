# Ansible Installation

## Installation Steps

1. Update the package list:
   ```bash
   sudo apt update
   ```

2. Install software-properties-common:
   ```bash
   sudo apt install software-properties-common -y
   ```

3. Add the Ansible PPA repository:
   ```bash
   sudo add-apt-repository --yes --update ppa:ansible/ansible
   ```

4. Update the package list again:
   ```bash
   sudo apt update
   ```

5. Install Ansible:
   ```bash
   sudo apt install ansible -y
   ```

6. Verify the installation:
   ```bash
   ansible --version
   ```