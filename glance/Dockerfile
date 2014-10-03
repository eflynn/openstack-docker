FROM python:2.7.8

ENV REFRESHED_AT 2014-10-02

RUN mkdir /glance \
    && git clone -b stable/icehouse https://github.com/openstack/glance.git /glance \
    && pip install /glance \
    && rm -rf /glance

COPY /docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 9292
