
<VirtualHost *:443>
      ServerAdmin admin@adonislinux.com
      ServerName www.svn.adonislinux.com
      ServerAlias svn.adonislinux.com	
      DocumentRoot /var/svn    
      SSLEngine on
      SSLCertificateFile /etc/apache2/ssl/apache.pem
      SSLProtocol all
      SSLCipherSuite HIGH:MEDIUM
   
	<Location /var/svn>
        DAV svn
        SVNParentPath /var/svn	
	SVNListParentPath on
        #SVNPath /var/svn/adonis
	AuthType Basic
        AuthName "Subversion Repository"
        AuthUserFile /path/to/file
        # Required authentication
	Require valid-user

        # Require encryption
        #SSLRequireSSL
	#Order deny,allow
	#Allow from all
      </Location>
	
      <Location /compileit>
      DAV svn
      SVNPath /var/svn/compileit/
      order allow,deny
      Satisfy Any
      AuthType Basic
      AuthName "Subversion"
      AuthUserFile /path/to/file
      Require valid-user
      </Location>

      <Location /erebos>
      DAV svn
      SVNPath /var/svn/erebos/
      order allow,deny
      Satisfy Any
      AuthType Basic
      AuthName "Subversion"
      AuthUserFile /path/to/file 
      Require valid-user
      </Location>

 ErrorLog /var/log/apache2/error.log

      LogLevel warn

      CustomLog /var/log/apache2/access.log combined
      ServerSignature On

</VirtualHost>

