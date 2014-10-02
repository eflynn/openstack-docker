FROM buildpack-deps:jessie

ENV REFRESHED_AT 2014-10-02

RUN apt-get update && apt-get install -y \
             curl \
             python-dev \
             python-mysqldb \
             libldap2-dev \
          && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://bootstrap.pypa.io/get-pip.py | python
RUN mkdir /keystone

RUN git clone -b stable/icehouse https://github.com/openstack/keystone.git /keystone \
          && pip install /keystone \
          && rm -rf /keystone

RUN mkdir /etc/keystone
COPY docker-entrypoint.sh /entrypoint.sh
COPY keystone.conf /etc/keystone/
COPY keystone-paste.ini /etc/keystone/

ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 5000
EXPOSE 35357
CMD ["keystone-all"]
