FROM jacexh/wosai:ft

MAINTAINER Jace Xu <jace@xuh.me>
ENV REFRESHED_AT 2015-09-25

EXPOSE 8089
ENTRYPOINT ["locust"]
