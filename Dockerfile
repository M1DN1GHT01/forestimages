# ----------------------------------
# Environment: ubuntu
# BeamMP Server Docker
# ----------------------------------
FROM  ubuntu:18.04

LABEL author="Noah" maintainer="noah@noahserver.online"

ENV   DEBIAN_FRONTEND noninteractive

## add container user
RUN   useradd -m -d /home/container -s /bin/bash container

## update base packages
RUN   apt update \
 &&   apt upgrade -y

## install dependencies
RUN apt install -y git make cmake g++ liblua5.3 libz-dev rapidjson-dev libboost1.70-dev libboost1.70 libopenssl-dev

## install Repositories
RUN  add-apt-repository -y ppa:mhier/libboost-latest 

## configure locale
RUN   update-locale lang=en_US.UTF-8 \
 &&   dpkg-reconfigure --frontend noninteractive locales

COPY  ./entrypoint.sh /entrypoint.sh
CMD   ["/bin/bash", "/entrypoint.sh"]
