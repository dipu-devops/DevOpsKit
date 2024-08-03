# Apache Maven Installation

## Installation Steps

### Step 1: Install OpenJDK

1. Update the system's package repository index:
   ```bash
   sudo apt update
   ```

2. Install the latest OpenJDK version:
   ```bash
   sudo apt install default-jdk -y
   ```

3. Verify the installation by checking the current OpenJDK version:
   ```bash
   java -version
   ```

### Step 2: Install Maven with APT

1. Update the local package repository index:
   ```bash
   sudo apt update
   ```

2. Install Maven from the official Ubuntu repository:
   ```bash
   sudo apt install maven -y
   ```

3. Check the current Maven version to verify the installation:
   ```bash
   mvn -version
   ```