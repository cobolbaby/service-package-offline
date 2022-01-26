#!/bin/bash
set -e
cd `dirname $0`

[[ $# -lt 1 ]] && {
    echo "Usage: $0 DOCKER_HOST_IP"
    exit 1
}
HOST=$1

source common.sh

set +o noglob

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

PGDATA=/data/ssd/postgres/12/data

h2 "[Step $item]: preparing environment ...";  let item+=1
if [ -n "$HOST" ]
then
    sed -i "s/\${DOCKER_HOST_IP}/$HOST/g" ./docker-compose.yml
    sed -i "s/\${PGDATA}/$PGDATA/g" ./docker-compose.yml
    # sed -i "s/\${DOCKER_HOST_IP}/$HOST/g" ./config/grafana/grafana.ini

    sudo mkdir -p $PGDATA
    sudo chown -R 999:999 $PGDATA
    sudo chmod -R 700 $PGDATA
fi

h2 "[Step $item]: starting infra service ...";  let item+=1
docker-compose up -d zoo broker postgres && sleep 20

# 等待 Kafka 启动之后，新建 Topic
h2 "[Step $item]: creating kafka topics ...";  let item+=1
docker exec -ti broker kafka-topics --create --if-not-exists --zookeeper zoo:2181 --topic insight-andon-init --partitions 3 --replication-factor 1
docker exec -ti broker kafka-topics --create --if-not-exists --zookeeper zoo:2181 --topic insight-andon-alarm --partitions 3 --replication-factor 1

h2 "[Step $item]: starting Andon ..."
docker-compose up -d

success "---- Andon has been installed and started successfully.----"

