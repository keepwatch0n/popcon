#!/bin/bash

# Install Jenkins using this script

# Update and upgrade packages
sudo apt update
sudo apt upgrade -y

# Install required dependencies
sudo apt install fontconfig git default-jre wget gnupg2 -y

# Add Jenkins GPG key and repository
sudo wget -q -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package index after adding Jenkins repo
sudo apt update

# Install Jenkins
sudo apt install jenkins -y

# Start and enable Jenkins service
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Show Jenkins service status
sudo systemctl status jenkins
