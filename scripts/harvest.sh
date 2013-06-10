#! /bin/bash
echo $HOSTNAME
#tmp dir
mkdir -p /tmp/certs

FILES="/etc/ssl/certs/intermediate.certificate
/etc/ssl/certs/lcsee.wvu.edu.key                                      
/etc/ssl/certs/wildcard.lcsee.wvu.edu.certificate"

for file in $FILES
do
    cp $file /tmp/certs
done

tar -zcvf ~/certs.tar.gz /tmp/certs
scp ~/certs.tar.gz $USER@tnode001:~/

exit 0
