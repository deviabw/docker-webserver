FROM iabd/base_webserver_nginx_php_7_2

RUN apt-get -y install supervisor

ADD config/supervisord-apache2.conf /etc/supervisor/conf.d/supervisord-apache2.conf
ADD config/supervisord-mysqld.conf /etc/supervisor/conf.d/supervisord-mysqld.conf
ADD config/start-mysqld.sh /start-mysqld.sh
ADD config/start-apache2.sh /start-apache2.sh

ADD config/run.sh /run.sh
RUN sed -i 's/\r$//' /run.sh
RUN chmod 777 /*.sh

EXPOSE 80 3306
CMD bash -C '/run.sh';'bash'