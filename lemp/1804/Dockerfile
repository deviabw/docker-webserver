FROM iabd/base_webserver_nginx_php_7_2

RUN apt-get -y install supervisor

RUN mkdir -p /config
RUN chmod -R 777 /config



ADD config/supervisord/supervisord-nginx.conf /etc/supervisor/conf.d/supervisord-nginx.conf
ADD config/supervisord/start-nginx.sh /start-nginx.sh
ADD config/supervisord/supervisord-mysqld.conf /etc/supervisor/conf.d/supervisord-mysqld.conf
ADD config/supervisord/start-mysqld.sh /start-mysqld.sh
ADD config/supervisord/supervisord-php7.2-fpm.conf /etc/supervisor/conf.d/supervisord-php7.2-fpm.conf
ADD config/supervisord/start-php7.2-fpm.sh /start-php7.2-fpm.sh

ADD config/conf.d/nginx_default /etc/nginx/sites-enabled/default
ADD config/conf.d/mysqld_innodb.cnf /config/mysqld_innodb.cnf
ADD config/conf.d/mysqld_innodb_osx.cnf /config/mysqld_innodb_osx.cnf



RUN mkdir -p /var/run/php


ADD config/run.sh /run.sh
RUN sed -i 's/\r$//' /run.sh
RUN chmod 777 /*.sh


# RUN rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql /var/run/mysqld \
# 	&& chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
# # ensure that /var/run/mysqld (used for socket and lock files) is writable regardless of the UID our mysqld instance ends up having at runtime
# 	&& chmod 777 /var/run/mysqld

EXPOSE 80 3306
CMD bash -C '/run.sh';'bash'