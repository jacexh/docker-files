FROM python:2.7

MAINTAINER jacexh <jace@xuh.me>

ADD sources.list /etc/apt/
WORKDIR /workspace
RUN TZ="Asia/Shanghai" && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime

CMD ["python"]
