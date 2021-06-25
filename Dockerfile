# ----------------------------------
# Environment: Alpine
# Main Alpine Docker Format
# ----------------------------------
FROM alpine:latest

LABEL author="Noah" maintainer="noah@noahserver.online"

ENV JAVA_HOME="/usr/lib/jvm/default-jvm/"
RUN apk add openjdk16

# Has to be set explictly to find binaries 
ENV PATH=$PATH:${JAVA_HOME}/bin


CMD ["jshell"]