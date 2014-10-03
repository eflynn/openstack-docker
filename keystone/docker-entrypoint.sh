#!/bin/bash

if [ -z "$KEYSTONE_DB_PASSWORD" ]; then
    echo >&2 'error: missing KEYSTONE_DB_PASSWORD environment variable'
    exit 1
fi

KEYSTONE_DB_USER=${KEYSTONE_DB_USER:-keystone}
KEYSTONE_DB_NAME=${KEYSTONE_DB_NAME:-keystone}

sed -e "s/%DB_USER%/$KEYSTONE_DB_USER/g" \
    -e "s/%DB_PASSWORD%/$KEYSTONE_DB_PASSWORD/g" \
    -e "s/%DB_NAME%/$KEYSTONE_DB_NAME/g" \
    -e "s/%DB_HOST%/$MYSQL_PORT_3306_TCP_ADDR/g" \
    -i /etc/keystone.conf

exec "$@"
