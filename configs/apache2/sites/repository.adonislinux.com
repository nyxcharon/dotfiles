<VirtualHost *:80>
ServerName repository.adonislinux.com	
ServerAlias repository.adonislinux.com
ServerAdmin admin@adonislinux.com
DocumentRoot /var/www/apt
</VirtualHost>
