FROM        node:14.17.0-buster-slim

LABEL       author="Noah" maintainer="noah@noahserver.online"

RUN         apt update \
            && apt -y install ffmpeg iproute2 git sqlite3 python3 ca-certificates dnsutils iputils-ping build-essential \
            && useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
