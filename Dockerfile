FROM node:latest
MAINTAINER Francisco Guimarães <francisco.cpg@gmail.com>

RUN groupadd -r -g 1000 app && \
    useradd -u 1000 -m -d /app -r -g app app

WORKDIR /app

ADD . /app

RUN npm i --silent -g pm2 && \
    npm i --silent && \
    npm run build --silent && \
    npm link --silent

WORKDIR /data
VOLUME /data

RUN chown app:app -R /app && \
    chown app:app -R /data

USER app  

EXPOSE 80
ADD run.sh /run.sh
ENTRYPOINT ["bash", "/run.sh"]
CMD []