#!/bin/sh
if [ ! -d /var/www/backup ]; then
    mkdir /var/www/backup
fi
cd /var/www/backup
innobackupex-1.5.1 --user=XXXX --password=XXXXXXXXX --slave-info --defaults-file=/etc/mysql/my.cnf --databases="XXXXXXX" --stream=tar ./ | gzip -c -1 > ./db.`date +%Y-%m-%d-%H-%M-%S`.tar.gz
tar -czf uploads.`date +%Y-%m-%d-%H-%M-%S`.tar.gz /var/www/uploads
find ./* -iname '*.tar.gz' -mtime +5 -exec rm {} \;
rsync -avz -e ssh /var/www/backup/* backup@tiger.backupwebsite.com:~/backup
