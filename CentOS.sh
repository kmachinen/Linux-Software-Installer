#!/bin/bash

#######################################
#CentOS DevOps Setup
#######################################

cat /etc/os-release

cat /etc/redhat-release

sudo yum check-update

sudo yum update

sudo yum install sshpass

#Install Development Tools & Utilities
sudo dnf groupinstall -y "Development Tools"
sudo dnf install -y \
    wget curl git unzip tar nano vim epel-release \
    gcc gcc-c++ make automake autoconf cmake \
    openssl-devel zlib-devel bzip2 bzip2-devel \
    xz xz-devel sqlite sqlite-devel \
    libffi-devel readline-devel

sudo dnf install -y zip unzip


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
sudo yum install unzip -y
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"
unzip awscli-bundle.zip
sudo ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

# install go
wget https://go.dev/dl/go1.24.2.linux-amd64.tar.gz

sudo tar -C /usr/local -xzf go*.linux-amd64.tar.gz

#for bash
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
source ~/.bashrc

go version

