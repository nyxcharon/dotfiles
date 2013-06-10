<VirtualHost *:80>
	ServerName www.downloads.adonislinux.com	
	ServerAlias downloads.adonislinux.com
	ServerAdmin admin@adonislinux.com
	DocumentRoot /var/www/downloads.adonislinux.com
	CustomLog /var/log/apache2/adonis "%h %l %u %t \"%r\" %>s %b"
</VirtualHost>
