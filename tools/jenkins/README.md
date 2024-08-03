# Jenkins Installation

## Installation Steps

1. Update the package list:
   ```bash
   sudo apt update
   ```

2. Install OpenJDK 21:
   ```bash
   sudo apt install openjdk-21-jre -y
   ```

3. Verify the Java installation:
   ```bash
   java -version
   ```

4. Add the Jenkins key:
   ```bash
   sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
   ```

5. Add the Jenkins repository:
   ```bash
   echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
   ```

6. Update the package list again:
   ```bash
   sudo apt-get update
   ```

7. Install Jenkins:
   ```bash
   sudo apt-get install jenkins -y
   ```

8. Unlock Jenkins:
   ```bash
   sudo cat /var/lib/jenkins/secrets/initialAdminPassword
   ```
   Use the displayed password to unlock Jenkins.