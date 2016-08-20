FROM ubuntu:16.04

MAINTAINER jacexh <jace@xuh.me>
ENV DEBIAN_FRONTEND noninteractive

ADD sources.list /etc/apt/
WORKDIR /workspace

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8
ENV PYTHON_VERSION 3.5.2

RUN set -x \
    && apt-get -yqq update \
    && apt-get -yqq install --no-install-recommends wget curl ca-certificates xz-utils build-essential zlib1g-dev libssl-dev \
    && apt-get purge -yqq python.* \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 97FC712E4C024BBEA48A61ED3A5CA953F73C700D \
    && mkdir -p /usr/src/python \
    && curl -SL "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz" -o python.tar.xz \
    && curl -SL "https://www.python.org/ftp/python/${PYTHON_VERSION%%[a-z]*}/Python-$PYTHON_VERSION.tar.xz.asc" -o python.tar.xz.asc \
    && gpg --verify python.tar.xz.asc \
    && tar -xJC /usr/src/python --strip-components=1 -f python.tar.xz \
    && rm python.tar.xz* \
    && cd /usr/src/python \
    && ./configure --enable-shared --enable-unicode=ucs4 \
    && make -j$(nproc) \
    && make install \
    && ldconfig \
    && pip3 install --no-cache-dir --upgrade pip \
    && find /usr/local \
        \( -type d -a -name test -o -name tests \) \
        -o \( -type f -a -name '*.pyc' -o -name '*.pyo' \) \
        -exec rm -rf '{}' + \
    && rm -rf /usr/src/python \
    && apt-get purge -y --auto-remove wget curl ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && cd /usr/local/bin \
    && ln -s easy_install-3.5 easy_install \
    && ln -s idle3 idle \
    && ln -s pydoc3 pydoc \
    && ln -s python3 python \
    && ln -s python-config3 python-config

CMD ["python3"]
