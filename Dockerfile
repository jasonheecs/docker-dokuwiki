FROM bitnami/dokuwiki:latest

LABEL name="jasonheecs/dokuwiki"
LABEL version="1.0.0"
LABEL maintainer="hello@jasonhee.com"

COPY rootfs /
COPY conf /opt/bitnami/dokuwiki

EXPOSE 80 443

ENTRYPOINT ["/app-entrypoint.sh"]
CMD ["nami","start","--foreground","apache"]