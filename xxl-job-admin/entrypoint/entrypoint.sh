#!/usr/bin/env sh
#docker启动后指定的脚本
#/data/myworkspace/share_software/apache-tomcat-8.5.30/bin/startup.sh

#------打包xxl-job项目
cd /data/myworkspace/share_software/xxl-job && mvn clean install

#拷贝war包
cd ./xxl-job-admin/target/ && mv xxl-job-admin-1.9.2-SNAPSHOT.war /data/myworkspace/share_software/tomcat/webapps/xxl-job-admin.war

#启动tomcat
cd /data/myworkspace/share_software/tomcat/bin/

./startup.sh  &

#目的为了让容器不关闭,起一个前台进程
tail -f /dev/null