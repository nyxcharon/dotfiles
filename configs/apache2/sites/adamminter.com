<VirtualHost *:80>
	ServerName adamminter.com
	ServerAlias adaminter.com
	ServerAdmin admin@adonislinux.com
	DocumentRoot /var/www/adamminter.com

</VirtualHost>
