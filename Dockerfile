FROM node:9.4.0

RUN echo "deb http://ftp.us.debian.org/debian testing main contrib non-free" >> /etc/apt/sources.list \
     &&      apt-get update              \
     &&      apt-get install -y git      \
     &&      apt-get clean all

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD ARG NODE_ENV
ONBUILD ENV NODE_ENV $NODE_ENV
ONBUILD COPY package.json /usr/src/app/
ONBUILD RUN npm install && npm cache clean --force
ONBUILD COPY . /usr/src/app

CMD [ "npm", "start" ]