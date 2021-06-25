# ----------------------------------
# Base Minecraft Docker File
# NoahServer.Online | ForestRacks.com
# ----------------------------------
FROM        openjdk:8-alpine

LABEL       author="Noah Smith" maintainer="noah@noahserver.online"

RUN apk add --no-cache --update curl ca-certificates openssl git tar bash sqlite fontconfig \
    && adduser --disabled-password --home /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
