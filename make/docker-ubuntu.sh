#!/bin/bash

# 先找一台机器打包Docker离线安装包
# wget https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce-cli_19.03.15~3-0~ubuntu-bionic_amd64.deb
# wget https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce_19.03.15~3-0~ubuntu-bionic_amd64.deb
# wget https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/containerd.io_1.4.3-2_amd64.deb
# wget http://security.ubuntu.com/ubuntu/pool/main/libs/libseccomp/libseccomp2_2.5.1-1ubuntu1~18.04.2_amd64.deb
# tar -zcvf docker-ce-ubuntu.offline.tar.gz *.deb

# 下载 docker-compose
# https://docs.docker.com/compose/install/
# curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o docker-compose
# tar -zcvf docker-compose.offline.tar.gz docker-compose

# 解压离线安装包
tar -zxvf docker-ce-ubuntu.offline.tar.gz

sudo dpkg -i *.deb
sudo usermod -aG docker $USER
sudo chmod 666 /var/run/docker.sock

tar -zxvf docker-compose.offline.tar.gz

sudo mv docker-compose /usr/local/bin/
sudo chmod +x /usr/local/bin/docker-compose
