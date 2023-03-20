FROM ubuntu:latest
RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat
RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install openjdk-8-jdk
RUN apt install curl -y
RUN apt install wget -y
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.73/bin/apache-tomcat-9.0.73.tar.gz
RUN tar -xzvf apache*.tar.gz
RUN mv apache-tomcat-9.0.73/* /opt/tomcat/.

## student.war file
WORKDIR /opt/tomcat/webapps   
RUN curl -O -L https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war

## mysql-connector.jar file
WORKDIR /opt/tomcat/lib
RUN curl -O https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar

EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
