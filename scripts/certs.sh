#! /bin/bash

#Check to see if ssh keys are loaded
KEYS=`ssh-add -l`
if ! [ $? -eq 0 ]
then
    echo "Load your keys before running this script"
exit 1
fi

#Make sure a user specifies a servername
if [ $# -ne 1 ]
then
    echo "Usage: certs servername"
    exit 1
fi

WEBSERVER=www002
#ssh to a webserver and tar certs, scp to tnode
scp harvest.sh $USER@$WEBSERVER:~/ 
ssh -A $USER@$WEBSERVER "./harvest.sh"

#scp files to test machine, exract, put in place
scp ~/certs.tar.gz $USER@$1:~/
ssh -A $USER@$1 "tar -xvzf certs.tar.gz &"
ssh -A $USER@$1 "sudo cp /tmp/certs/* /etc/ssl/certs &"

exit 0

