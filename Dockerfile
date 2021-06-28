
# ----------------------------------
# Discord Bot Python 3.7 Dockerfile
# NoahServer.online | ForestRacks.com
# ----------------------------------
FROM        python:3.7-alpine3.13

LABEL       author="Noah" maintainer="noah@noahserver.online"

RUN         apk add --no-cache --update git python3 py3-pip alpine-sdk \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/ash", "/entrypoint.sh"]
