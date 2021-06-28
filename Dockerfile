FROM postgres:13.1-alpine

LABEL author="Noah" maintainer="noah@noahserver.online"

RUN adduser -D -h /home/container container

USER container
ENV HOME /home/container
WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh
CMD ["/bin/bash", "/entrypoint.sh"]
