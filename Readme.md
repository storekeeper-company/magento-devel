
Install

```bash 
docker-compose run app bash

composer config --global http-basic.repo.magento.com 2cb7731c52c5142a6351fe1a3bfbf013 ea82d7f9604d09ca41cd2ea9264f1f71
composer create-project --repository=https://repo.magento.com/ magento/project-community-edition=2.4.6-p1 .

composer config --no-plugins allow-plugins.magento/magento-composer-installer true
composer config --no-plugins allow-plugins.magento/inventory-composer-installer true
composer config --no-plugins allow-plugins.laminas/laminas-dependency-plugin true


source install-env/blackfire.env  
source install-env/db.env  
source install-env/elasticsearch.env  
source install-env/magento.env  
source install-env/opensearch.env  
source install-env/phpfpm.env  
source install-env/rabbitmq.env  
source install-env/redis.env

bin/magento setup:install \
  --db-host="$MYSQL_HOST" \
  --db-name="$MYSQL_DATABASE" \
  --db-user="$MYSQL_USER" \
  --db-password="$MYSQL_PASSWORD" \
  --base-url=http://localhost:9442/ \
  --base-url-secure=http://localhost:9443/ \
  --backend-frontname="$MAGENTO_ADMIN_FRONTNAME" \
  --admin-firstname="$MAGENTO_ADMIN_FIRST_NAME" \
  --admin-lastname="$MAGENTO_ADMIN_LAST_NAME" \
  --admin-email="$MAGENTO_ADMIN_EMAIL" \
  --admin-user="$MAGENTO_ADMIN_USER" \
  --admin-password="$MAGENTO_ADMIN_PASSWORD" \
  --language="$MAGENTO_LOCALE" \
  --currency="$MAGENTO_CURRENCY" \
  --timezone="$MAGENTO_TIMEZONE" \
  --amqp-host="$RABBITMQ_HOST" \
  --amqp-port="$RABBITMQ_PORT" \
  --amqp-user="$RABBITMQ_DEFAULT_USER" \
  --amqp-password="$RABBITMQ_DEFAULT_PASS" \
  --amqp-virtualhost="$RABBITMQ_DEFAULT_VHOST" \
  --cache-backend=redis \
  --cache-backend-redis-server="$REDIS_CACHE_BACKEND_SERVER" \
  --cache-backend-redis-db="$REDIS_CACHE_BACKEND_DB" \
  --page-cache=redis \
  --page-cache-redis-server="$REDIS_PAGE_CACHE_SERVER" \
  --page-cache-redis-db="$REDIS_PAGE_CACHE_DB" \
  --session-save=redis \
  --session-save-redis-host="$REDIS_SESSION_SAVE_HOST" \
  --session-save-redis-log-level=4 \
  --session-save-redis-db=2 \
  --elasticsearch-host="$ES_HOST" \
  --elasticsearch-port="$ES_PORT" \
  --opensearch-host="$OPENSEARCH_HOST" \
  --opensearch-port="$OPENSEARCH_PORT" \
  --search-engine=opensearch \
  --use-rewrites=1 \
  --no-interaction
 
 
bin/magento config:set web/secure/base_url http://localhost:9443/
bin/magento config:set web/unsecure/base_url http://localhost:9442/
```
