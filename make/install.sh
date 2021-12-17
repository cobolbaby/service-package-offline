#!/bin/bash
set -e
cd `dirname $0`

[[ $# -lt 1 ]] && {
    echo "Usage: $0 DOCKER_HOST_IP"
    exit 1
}
host=$1

source common.sh

item=1

h2 "[Step $item]: checking if docker is installed ..."; let item+=1
check_docker

h2 "[Step $item]: checking docker-compose is installed ..."; let item+=1
check_dockercompose

if [ -f andon*.tar.gz ]
then
    h2 "[Step $item]: loading Andon images ..."; let item+=1
    docker load -i ./andon*.tar.gz
fi

h2 "[Step $item]: preparing environment ...";  let item+=1
if [ -n "$host" ]
then
    sed -i "s/\$\{DOCKER_HOST_IP\}/$host/g" ./docker-compose.yml
fi

h2 "[Step $item]: starting Andon ..."
docker-compose up -d

success "---- Andon has been installed and started successfully.----"

