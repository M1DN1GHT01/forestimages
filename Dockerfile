# ----------------------------------
FROM        lawnenforcer/main:Ubuntu-18.04

MAINTAINER  Noah Smith

# Install Dependencies
RUN         apt update \
            && apt upgrade -y \
            && apt -y install minetest-server \
            && apt -y remove minetest-server minetest-data \
            && apt clean

USER        container
ENV         HOME /home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
