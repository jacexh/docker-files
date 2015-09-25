FROM jacexh/python:2.7.10

MAINTAINER Jace Xu <jace@xuh.me>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -yqq update

RUN apt-get install -yqq libffi-dev libzmq-dev libevent-dev libfreetype6-dev libxft-dev
RUN pip install --no-cache-dir -U setuptools pip
RUN pip install --no-cache-dir -U requests simplejson xmlrunner paramiko locustio pyzmq mock redis pymongo==2.8.1
RUN pip install --no-cache-dir -U matplotlib numpy
RUN pip install --no-cache-dir -U SQLAlchemy
RUN pip install --no-cache-dir -U selenium
RUN wget -qO- https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.8-linux-x86_64.tar.bz2 | tar jxv -C /opt
RUN ln -sf /opt/phantomjs-1.9.8-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
RUN pip install --no-cache-dir -U mysql-connector-python --allow-external mysql-connector-python
RUN pip install --no-cache-dir -U elasticsearch
RUN pip install --no-cache-dir -U pika

RUN mkdir -p /opt/workspace
WORKDIR /opt/workspace

ENV REFRESHED_AT 2015-09-25

ENTRYPOINT ["python"]
