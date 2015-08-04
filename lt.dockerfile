FROM jacexh/wosai:ft

MAINTAINER Jace Xu <jace@xuh.me>
ENV REFRESHED_AT 2015-08-05

EXPOSE 8089
ENTRYPOINT ["locust"]
