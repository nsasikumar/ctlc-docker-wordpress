#!/bin/bash

if [ ! -d /app ]; then
    mkdir /app
fi

if [ ! -e /app/index.php ]; then
    cp -rf /wp-download/wordpress/* /app/.
fi

# save config, or blow it away?
#if [ ! -e /app/wp-config.php ]; then
    cp /config/wp-config.php /app/.
#fi

chown -R www-data /app

exec supervisord -n -c /etc/supervisor/supervisord.conf
