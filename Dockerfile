FROM node:9.4.0-onbuild

RUN echo "deb http://ftp.us.debian.org/debian testing main contrib non-free" >> /etc/apt/sources.list \
     &&      apt-get update              \
     &&      apt-get install -y git      \
     &&      apt-get clean all