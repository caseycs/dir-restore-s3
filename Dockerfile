FROM alpine:latest

RUN set -ex \
    && apk add --no-cache py-pip p7zip \
    && pip install s3cmd

ADD restore.sh /

ENTRYPOINT ["/restore.sh"]
