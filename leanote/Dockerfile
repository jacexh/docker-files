FROM golang:1.5.1

MAINTAINER Jace Xu <jace@xuh.me>
ENV DEBIAN_FRONTEND noninteractive

# install leanote
RUN go get -u github.com/revel/cmd/revel
RUN go get -u github.com/leanote/leanote/app
ENV LEANOTE_VERSION 1.0.1
RUN cd "$GOPATH/src/github.com/leanote/leanote" \
    && git checkout tags/$LEANOTE_VERSION

# install mongodb
ENV MONGO_VERSION 3.0.6
ENV MONGO_DBPATH /data/db
ENV MONGO_LOG /data/log
RUN apt-get install -yqq curl
RUN curl -O https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-$MONGO_VERSION.tgz \
    && tar -zxvf mongodb-linux-x86_64-$MONGO_VERSION.tgz \
    && mv mongodb-linux-x86_64-$MONGO_VERSION/bin/* /usr/local/bin/ \
    && rm -f mongodb-linux-x86_64-$MONGO_VERSION.tgz \
    && rm -rf mongodb-linux-x86_64-$MONGO_VERSION
RUN mkdir -p $MONGO_DBPATH

EXPOSE 27017
EXPOSE 9000
COPY app.conf $GOPATH/src/github.com/leanote/leanote/conf/app.conf
COPY start.sh /root/start.sh
VOLUME ["$MONGO_DBPATH", "$MONGO_LOG"]
ENTRYPOINT ["/bin/bash", "$HOME/start.sh"]

# usage:
# docker run --leanote -v <localdb>:/data/db -v <locallog>:/data/log -d jacexh/leanote:1.0.1
