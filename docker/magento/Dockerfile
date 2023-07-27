ARG PHP_EXTENSIONS="soap gmp intl bcmath imagick gd xdebug pdo_mysql ds"

FROM thecodingmachine/php:8.1-v4-slim-apache

USER root
RUN apt-get update\
    && apt-get install -y \
      mariadb-client \
    && rm -rf /var/lib/apt/lists/*

USER docker
