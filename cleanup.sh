#!/bin/sh
cd /root/backup
find ./* -iname '*.tar.gz' -mtime +5 -exec rm {} \;
