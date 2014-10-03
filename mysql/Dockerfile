FROM mysql:5.6.20

COPY my-utf8.cnf /usr/local/mysql/

CMD ["mysqld", "--defaults-extra-file=my-utf8.cnf", "--datadir=/var/lib/mysql", "--user=mysql"]
