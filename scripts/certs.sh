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

#SSH -A $USER@$1 "mkdir -p /tmp/certs &"
#scp /home/bmartin4/certs/* $1:/tmp/certs
#ssh -A $USER@$1 "sudo cp /tmp/certs/* /etc/ssl/certs "

exit 0
