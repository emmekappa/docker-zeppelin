# docker-zeppelin

## Zeppelin container 

By default it just the port 4040 is exposed (Spark executor web interface).

### Environment variables 
* *ZEPPELIN_JAVA_OPTS* to configure spark max cores and executor memory
* *ZEPPELIN_MEM* to configure additional JVM options ("-Xmx1024m -XX:MaxPermSize=512m")

## Nginx container

Provides authentication and SSL over Zeppelin.
Exposed over port 8080.

### Environment variables 

* *ZEPPELIN_USER* to configure username for Nginx authentication 
* *ZEPPELIN_PASSWORD* to configure password for Nginx authentication
