# ----------------------------------
# Base Minecraft Docker File
# NoahServer.Online | ForestRacks.com
# ----------------------------------
FROM        openjdk:8-jre-slim

LABEL       author="Noah Smith" maintainer="noah@noahserver.online"

RUN apt-get update -y \
 && apt-get install -y curl ca-certificates openssl git tar sqlite fontconfig tzdata iproute2 \
 && useradd -d /home/container -m container
 
USER container
ENV  USER=container HOME=/home/container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/bash", "/entrypoint.sh"]
