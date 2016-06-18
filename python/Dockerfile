FROM python:2.7-alpine

MAINTAINER Jace Xu <jace@xuh.me>

ENV ALPINE_VER 3.4
ENV WORKSPACE /workspace
ENV TZ "Asia/Shanghai"

RUN echo "http://mirrors.tuna.tsinghua.edu.cn/alpine/v$ALPINE_VER/main" > /etc/apk/repositories \
    && echo "http://mirrors.tuna.tsinghua.edu.cn/alpine/v$ALPINE_VER/community" >> /etc/apk/repositories \
    && echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk update \
    && apk add tzdata build-base py-numpy@testing libffi libzmq libevent libev libxft libjpeg libpng freetype-dev libxml2 libxslt curl \
    && pip install --no-cache-dir -U setuptools pip elasticsearch matplotlib pika selenium \
    requests simplejson xmlrunner paramiko pyzmq mock redis pymongo jsonpickle qrcode pillow lxml \
    python-json-logger nose lxml fake-factory sphinx \
    sphinx_rtd_theme locustio jupyter influxdb \
    && curl -fSL "https://github.com/mysql/mysql-connector-python/archive/2.1.3.tar.gz" -o mysql.tar.gz \
    && tar -zxvf mysql.tar.gz \
    && cd mysql-connector-python \
    && python setup.py install \
    && cd .. \
    && rm -rf mysql-connector-python \
    && rm -rf /var/cache/apk/* \
    && ln -sf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/localtime \
    && mkdir -p $WORKSPACE

WORKDIR $WORKSPACE
EXPOSE 8089
ENV REFRESHED_AT 2016-06-18

CMD ["python"]
