#!/bin/sh
cd .. /

# INITIALIZE CONTEINERS 
docker-compose up -d --build && 

#INSTALL DEPENDENCIES
docker exec -i zord-api bash -c "cd /var/www/html && composer install" &&

# EXECUTE MIGRATIONS DATABASE
docker exec -i zord-api bash -c "cd /var/www/html && php artisan migrate" &&

# EXECUTE TESTS
docker exec -i zord-api bash -c "cd /var/www/html && php artisan test --testsuite=Feature"

echo "Aplicação configurada."