#!/bin/bash

set -euo pipefail

for i in {0..42}; do
	if mariadb -hmariadb -u$MYSQL_USER -p$MYSQL_PASSWORD --database=$MYSQL_DATABASE <<<'SELECT 1;' &> /dev/null
	then
		break
	fi
	sleep 1
done

if [ "$i" = 42 ]
then
	echo "Error: starting wordpress"
	exit 1
fi

if [ ! -f "/var/www/html/wp-config.php" ]
then
	unzip wordpress-6.0.2.zip >/dev/null
	rm -rf wordpress-6.0.2.zip
	mv wordpress/* html/
	rm -rf wordpress/

	wp config create --allow-root \
		--dbname=$MYSQL_DATABASE \
		--dbuser=$MYSQL_USER \
		--dbpass=$MYSQL_PASSWORD \
		--dbhost=mariadb \
		--dbcharset="utf8" \
		--dbcollate="utf8_general_ci" \
		--path="/var/www/html"

	wp core install --allow-root \
		--title="wordpress" \
		--admin_name="wordpress" \
		--admin_password="wordpress" \
		--admin_email="tok@wordpress.jp" \
		--skip-email \
		--url=$DOMAIN_NAME \
		--path="/var/www/html"

	wp user create --allow-root \
		$WP_USER \
		$WP_EMAIL \
		--role=author \
		--user_pass=$WP_PASS \
		--path="/var/www/html" 
fi

echo "Wordpress listening to port 9000"
exec "$@"
