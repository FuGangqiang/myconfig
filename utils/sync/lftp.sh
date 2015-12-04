#!/bin/bash
HOST='192.168.199.249:2121'
USER='fugq'
PASS='123456'
TARGETFOLDER='/00-bak'
SOURCEFOLDER=~/Book

lftp -f "
open $HOST
user $USER $PASS
lcd $SOURCEFOLDER
mirror --reverse --delete --verbose $SOURCEFOLDER $TARGETFOLDER
bye
"
