# Terraform Installation

## Installation Steps

1. Update the package list and install dependencies:
   ```bash
   sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
   ```

2. Add the HashiCorp GPG key:
   ```bash
   wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
   ```

3. Verify the HashiCorp GPG key:
   ```bash
   gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
   ```

4. Add the HashiCorp repository:
   ```bash
   echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
   ```

5. Update the package list:
   ```bash
   sudo apt update
   ```

6. Install Terraform:
   ```bash
   sudo apt-get install terraform -y
   ```

7. Verify the installation:
   ```bash
   terraform --version
   ```