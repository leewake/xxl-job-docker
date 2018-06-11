FROM daocloud.io/centos:7

#作者信息
MAINTAINER Arthur <jli8@xiaohongshu.com>

#设置字符编码
ENV LC_ALL en_US.UTF-8


# 设置时区
ENV TZ Asia/Shanghai
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


#切换镜像目录，进入/data/myworkspace目录
WORKDIR /data/myworkspace

#共享的软件文件夹
VOLUME /data/myworkspace/share_software

#设置目录权限 只要本地是有权限的cp进去的文件夹都有权限
#RUN  cd /data/myworkspace/tomcat \
#&& chmod 755 -R * \
#&& cd /data/myworkspace/jdk \
#&& chmod 755 -R *

# 配置环境变量
ENV JAVA_HOME /data/myworkspace/share_software/jdk1.8.0_144
ENV JRE_HOME=$JAVA_HOME/jre
ENV M2_HOME /data/myworkspace/share_software/apache-maven-3.5.0
ENV CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin:$M2_HOME/bin:$JRE_HOME/bin
ENV TOMCAT_HOME /data/share_software/apache-tomcat-8.5.30

#copy命令如果目的文件不存在会自动创建
#将宿主机的jdk目录下的文件拷至镜像的/data/myworkspace/jdk目录下
#COPY "/software/jdk1.8.0_144" "/data/myworkspace/jdk/"
##将宿主机的tomcat目录下的文件拷至镜像的/data/myworkspace/tomcat目录下
#COPY "/software/apache-tomcat-8.5.30" "/data/myworkspace/tomcat/"
COPY "/entrypoint/entrypoint.sh" "/data/myworkspace/"
#COPY "/target/xxl-job-admin-1.9.2-SNAPSHOT.war" "/data/myworkspace/"

#公开端口 这个其实还是要创建容器的时候指定才有作用
#EXPOSE 8091

#设置启动命令
#ENTRYPOINT ["/data/myworkspace/share_software/tomcat/bin/startup.sh","&&","tail","-f","/dev/null"]
#ENTRYPOINT ["tail","-f","/dev/null"]
ENTRYPOINT ["/data/myworkspace/entrypoint.sh"]