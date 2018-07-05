#!/bin/bash -e

. /opt/bitnami/base/functions
. /opt/bitnami/base/helpers

print_welcome_page

if [[ "$1" == "nami" && "$2" == "start" ]] || [[ "$1" == "/init.sh" ]]; then
  nami_initialize apache php dokuwiki
  info "Starting dokuwiki... "
fi

mkdir -p /bitnami/dokuwiki && ln -s /opt/bitnami/dokuwiki/inc/ /bitnami/dokuwiki/
chown -R daemon:daemon /bitnami/dokuwiki/inc

exec tini -- "$@"