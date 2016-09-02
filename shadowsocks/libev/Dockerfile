FROM alpine:3.4

ENV SS_VER 2.5.0

RUN set -e \
    && apk update \
    && apk add --upgrade --no-cache --virtual .build-deps \
        build-base libev libtool autoconf make curl ca-certificates zlib-dev openssl-dev linux-headers asciidoc xmlto \
    && curl -fSL "https://github.com/shadowsocks/shadowsocks-libev/archive/v$SS_VER.tar.gz" -o shadowsocks.tar.gz \
    && tar -zxvf shadowsocks.tar.gz \
    && cd shadowsocks-libev-$SS_VER \
    && ./configure \
    && make \
    && make install \
    && cd .. \
    && rm -rf shadowsocks-libev-$SS_VER \
    && rm -f shadowsocks.tar.gz \
    && rm -rf /var/cache/apk/* \
    && apk del .build-deps

ADD entrypoint.sh .
ENTRYPOINT ["/entrypoint.sh"]
