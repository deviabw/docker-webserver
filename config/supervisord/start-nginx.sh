#!/bin/bash
# source /etc/apache2/envvars
# exec apache2 -D FOREGROUND

exec nginx -g "daemon off;"
