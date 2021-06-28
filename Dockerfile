FROM        node:14-alpine3.13

LABEL       author="Noah" maintainer="noah@noahserver.online"

RUN         apk add --no-cache --update libc6-compat make libsodium libtool ffmpeg git python3 py3-pip \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
