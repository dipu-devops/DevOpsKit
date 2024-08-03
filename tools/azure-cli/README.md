# Azure-CLI Installation

## Installation Steps

1. Download and run the Azure-CLI installation script:
   ```bash
   curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
   ```

2. Update the package list:
   ```bash
   sudo apt-get update
   ```

3. Install required dependencies:
   ```bash
   sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y
   ```

4. Set up the Microsoft package repository:
   ```bash
   sudo mkdir -p /etc/apt/keyrings
   curl -sLS https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
   sudo chmod go+r /etc/apt/keyrings/microsoft.gpg
   ```

5. Add the Azure-CLI package repository:
   ```bash
   AZ_DIST=$(lsb_release -cs)
   echo "Types: deb
   URIs: https://packages.microsoft.com/repos/azure-cli/
   Suites: ${AZ_DIST}
   Components: main
   Architectures: $(dpkg --print-architecture)
   Signed-by: /etc/apt/keyrings/microsoft.gpg" | sudo tee /etc/apt/sources.list.d/azure-cli.sources
   ```

6. Update the package list again:
   ```bash
   sudo apt-get update
   ```

7. Install Azure-CLI:
   ```bash
   sudo apt-get install azure-cli -y
   ```

8. Verify the installation:
   ```bash
   az --version
   ```