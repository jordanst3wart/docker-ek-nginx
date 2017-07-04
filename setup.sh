#!/bin/bash

sudo yum install git

git clone https://github.com/robbert229/docker-elk-nginx.git

cd docker-elk-nginx

sudo yum install httpd-tools

htpasswd -c ./kibana.htpasswd jenkins
# capsi1**

# for self signed cert, use the proper certs for prod servers
openssl genrsa -des3 -passout pass:x -out certificate.pass.key 2048
openssl rsa -passin pass:x -in certificate.pass.key -out certificate.key
openssl req -new -key certificate.key -out certificate.csr
openssl x509 -req -days 365 -in certificate.csr -signkey certificate.key -out certificate.crt

sudo yum install docker

curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > docker-compose

chmod +x docker-compose

sudo cp docker-compose /usr/local/bin

rm docker-compose

sudo service docker start

# had to replace PWD with the pwd variable

sudo /usr/local/bin/docker-compose up


# made sure 5602, 5603 is open
