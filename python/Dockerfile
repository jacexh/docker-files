FROM python:2.7-alpine

MAINTAINER Jace Xu <jace@xuh.me>

ENV ALPINE_VER 3.4
ENV WORKSPACE /workspace
ENV TZ "Asia/Shanghai"

RUN echo "http://mirrors.tuna.tsinghua.edu.cn/alpine/v$ALPINE_VER/main" > /etc/apk/repositories \
    && echo "http://mirrors.tuna.tsinghua.edu.cn/alpine/v$ALPINE_VER/community" >> /etc/apk/repositories \
    && apk update \
    && apk add --update --no-cache tzdata build-base libffi libevent libev libxft \
    libjpeg libpng freetype-dev libxml2 libxslt curl \
    && pip install --no-cache-dir -U setuptools pip matplotlib numpy
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
