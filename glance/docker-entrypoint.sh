#!/bin/bash

GLANCE_DB_USER=${GLANCE_DB_USER:-glance}
GLANCE_DB_NAME=${GLANCE_DB_NAME:-glance}
GLANCE_SERVICE_USER=${GLANCE_SERVICE_USER:-glance}
SERVICE_TENANT_NAME=${SERVICE_TENANT_NAME:-service}

sed -e "s/%RABBITMQ_HOST%/$RABBITMQ_PORT_5672_TCP_ADDR/g" \
    -e "s/%DB_USER%/$GLANCE_DB_USER/g" \
    -e "s/%DB_PASSWORD%/$GLANCE_DB_PASSWORD/g" \
    -e "s/%DB_NAME%/$GLANCE_DB_NAME/g" \
    -e "s/%DB_HOST%/$MYSQL_PORT_3306_TCP_ADDR/g" \
    -e "s/%SERVICE_TENANT_NAME%/$SERVICE_TENANT_NAME/g" \
    -e "s/%SERVICE_USER%/$GLANCE_SERVICE_USER/g" \
    -e "s/%SERVICE_PASSWORD%/$GLANCE_SERVICE_PASSWORD/g" \
    -e "s/%KEYSTONE_HOST%/$KEYSTONE_PORT_35357_TCP_ADDR/g" \
    -i /etc/glance/glance-api.conf \
    /etc/glance/glance-registry.conf

exec "$@"
