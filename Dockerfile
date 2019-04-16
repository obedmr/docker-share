FROM nginx:alpine
MAINTAINER obed.n.munoz@gmail.com


RUN apk add --no-cache php7-curl php7-dom php7-gd php7-ctype php7-zip php7-xml php7-iconv php7-sqlite3 php7-mysqli php7-pgsql php7-json php7-phar php7-openssl php7-pdo php7-session php-fpm --update

ADD nginx.default.conf /etc/nginx/conf.d/default.conf

WORKDIR /usr/share/nginx/html
RUN rm index.html
RUN wget https://release.larsjung.de/h5ai/h5ai-0.29.2.zip ; \
    unzip h5ai-0.29.2.zip ; \
    rm h5ai-0.29.2.zip

ADD bootstrap.sh /usr/bin/bootstrap.sh

CMD ["/bin/sh", "/usr/bin/bootstrap.sh"]