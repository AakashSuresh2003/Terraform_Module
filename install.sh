#!/bin/bash

# Log start of script
echo "Starting user_data script" >> /var/log/user_data.log 2>&1

# Update and upgrade
echo "Updating and upgrading system packages" >> /var/log/user_data.log 2>&1
sudo apt update -y >> /var/log/user_data.log 2>&1
sudo apt upgrade -y >> /var/log/user_data.log 2>&1

# Install OpenJDK
echo "Installing OpenJDK 21" >> /var/log/user_data.log 2>&1
sudo apt install openjdk-21-jdk -y >> /var/log/user_data.log 2>&1

# Add Jenkins repository and install Jenkins
echo "Adding Jenkins repository and installing Jenkins" >> /var/log/user_data.log 2>&1
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key >> /var/log/user_data.log 2>&1
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list >> /var/log/user_data.log 2>&1
sudo apt-get update -y >> /var/log/user_data.log 2>&1
sudo apt-get install jenkins -y >> /var/log/user_data.log 2>&1
sudo systemctl start jenkins >> /var/log/user_data.log 2>&1
sudo systemctl enable jenkins >> /var/log/user_data.log 2>&1

# Configure Jenkins user permissions
echo "Configuring Jenkins user permissions" >> /var/log/user_data.log 2>&1
echo 'jenkins ALL=(ALL) NOPASSWD: ALL' | sudo tee /etc/sudoers.d/jenkins >> /var/log/user_data.log 2>&1

# Install Docker
echo "Installing Docker" >> /var/log/user_data.log 2>&1
sudo apt-get update >> /var/log/user_data.log 2>&1
sudo apt-get install -y ca-certificates curl >> /var/log/user_data.log 2>&1
sudo install -m 0755 -d /etc/apt/keyrings >> /var/log/user_data.log 2>&1
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc >> /var/log/user_data.log 2>&1
sudo chmod a+r /etc/apt/keyrings/docker.asc >> /var/log/user_data.log 2>&1

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list >> /var/log/user_data.log 2>&1
sudo apt-get update >> /var/log/user_data.log 2>&1
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin >> /var/log/user_data.log 2>&1

# Pull and run SonarQube Docker container
echo "Pulling and running SonarQube Docker container" >> /var/log/user_data.log 2>&1
sudo docker pull sonarqube >> /var/log/user_data.log 2>&1
sudo docker run -d --name sonarqube -p 9000:9000 sonarqube >> /var/log/user_data.log 2>&1

# Log end of script
echo "Script completed" >> /var/log/user_data.log 2>&1
