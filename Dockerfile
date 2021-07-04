
# ----------------------------------
# Discord Bot Python 3.8 Dockerfile
# NoahServer.online | ForestRacks.com
# ----------------------------------
FROM        python:3.8.2-alpine3.11

LABEL       author="Noah" maintainer="noah@noahserver.online"

RUN         apk add --no-cache --update git python3 py3-pip alpine-sdk curl \
            && adduser -D -h /home/container container

RUN         curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

USER        container
ENV         USER=container HOME=/home/container

WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh

CMD         ["/bin/ash", "/entrypoint.sh"]
