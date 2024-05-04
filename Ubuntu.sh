#!/bin/bash

#######################################
#Ubuntu DevOps Setup
#######################################

cat /etc/os-release

sudo apt update && sudo apt upgrade
sudo reboot
sudo apt install update-manager-core
sudo do-release-upgrade
sudo reboot


sudo apt-get install jq


# Install Docker
# https://docs.docker.com/engine/install/ubuntu/

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo systemctl enable docker
sudo systemctl start docker
sudo systemctl status docker
# sudo systemctl stop docker
# sudo systemctl restart docker

# Verify Docker access
docker run hello-world

# Minikube
# https://minikube.sigs.k8s.io/docs/start/

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb


# minikube start

# minikube dashboard

# install kubectl.
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-native-package-management
