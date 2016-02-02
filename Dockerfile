FROM debian:jessie

MAINTAINER Elie Charra <elie.charra [at] kitpages.fr>

RUN apt-get update && apt-get -y install \
    git \
    nginx \
    php5 \
    php5-cli \
    php5-intl \
    php5-fpm \
    php5-mysql &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN php -r "readfile('https://getcomposer.org/installer');" | php -- \
             --install-dir=/usr/local/bin \
             --filename=composer

RUN echo 'clear_env = no' >> /etc/php5/fpm/pool.d/www.conf &&\
    sed -i -e "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php5/fpm/php.ini &&\
    echo "daemon off;" >> /etc/nginx/nginx.conf

ADD config/vhost.conf /etc/nginx/sites-enabled/default
ADD start.sh /root/start.sh

WORKDIR /var/www

EXPOSE 80

CMD ["/bin/bash", "/root/start.sh"]
