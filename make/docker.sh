#!/bin/bash

# 先找一台机器打包Docker离线安装包
# sudo yum install -y yum-utils
# sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
# yumdownloader --resolve docker-ce-19.03.15 docker-ce-cli-19.03.15 containerd.io
# tar -zcvf docker-ce.offline.tar.gz *.rpm

# 下载 docker-compose
# https://docs.docker.com/compose/install/
# curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o docker-compose
# tar -zcvf docker-compose.offline.tar.gz docker-compose

# 解压离线安装包
tar -zxvf docker-ce.offline.tar.gz

sudo rpm -ivh --replacefiles --replacepkgs *.rpm
sudo systemctl enable docker
sudo usermod -aG docker $USER
sudo systemctl start docker

tar -zxvf docker-compose.offline.tar.gz

sudo mv docker-compose /usr/local/bin/
sudo chmod +x /usr/local/bin/docker-compose
