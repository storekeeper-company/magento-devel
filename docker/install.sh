#!/bin/bash

source env/blackfire.env
source env/db.env
source env/elasticsearch.env
source env/magento.env
source env/opensearch.env
source env/phpfpm.env
source env/rabbitmq.env
source env/redis.env

composer config --global http-basic.repo.magento.com "$MAGENTO_PUBLIC" "$MAGENTO_PRIVATE"
composer create-project --repository-url=https://repo.magento.com/ \
     "${META_PACKAGE}" /tmp/exampleproject "${META_VERSION}"

cp /tmp/exampleproject/* /var/www/html/
 rm -rf /tmp/exampleproject/