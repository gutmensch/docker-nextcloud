ARG NEXTCLOUD_VERSION=23.0.0

FROM nextcloud:${NEXTCLOUD_VERSION}-apache

ARG NEXTCLOUD_UID=2070
ARG NEXTCLOUD_GID=2070

RUN usermod -u 2070 www-data \
  && groupmod -g 2070 www-data \
  && bash -c "find / \\( -uid 33 -o -gid 33 \\) -exec chown ${NEXTCLOUD_UID}:${NEXTCLOUD_GID} {} \; || true"
