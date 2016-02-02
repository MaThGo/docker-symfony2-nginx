# docker-symfony2

[![](https://badge.imagelayers.io/kitpages/symfony2-nginx:latest.svg)](https://imagelayers.io/?images=kitpages/symfony2-nginx:latest 'Get your own badge on imagelayers.io')

Docker for symfony2 application.

Based on Ubuntu 14.04.

## How to use (pre-build image)

You must have docker installed.

```bash
docker pull kitpages/symfony2-nginx
```

Then

```bash
docker run -v /home/user/symfony2:/var/www -p 8080:80 -d kitpages/symfony2-nginx
```

### Environnement

To run doctrine migrations :
```bash
docker run -e SF_DB_MIGRATE=1 -v /home/user/symfony2:/var/www -p 8080:80 -d kitpages/symfony2-nginx
```

Docker is accessible on http://localhost:8080/app.php

## Package included
* htop
* curl
* vim
* nginx
* php5-fpm
* php5-cli
* php5-intl

## Exposed port
* 80 : nginx
