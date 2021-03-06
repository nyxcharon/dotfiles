<VirtualHost *:80>
    ServerName www.bugs.adonislinux.com
    ServerAlias bugs.adonislinux.com
    ServerAdmin admin@adonislinux.com
    Alias /bugzilla3 /usr/share/bugzilla3/web
	      
    <Directory "/usr/share/bugzilla3/web">
        AddHandler cgi-script cgi
        DirectoryIndex index.cgi
        Options +Indexes +ExecCGI -MultiViews +SymLinksIfOwnerMatch +FollowSymLinks
        AllowOverride None
        Order allow,deny
        Allow from all
    </Directory>

    <Directory "/usr/share/bugzilla3/web/data">
        Options +FollowSymLinks -Indexes
        AllowOverride None
        Order allow,deny
        Allow from all
    </Directory>

    <Directory "/usr/share/bugzilla3/web/js">
        Options +FollowSymLinks -Indexes
        AllowOverride None
        Order allow,deny
        Allow from all
    </Directory>

    <Directory "/usr/share/bugzilla3/web/skins">
        Options +FollowSymLinks -Indexes
        AllowOverride None
        Order allow,deny
        Allow from all
    </Directory>
</VirtualHost>
