# Shadowsocks Server with KCPTUN support Dockerfile

FROM fspnetwork/ss

ENV KCP_VER 20181002

RUN \
    apk add --no-cache --virtual .build-deps curl \
    && curl -fSL https://github.com/xtaci/kcptun/releases/download/v$KCP_VER/kcptun-linux-amd64-$KCP_VER.tar.gz | tar xz -C /usr/local/bin server_linux_amd64 \
    && apk del .build-deps \
    && apk add --no-cache supervisor

COPY supervisord.conf /etc/supervisord.conf
COPY config.json /etc/kcptun.json

ENV KCP_PORT=1024 PASSWORD=123456

EXPOSE ${KCP_PORT}/tcp ${KCP_PORT}/udp

ENTRYPOINT ["/usr/bin/supervisord"]

