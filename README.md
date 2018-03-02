[![CircleCI](https://circleci.com/gh/whatever4711/minidlna.svg?style=svg)](https://circleci.com/gh/whatever4711/minidlna)

[![](https://images.microbadger.com/badges/version/whatever4711/minidlna.svg)](https://microbadger.com/images/whatever4711/minidlna "Get your own version badge on microbadger.com")[![](https://images.microbadger.com/badges/image/whatever4711/minidlna.svg)](https://microbadger.com/images/whatever4711/minidlna "Get your own image badge on microbadger.com")[![](https://images.microbadger.com/badges/commit/whatever4711/minidlna.svg)](https://microbadger.com/images/whatever4711/minidlna "Get your own commit badge on microbadger.com")

# Minidlna in a Container

Currently, this is a docker image based on Alpine to server minidlna.

## Supported Architectures

This multiarch image supports `amd64`, `i386`, `arm32v6`, `arm64v8`, `ppc64le`, and `s390x` on Linux

## Starting the Container
`docker container run -d --name minidlna --privileged --network host whatever4711/minidlna`
Thereafter you can access picapport on http://localhost:8080

## Deploying with Docker-compose

After creating and modifying the following `docker-compose.yml`, just call `docker-compose up -d`

```[docker-compose.yml]
version: '3'

volumes:
  db:
  media:

services:
  audio:
    image: whatever4711/minidlna
    restart: always
    volumes:
      - /etc/timezone:/etc/timezone:ro
      - /etc/localtime:/etc/localtime:ro
      - media:/media
      - db:/var/cache/minidlna
    network_mode: host
```
