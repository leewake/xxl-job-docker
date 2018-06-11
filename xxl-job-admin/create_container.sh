#!/usr/bin/env bash
#运行容器
docker rm -f  xxl-job-admin
docker run  -d -p 8090:8080 -p 3307:3306 \
-v /data/share_software:/data/myworkspace/share_software \
--add-host=localhost:192.168.1.102 \
--name xxl-job-admin xxl-job-admin:0.0.1

docker logs -f  xxl-job-admin
