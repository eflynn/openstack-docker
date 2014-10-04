FROM python:2.7.8

RUN groupadd -r keystone && useradd -r -g keystone keystone

RUN pip install mysql-python \
    && pip install git+https://github.com/openstack/keystone.git@stable/icehouse

COPY docker-entrypoint.sh /entrypoint.sh
COPY etc /etc/keystone/

RUN chown -R keystone: /etc/keystone
USER keystone

ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 5000
EXPOSE 35357
CMD ["keystone-all"]
