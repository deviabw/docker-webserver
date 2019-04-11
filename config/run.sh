#!/bin/bash

set -e
TARGET_UID=$(stat -c "%u" /var/lib/mysql)
usermod -o -u $TARGET_UID mysql || true
TARGET_GID=$(stat -c "%g" /var/lib/mysql)
groupmod -o -g $TARGET_GID mysql || true
chown -R mysql:root /var/run/mysqld/

if [[ "$DOCKER_OSX" = "true" ]]; then
	cp /config/mysqld_innodb_osx.cnf /etc/mysql/conf.d/mysqld_innodb_osx.cnf;
else
	cp /config/mysqld_innodb.cnf /etc/mysql/conf.d/mysqld_innodb.cnf;
fi

if [[ ! -d /var/lib/mysql/mysql ]]; then
	rm /var/lib/mysql/* --force
	cp -Rp /db_default/* /var/lib/mysql/;
    service mysql start
    mysql -uroot -p123123 -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASS';"
 	mysql -uroot -p123123 -e "FLUSH PRIVILEGES;"
	service mysql stop
fi



exec supervisord -n



