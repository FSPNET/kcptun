# Docker-Kcptun

FSP Network Gen2 Server Infrastructure - kcptun client

![Docker Automated build](https://img.shields.io/docker/automated/fspnetwork/kcptun.svg?style=flat-square)
![Docker Build Status](https://img.shields.io/docker/build/fspnetwork/kcptun.svg?style=flat-square)
![GitHub](https://img.shields.io/github/license/fspnet/docker-kcptun.svg?style=flat-square)

![Kcptun](https://img.shields.io/badge/Kcptun-20181002-blue.svg?style=flat-square)

A docker image for [KCPTUN](https://github.com/xtaci/kcptun) client support

### Download from Docker Hub 

    docker pull fspnetwork/kcptun:client

### Usage

    docker run -d --restart=always -e "KCP_REMOTE=host" -e "PASSWORD=123456" -p 1024:1024 -p 1024:1024/udp --name kcpclient fspnetwork/kcptun:client

### Default configuration in environment variables

| Environment | Default |
| - | - |
| PASSWORD | 123456 |
| KCP_PORT | 1024 |
| KCP_REMOTE | host |