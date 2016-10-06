FROM node:latest
MAINTAINER Francisco Guimarães <francisco.cpg@gmail.com>

WORKDIR /app

ADD . /app

RUN npm i --silent && \
    npm run build --silent && \
    npm link

WORKDIR /data
VOLUME /data

EXPOSE 80
ADD run.sh /run.sh
ENTRYPOINT ["bash", "/run.sh"]
CMD []