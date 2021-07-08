FROM        lawnenforcer/main:Base-Glibc

LABEL author="Noah" maintainer="noah@noahserver.online"

RUN         apk add --update --no-cache curl ca-certificates openssl libstdc++ busybox-extras binutils \
            && apk add libc-dev jq --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
