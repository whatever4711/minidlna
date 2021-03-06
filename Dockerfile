FROM alpine
ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
ARG VERSION

COPY minidlna.conf /etc/minidlna.conf
COPY alpine.sh /entrypoint.sh
RUN set -ex \
 && chmod +x entrypoint.sh \
 && apk add --no-cache \
        minidlna \
        su-exec \
        tini \
 && addgroup -S -g 1000 dlna \
 && adduser -S -D -h /var/cache/minidlna -s /sbin/nologin -G dlna -g dlna -u 1000 dlna

VOLUME ["/media", "/var/cache/minidlna"]
EXPOSE 8200

ENTRYPOINT ["/sbin/tini", "--", "/entrypoint.sh"]
CMD ["start"]

LABEL de.whatever4711.minidlna.version=$VERSION \
    de.whatever4711.minidlna.name="PicApport" \
    de.whatever4711.minidlna.docker.cmd="docker container run -d --privileged --network host whatever4711/minidlna" \
    de.whatever4711.minidlna.vendor="Marcel Grossmann" \
    de.whatever4711.minidlna.architecture=$TARGETPLATFORM \
    de.whatever4711.minidlna.vcs-ref=$VCS_REF \
    de.whatever4711.minidlna.vcs-url=$VCS_URL \
    de.whatever4711.minidlna.build-date=$BUILD_DATE \
