#!/bin/bash

sed -e "s/%DB_USER%/$KEYSTONE_DB_USER/g" \
    -e "s/%DB_PASS%/$KEYSTONE_DB_PASS/g" \
    -e "s/%DB_NAME%/$KEYSTONE_DB_NAME/g" \
    -e "s/%DB_HOST%/$MYSQL_PORT_3306_TCP_ADDR/g" \
    -i /etc/keystone/keystone.conf

exec "$@"
