#!/usr/bin/env bash
#重新构建镜像
docker rm -f xxl-job-admin
docker rmi -f xxl-job-admin:0.0.1
docker build -t xxl-job-admin:0.0.1 .