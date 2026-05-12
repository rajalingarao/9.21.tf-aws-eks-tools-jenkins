#!/bin/bash

#java-17 installation on Jenkins Agent
yum install fontconfig java-17-openjdk -y

#Installing Terraform on Jenkins Agent
yum install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
yum -y install terraform


#Node JS installation
dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y

#Installing zip in Jenins Agent
yum install zip -y


#docker installation commands
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user

#We can't do resize ec2 instance volume in the ec2 instance creation.

# Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh