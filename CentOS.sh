#!/bin/bash

#######################################
#CentOS DevOps Setup
#######################################

cat /etc/os-release

cat /etc/redhat-release

sudo yum check-update

sudo yum update

sudo yum install sshpass

#SElinux

#install git
sudo yum install git
git --version

#Setting Up Git
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
git config --list

sudo yum install -y yum-utils
sudo yum install nano -y
sudo yum install unzip -y
sudo yum install bc -y
sudo yum install wget -y

# install docker
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

docker --version
docker compose version

sudo systemctl start docker
sudo docker run hello-world

# install aws cli
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws
