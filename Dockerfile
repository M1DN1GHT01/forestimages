# ----------------------------------
# Forestracks.com | ForestRacks.com
# Environment: Mono
# ----------------------------------
FROM        lawnenforcer/forestimages:Mono-Base

LABEL       author="Noah Smith" maintainer="noah@noahserver.online"

RUN apk add --no-cache --update curl ca-certificates openssl git tar bash sqlite fontconfig alpine-sdk \
    && adduser --disabled-password --home /home/container container

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
