# Docker Installation

## Installation Steps

1. Update the package list:
   ```bash
   sudo apt update
   ```

2. Install Docker:
   ```bash
   sudo apt install docker.io -y
   ```

3. Create Docker group:
   ```bash
   sudo groupadd docker
   ```

4. Add the current user to the Docker group:
   ```bash
   sudo usermod -aG docker $USER
   ```

5. Activate Docker group:
   ```bash
   newgrp docker
   ```

6. Run Docker hello-world to verify the installation:
   ```bash
   docker run hello-world
   ```

7. Set permissions for Docker socket:
   ```bash
   sudo chmod 666 /var/run/docker.sock
   ```

8. Add ubuntu user to Docker group:
   ```bash
   sudo usermod -aG docker ${ubuntu}
   ```