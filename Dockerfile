# ----------------------------------
# Forestracks.com | ForestRacks.com
# Environment: Mono
# ----------------------------------
FROM        lawnenforcer/forestimages:Mono-Base

LABEL       author="Noah Smith" maintainer="noah@noahserver.online"

RUN         apk add --update --no-cache openssl curl sqlite \
            && adduser -D -h /home/container container

USER        container
ENV         HOME=/home/container USER=container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
