#使用Ubuntu作為基礎鏡像
FROM ubuntu:latest

#將JDK加到鏡像中
COPY jdk17.tar.gz /usr/local/
RUN tar -xzf /usr/local/jdk17.tar.gz -C /usr/local/ && rm /usr/local/jdk17.tar.gz

#設定環境變數
ENV JAVA_HOME=/usr/local/jdk-17.0.12
ENV PATH=$JAVA_HOME/bin:$PATH

#統一編碼
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

#新增應用資料夾
WORKDIR /artticleManagementSystem

#複製應用JAR資料到容器
COPY artticleManagementSystem.jar artticleManagementSystem.jar

#顯示端口
EXPOSE 8081

#運行命令
ENTRYPOINT ["java","-Dfile.encoding=UTF-8","-jar","/artticleManagementSystem/artticleManagementSystem.jar"]