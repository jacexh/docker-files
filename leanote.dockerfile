FROM golang

MAINTAINER Jace Xu <jace@xuh.me>

RUN go get -u github.com/revel/cmd/revel
RUN go get -u github.com/leanote/leanote/app

EXPOSE 9000
WORKDIR /root
CMD revel run github.com/leanote/leanote prod

