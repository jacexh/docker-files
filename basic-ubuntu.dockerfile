FROM ubuntu:14.04

MAINTAINER Jace Xu <jace@xuh.me>

# set apt-get mirror sites
RUN echo "deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse\ndeb http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse\ndeb http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse\ndeb http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse\ndeb http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse\ndeb-src http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse\ndeb-src http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse\ndeb-src http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse\ndeb-src http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse\ndeb-src http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" > /etc/apt/sources.list
RUN apt-get update -y && apt-get upgrade -y && apt-get autoremove

# set time zone
RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
