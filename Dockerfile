FROM node:latest
MAINTAINER Francisco Guimarães <francisco.cpg@gmail.com>

WORKDIR /app

ADD . /app

RUN npm run build && \
    ln -s /app/bin/index.js /usr/bin/json-server

WORKDIR /data
VOLUME /data

EXPOSE 80
ADD run.sh /run.sh
ENTRYPOINT ["bash", "/run.sh"]
CMD []