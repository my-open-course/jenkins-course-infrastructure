#!/usr/bin/env bash

function deploy_docker_compose() {
  docker-compose config

  network_name="jenkins_network"
  network_exist=$(docker network ls | grep ${network_name} | awk '{print $1}')
  if [[ ${network_exist} ]]; then
    docker-compose --compatibility up -d --remove-orphans
  else
    docker network create ${network_name} && docker-compose --compatibility up -d --remove-orphans
  fi

  echo "$(date '+%Y-%m-%d %H:%M:%S') ======= 删除没使用且是10天之前的镜像"
  docker image prune -a --force --filter "until=240h"

  echo "$(date '+%Y-%m-%d %H:%M:%S') ======= 磁盘和内存使用情况"
  df -h && free -h
}

deploy_docker_compose
