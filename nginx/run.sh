#!/bin/sh
 
# From https://gist.github.com/xaviervia/6adea3ddba269cadb794

env

# Preprend the upstream configuration
sed -i s/ZEPPELIN_PORT_8080_TCP_ADDR/${ZEPPELIN_PORT_8080_TCP_ADDR}/g /etc/nginx/nginx.conf 
sed -i s/ZEPPELIN_PORT_8080_TCP_PORT/${ZEPPELIN_PORT_8080_TCP_PORT}/g /etc/nginx/nginx.conf

# log result
cat /etc/nginx/nginx.conf
 
# Start nginx
nginx
