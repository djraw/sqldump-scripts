#!/bin/sh
## backing up all DBs from remote host
dbuser=<USER>
dbpwd=<PAWSSWORD>
host=<HOSTIP>
bakpath=<FILESYSTEMPATH>
prefix=<PREFIX>
deleteolderthandays=14

mysqldump -h $host -u $dbuser --password=$dbpwd --all-databases | xz > $bakpath/$prefix-$(date +%Y-%m-%d_%H-%M).sql.xz

find $bakpath/ -name $prefix*.sql.gz -type f -mtime +$deleteolderthandays -delete

exit 0

## How to restore
##
## The easiest way is to use -o or --one-database option of the mysql command when restoring the database.
## 
## $ mysql -p -o database_name < all_databases.sql
## 
## The database_name is the database you want to restore, all_databases.sql is the mysql backup file which contains all databases, or multiple databases.
## Example : MySQL --one-database Restore One Database
## 
## For example, let's say you backup the all databases in your MySQL/MariaDB Server using the mysqldump command.
## 
## $ mysqldump -p --all-databases > all_databases.sql
## 
## Now, you want to restore one database called db1 from the dump file.
## 
## $ mysql -p --one-database db1 < all_databases.sql
## 
## The above command will restore the database db1 from the all_databases.sql file.
