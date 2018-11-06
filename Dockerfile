# Shadowsocks Server with KCPTUN support Dockerfile

FROM alpine:3.8

ENV KCP_VER 20181002

RUN \
    apk add --no-cache --virtual .build-deps curl \
    && wget --no-check-certificate https://github.com/xtaci/kcptun/releases/download/v$KCP_VER/kcptun-linux-amd64-$KCP_VER.tar.gz && tar -zxf kcptun-linux-amd64-$KCP_VER.tar.gz -C /usr/local/bin client_linux_amd64 \
    && apk del .build-deps \
    && apk add --no-cache supervisor

COPY supervisord.conf /etc/supervisord.conf
COPY config.json /etc/kcptun.json

ENV KCP_PORT=1024 PASSWORD=123456 KCP_REMOTE=host

EXPOSE ${KCP_PORT}/tcp ${KCP_PORT}/udp

ENTRYPOINT ["/usr/bin/supervisord"]

