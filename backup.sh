#!/bin/sh

# FTP LOGIN
HOST='ftp'
USER='ftpu'
PASSWORD='ftp'

# SOURCE DIRECTORY
REMOTE_DIR='/absolute/path/to/sauce'

#TARGET DIRECTORY
NOW=$(date +"%d-%m-%Y")
cd backup
mkdir $NOW
LOCAL_DIR='/absoute/path/to/tar/'$NOW

# RUNTIME!
echo
echo "Starting download $REMOTE_DIR from $HOST to $LOCAL_DIR"
date

lftp -u "$USER","$PASSWORD" $HOST <<EOF

# transfer starts now...
mirror --use-pget-n=10 $REMOTE_DIR $LOCAL_DIR;
exit
EOF
echo
echo "Transfer finished"
date
