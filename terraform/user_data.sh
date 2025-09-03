#!/bin/bash

# Update system
sudo yum update -y

# Install Docker and Git
sudo yum install -y docker git

# Start and enable Docker
sudo systemctl start docker
sudo systemctl enable docker

# Add ec2-user to Docker group
sudo usermod -aG docker ec2-user

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Switch to ec2-user home directory
cd /home/ec2-user || exit

# Clone your repo
git clone https://github.com/haroon0403/python-microservices-devops.git
sudo chown -R ec2-user:ec2-user python-microservices-devops

# Run Docker Compose as ec2-user
cd python-microservices-devops || exit
sudo -u ec2-user /usr/local/bin/docker-compose -f docker-compose-image.yml up -d
