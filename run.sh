#!/bin/bash

if [ ! -d /app ]; then
    mkdir /app
fi

if [ ! -e /app/index.php ]; then
    cp -rf /wp-download/wordpress/* /app/.
fi

if [ ! -e /app/wp-config.php ]; then
    cp /config/wp-config.php /app/.
fi

exec supervisord -n -c /etc/supervisor/supervisord.conf
