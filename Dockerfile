# ----------------------------------
# Environment: Debian / Ubuntu
# BeamMP Server Docker
# ----------------------------------
FROM debian:buster-slim

LABEL author="Noah" maintainer="noah@noahserver.online"

ENV DEBIAN_FRONTEND noninteractive

## add container user
RUN useradd -m -d /home/container -s /bin/bash container

RUN ln -s /home/container/ /nonexistent

ENV USER=container HOME=/home/container

## update base packages
RUN apt update \
 && apt upgrade -y

## install dependencies
RUN apt install -y git make cmake g++ liblua5.3 libz-dev rapidjson-dev libboost1.70-dev libboost1.70 libopenssl-dev

## install Repositories
RUN  add-apt-repository -y ppa:mhier/libboost-latest 

## configure locale
RUN update-locale lang=en_US.UTF-8 \
 && dpkg-reconfigure --frontend noninteractive locales

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]