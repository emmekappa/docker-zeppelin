FROM ubuntu:14.04

MAINTAINER Michele Cantelli <emmekappa@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update
RUN apt-get install -y --force-yes software-properties-common python-software-properties
RUN apt-add-repository -y ppa:webupd8team/java
RUN /bin/echo debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get -y update
RUN apt-get -y install oracle-java7-installer oracle-java7-set-default git npm wget

RUN wget http://it.apache.contactlab.it/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz
RUN mkdir -p /usr/local/apache-maven	
RUN mv apache-maven-3.3.3-bin.tar.gz /usr/local/apache-maven
RUN cd /usr/local/apache-maven && tar -zxvf apache-maven-3.3.3-bin.tar.gz 
ENV M2_HOME=/usr/local/apache-maven/apache-maven-3.3.3
ENV M2=$M2_HOME/bin
ENV MAVEN_OPTS="-Xms256m -Xmx512m"
ENV PATH=$M2:$PATH

RUN git clone https://github.com/apache/incubator-zeppelin
RUN cd incubator-zeppelin
RUN cd incubator-zeppelin && mvn clean package -Pspark-1.3 -Dhadoop.version=2.4.0 -Phadoop-2.4 -DskipTests
RUN cp incubator-zeppelin/conf/zeppelin-env.sh.template incubator-zeppelin/conf/zeppelin-env.sh
RUN cp incubator-zeppelin/conf/zeppelin-site.xml.template incubator-zeppelin/conf/zeppelin-site.xml
#RUN echo "MASTER=$SPARK_MASTER" >> conf/zeppelin-env.sh

WORKDIR /incubator-zeppelin
ADD run.sh /incubator-zeppelin/run.sh
RUN chmod +x /incubator-zeppelin/run.sh
CMD run.sh

EXPOSE 8080 8081 4040
#8888 8081 4040 7001 7002 7003 7004 7005 7006 
