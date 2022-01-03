#!/bin/sh
## backing up all DBs from remote host
dbuser=<USER>
dbpwd=<PAWSSWORD>
host=<HOSTIP>
bakpath=<FILESYSTEMPATH>
prefix=<PREFIX>
deleteolderthandays=14

mysqldump -h $host -u $dbuser --password=$dbpwd --all-databases | gzip > $bakpath/$prefix-$(date +%Y-%m-%d_%H-%M).sql.gz

find $bakpath/ -name $prefix*.sql.gz -type f -mtime +$deleteolderthandays -delete

exit 0
