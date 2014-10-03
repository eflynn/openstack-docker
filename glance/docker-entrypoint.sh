#!/bin/bash

GLANCE_DB_USER=${GLANCE_DB_USER:-glance}
GLANCE_DB_NAME=${GLANCE_DB_NAME:-glance}

sed -e "s/%RABBITMQ_HOST%/$RABBITMQ_PORT_3306_TCP_ADDR/g" \
    -e "s/%DB_USER%/$GLANCE_DB_USER/g" \
    -e "s/%DB_PASS%/$GLANCE_DB_PASS/g" \
    -e "s/%DB_NAME%/$GLANCE_DB_NAME/g" \
    -e "s/%DB_HOST%/$MYSQL_PORT_3306_TCP_ADDR/g" \
    -i /etc/keystone/keystone.conf

exec "$@"
