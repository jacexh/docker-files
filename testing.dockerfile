FROM jacexh/python:2.7.6

MAINTAINER Jace Xu <jace@xuh.me>
ENV REFRESHED_AT 2015-06-22
ENV DEBIAN_FRONTEND noninteractive

# RUN echo "deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" > /etc/apt/sources.list
# RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
# RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
# RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list
# RUN echo "deb http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list
# RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse" >> /etc/apt/sources.list
# RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse" >> /etc/apt/sources.list
# RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse" >> /etc/apt/sources.list
# RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse" >> /etc/apt/sources.list
# RUN echo "deb-src http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse" >> /etc/apt/sources.list

# set time zone
# RUN echo "Asia/Shanghai" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

RUN apt-get -y update
# RUN apt-get install -y wget curl
# RUN apt-get install -y python python-dev
# RUN wget https://bootstrap.pypa.io/get-pip.py -O - | python


# 安装依赖
RUN apt-get install -y libssl-dev libffi-dev libzmq-dev libevent-dev
RUN pip install -U pyopenssl ndg-httpsclient pyasn1 requests simplejson xmlrunner paramiko locustio pyzmq mock redis pymongo==2.8
RUN apt-get install -y python-matplotlib python-numpy
RUN pip install -U selenium
RUN wget -qO- https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.8-linux-x86_64.tar.bz2 | tar jxv -C /opt
RUN ln -sf /opt/phantomjs-1.9.8-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs

EXPOSE 8089
