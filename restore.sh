cd /var/lib/mysql && \
    tar -xzif $1 && \
    innobackupex-1.5.1 --apply-log --ibbackup=xtrabackup_51 ./ && chown -R mysql:mysql /var/lib/mysql
#&& service mysql start
