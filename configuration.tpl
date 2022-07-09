#!/bin/bash

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

 sudo mkdir -p /etc/apt/keyrings
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

 echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


 sudo apt-get update -y
 sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

 sudo usermod -aG docker $USER

 sudo chmod 666 /var/run/docker.sock

 sudo service docker start

 sudo systemctl enable docker.service
 
 sudo systemctl restart docker

 #kubernets installation 

 curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl 

 chmod +x ./kubectl

 mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin

 echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc

 kubectl version --short --client

#eksctl installation 

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp

sudo mv /tmp/eksctl /usr/local/bin   

#terraform installation

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

sudo apt-get update -y  && sudo apt-get install terraform
