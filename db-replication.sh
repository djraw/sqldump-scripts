#!/bin/bash
## replication of a db to another server

bakpath=~
# source db vars
dumpuser=<SourceUser>
dumppwd=<SourcePassword>
dumphost=<SourceHost>
database="<SourceDBname(s)>"
# destination db vars
repluser=<DestinationUser>
replpwd=<DestinationPassword>
replhost=<DestinationHost>

## dump source to file
mysqldump -h $dumphost -u $dumpuser --password=$dumppwd --databases $database > $bakpath/db-dump.sql

## restore to destination
mysql --host=$replhost -u $repluser -p"$replpwd" < $bakpath/db-dump.sql

# cleanup, remove dump file
rm $bakpath/db-dump.sql

exit 0