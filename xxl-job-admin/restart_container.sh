#!/usr/bin/env bash
#停止容器
cd /data/share_software/xxl-job/xxl-job-admin
#git pull
docker stop /xxl-job-admin
docker start /xxl-job-admin
docker logs -f  /xxl-job-admin