# ----------------------------------
# Forestracks.com | ForestRacks.com
# Environment: Mono
# ----------------------------------
FROM        lawnenforcer/forestimages:Mono-Base

LABEL       author="Noah Smith" maintainer="noah@noahserver.online"

RUN         useradd -d /home/container -m container \
            && apt update \
            && apt install -y iproute2 ca-certificates unzip sqlite fontconfig

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
