<VirtualHost _default_:80>
    ServerAdmin admin@adonislinux.com
    ServerName www.svn.adonislinux.com 
    ServerAlias svn.adonislinux.com
    DocumentRoot /var/svn    
    RewriteEngine On
    RewriteCond %{SERVER_PORT} =80
    RewriteRule ^ https://svn.adonislinux.com%{REQUEST_URI} [L,R=301] 
</VirtualHost>
<VirtualHost *:443>
      ServerAdmin admin@adonislinux.com
      ServerName www.svn.adonislinux.com
      ServerAlias svn.adonislinux.com
      DocumentRoot /var/svn    
      SSLEngine on
      SSLCertificateFile /etc/ssl/certs/cert.crt 
      SSLCertificateKeyFile /etc/ssl/certs/key.key
      SSLCACertificateFile /etc/ssl/certs/ExternalCert.crt
      SSLCACertificateFile /etc/ssl/certs/AnotherExternalCert.crt
      SSLProtocol all
      SSLCipherSuite HIGH:MEDIUM
   
      <Location /var/svn>
      DAV svn
      SVNParentPath /var/svn
      SVNListParentPath on
      AuthType Basic
      AuthName "Subversion Repository"
      AuthUserFile /some/path
      Require valid-user
      </Location>
	      
      <Location /repo1>
      DAV svn
      SVNPath /var/svn/repo1/
      order allow,deny
      Satisfy Any
      AuthType Basic
      AuthName "Subversion"
      AuthUserFile /some/path
      Require valid-user
      </Location>

      <Location /repo2>
      DAV svn
      SVNPath /var/svn/repo2/
      order allow,deny
      Satisfy Any
      AuthType Basic
      AuthName "Subversion"
      AuthUserFile /some/path
      Require valid-user
      </Location>

      ErrorLog /var/log/apache2/error.log
      LogLevel warn
      CustomLog /var/log/apache2/access.log combined
      ServerSignature On
</VirtualHost>
