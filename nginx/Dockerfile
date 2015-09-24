FROM centos:centos7
ENV ZEPPELIN_USER=zeppelin
ENV ZEPPELIN_PASSWORD=zeppelingo

RUN yum -y clean all
RUN yum -y update
RUN yum -y install epel-release
RUN yum -y install openssh-clients
RUN yum -y install openssl
RUN yum -y install nginx
RUN yum -y install httpd-tools
#RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/cert.key -out /etc/nginx/cert.crt

EXPOSE 8080
EXPOSE 8081

ADD nginx.conf /etc/nginx/nginx.conf
ADD run.sh run.sh
#ADD htpasswd /etc/nginx/.htpasswd
RUN htpasswd -cb /etc/nginx/.htpasswd $ZEPPELIN_USER $ZEPPELIN_PASSWORD

CMD bash run.sh
