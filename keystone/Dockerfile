FROM python:2.7.8

ENV REFRESHED_AT 2014-10-03

RUN mkdir /keystone \
    && git clone -b stable/icehouse https://github.com/openstack/keystone.git /keystone \
    && pip install mysql-python \
    && pip install /keystone \
    && rm -rf /keystone

COPY docker-entrypoint.sh /entrypoint.sh
COPY keystone.conf /etc/
COPY keystone-paste.ini /etc/

ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 5000
EXPOSE 35357
CMD ["keystone-all"]
