#!/bin/bash

#######################################
#OpenSuse DevOps Setup
#######################################

set -x

cat /etc/os-release

sudo zypper refresh
sudo zypper update

#Python and Pip
sudo zypper install python3
sudo zypper install python3-pip

#Go
sudo zypper install go
go version

# Java, Jenkins
zypper install dejavu-fonts fontconfig java-17-openjdk
zypper install jenkins
sudo systemctl enable jenkins && sudo systemctl start jenkins
sudo lsof -i :8080

#SDKMan, gradle, maven
curl -s "https://get.sdkman.io" | bash
sdk install gradle
sdk install maven

#install Node.js using Node Version Manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc   # or source ~/.zshrc if you are using Zsh
nvm install --lts
node --version
npm --version

#Docker, Docker Compose
sudo zypper install docker python3-docker-compose
sudo systemctl enable docker && sudo systemctl start docker

#AWS, Azure, GCP
sudo pip3 install --user awscli

sudo zypper install azure-cli
pip install azure-mgmt-resource

# install powershell for opensuse
# install dependencies
sudo zypper update && \
  sudo zypper install libicu60_2 libopenssl1_0_0

sudo zypper install \
  --allow-unsigned-rpm \
  https://github.com/PowerShell/PowerShell/releases/download/v7.2.3/powershell-lts-7.2.3-1.rh.x86_64.rpm


#gcp
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-458.0.1-linux-x86_64.tar.gz
tar -xvf google-cloud-sdk-354.0.0-linux-x86_64.tar.gz
mv google-cloud-sdk ~/google-cloud-sdk
./google-cloud-sdk/install.sh
exec -l $SHELL
#to initalize gcloud
# ./google-cloud-sdk/bin/gcloud init
# gcloud --version

#Ansible, Terraform
# zypper install ansible
pip install pipx
pipx install --include-deps ansible
pip install ansible-creator
pip install ansible-lint
ansible-lint --version
ansible-galaxy collection install community.general
# inctalling general modules.

#get list of installed modules in system.
# ansible-galaxy collection list 

#ansible.posix.firewalld module – Manage arbitrary ports/services with firewalld
# This module is part of the ansible.posix collection (version 1.5.4).

# You might already have this collection installed if you are using the ansible package. It is not included in ansible-core. To check whether it is installed, run ansible-galaxy collection list.

# To install it, use: $ ansible-galaxy collection install ansible.posix
# You need further requirements to be able to use this module, see Requirements for details.

# To use it in a playbook, specify: ansible.posix.firewalld.




pip install yamllint

zypper install terraform

#kubernetes
#kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
#checksum file
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
#verify
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client

#kubeadm


#Kind
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.12.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
kind version

#Packer
#---


#generate ssh key
# ssh-keygen

#bash themes
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
# https://ohmybash.nntoan.com/

#nginx
sudo zypper install nginx
# ============================
# jenkins

# sudo nano /var/lib/jenkins/secrets/initialAdminPassword

# sudo systemctl enable jenkins
# sudo systemctl status jenkins
# sudo systemctl start jenkins
# sudo systemctl stop jenkins
# sudo systemctl restart jenkins

# ============================
# wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz
# tar xvf Python-3.6.5.tgz
# cd Python-3.6.5
# ./configure
# sudo make install

# =======
#NGINX:

# sudo systemctl start nginx
# sudo systemctl restart nginx
# sudo systemctl stop nginx
# sudo systemctl status nginx

# #default index file.
# sudo vi /srv/www/htdocs/index.html

# #config file
# vi /etc/nginx/nginx.conf

# =======
# docker build
# sudo docker buildx build -t spring-boot-app .
# sudo docker run -p 3000:3000 <pid>
# =============
# ubuntu
# sudo apt update

# sudo apt upgrade

# sudo apt install awscli

# fedora: sudo dnf install awscli

# aws --version

# ====
# parsers in shell.

# "jq" for json parser

# "yq"for yaml parser.

# using parser:  aws s3 list | jq '.Reservations[].instances[].instanceId'

# to setup debugger in shell script "bash -x script1.sh"
# ===
# gcloud compute ssh --zone "us-central1-a" "zmkmonitoring" --project "playground-s-11-6196f556"