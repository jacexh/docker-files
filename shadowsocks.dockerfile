FROM ubuntu:14.04

MAINTAINER Jace Xu <jace@xuh.me>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -yqq update
RUN apt-get install -yqq wget
RUN wget -O- http://shadowsocks.org/debian/1D27208A.gpg | sudo apt-key add - \
    && echo "deb http://shadowsocks.org/debian wheezy main" >> /etc/apt/sources.list
RUN apt-get -yqq update
RUN apt-get install -yqq shadowsocks-libev

ENV REFRESHED_AT 2015-09-28
ENTRYPOINT ["/usr/bin/ss-server"]
CMD ['']

