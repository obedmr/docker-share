#/bin/sh

set -x

DEFAULT_ROOT_PATH=/usr/share/nginx/html
SHARE_PATH="${SHARE_PATH:-/share}"
PHP_FPM_USER=nginx
PHP_FPM_GROUP=nginx


if [ -d $SHARE_PATH ]; then
    echo Setting $SHARE_PATH as default share location
    rm -rf $SHARE_PATH/_h5ai
    cp -R $DEFAULT_ROOT_PATH/_h5ai $SHARE_PATH/
    DEFAULT_ROOT_PATH=$SHARE_PATH
else
    echo Setting $DEFAULT_ROOT_PATH as default share location
fi

export DEFAULT_ROOT_PATH
envsubst  '${DEFAULT_ROOT_PATH}' </etc/nginx/conf.d/default.conf > /etc/nginx/conf.d/default.conf


sed -i "s|;listen.owner\s*=\s*nobody|listen.owner = ${PHP_FPM_USER}|g" /etc/php7/php-fpm.conf
sed -i "s|;listen.group\s*=\s*nobody|listen.group = ${PHP_FPM_GROUP}|g" /etc/php7/php-fpm.conf
php-fpm7

nginx

tail -f /var/log/nginx/*.log /var/log/php7/*.log
