FROM python:2.7-alpine

MAINTAINER Jace Xu <jace@xuh.me>

ENV ALPINE_VER 3.4
ENV WORKSPACE /workspace
ENV TZ "Asia/Shanghai"

RUN echo "http://mirrors.tuna.tsinghua.edu.cn/alpine/v$ALPINE_VER/main" > /etc/apk/repositories \
    && echo "http://mirrors.tuna.tsinghua.edu.cn/alpine/v$ALPINE_VER/community" >> /etc/apk/repositories \
    && apk update \
    && apk add tzdata libffi libzmq libevent libev libxft libjpeg libpng freetype-dev libxml2 libxslt git \
    && git clone https://github.com/mysql/mysql-connector-python.git \
    && pip install --no-cache-dir -U setuptools pip elasticsearch pika numpy matplotlib selenium \
    requests simplejson xmlrunner paramiko pyzmq mock redis pymongo jsonpickle qrcode pillow lxml \
    python-json-logger nose lxml fake-factory sphinx \
    sphinx_rtd_theme locustio jupyter influxdb \
    && cd mysql-connector-python \
    && python setup.py install \
    && cd .. \
    && rm -rf mysql-connector-python \
    && apk del git \
    && rm -rf /var/cache/apk/* \
    && ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/localtime \
    && mkdir -p $WORKSPACE

WORKDIR $WORKSPACE
EXPOSE 8089
ENV REFRESHED_AT 2016-06-18

CMD ["python"]
