FROM ubuntu

MAINTAINER Vitalii_Cherkashyn
LABEL owner="Vitalii"\
      project="docker-images"\
      module="ubuntu-java-tomcat"

# ADD JAVA repo
RUN apt-get update && apt-get install -y curl \
  python-software-properties \
  software-properties-common \
  && add-apt-repository ppa:webupd8team/java

RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
 && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections \
 && apt-get update && apt-get -y install oracle-java7-installer

#  install Tomcat
RUN mkdir -p /opt/tomcat

RUN wget -SL http://apache.volia.net/tomcat/tomcat-7/v7.0.70/bin/apache-tomcat-7.0.70.zip

RUN apt-get install unzip
RUN unzip apache-tomcat-7.0.70.zip -d /opt/tomcat

#clean up tomat
RUN rm -Rf /opt/tomcat/apache-tomcat-7.0.70/webapps/docs /opt/tomcat/apache-tomcat-7.0.70/webapps/examples

# >>>   place for custom war file <<<
# ADD ../mock-server/target/allianz-mock.war /opt/tomcat/webapps/allianz-mock.war
COPY files/allianz-mock.war /opt/tomcat/apache-tomcat-7.0.70/webapps/allianz-mock.war

# Expose tomcat
EXPOSE 8080

# ENV JAVA_OPTS -server -XX:+DisableExplicitGC -XX:+UseConcMarkSweepGC \
#   -Xms1G -Xmx2G -XX:PermSize=1G -XX:MaxPermSize=2G

# ENV LANG en_US.UTF-8
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

RUN chmod +x /opt/tomcat/apache-tomcat-7.0.70/bin/*.sh

# WORKDIR /opt/tomcat/apache-tomcat-7.0.70
CMD ["/opt/tomcat/apache-tomcat-7.0.70/bin/catalina.sh","run"]
