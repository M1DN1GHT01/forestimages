# ----------------------------------
# Environment: Debian, Mono
# Main Mono Docker Format
# ----------------------------------
FROM        mono:5

LABEL       author="Noah Smith" maintainer="noah@noahserver.online"

RUN         useradd -d /home/container -m container \
            && apt update \
            && apt install -y iproute2 unzip curl libc++-dev

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
