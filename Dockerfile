# ----------------------------------
# Environment: MariaDB
# ForestRacks.com | NoahServer.online
# ----------------------------------
FROM        mariadb:10.3

LABEL       author="Noah" maintainer="noah@noahserver.online"

ENV         DEBIAN_FRONTEND noninteractive

RUN         apt update -y \
            && apt install -y netcat \
            && useradd -d /home/container -m container -s /bin/bash

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
