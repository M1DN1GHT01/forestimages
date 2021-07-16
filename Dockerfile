# ----------------------------------
FROM        lawnenforcer/main:latest

MAINTAINER  Noah Smith

# Install Dependencies
RUN         apt update && \
            apt upgrade -y && \
            apt -y install minetest-server && \
            apt -y remove minetest-server minetest-data && \
            apt clean && \
            useradd -d /home/container -m container && \
            cd /home/container

USER        container
ENV         HOME /home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
