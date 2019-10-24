#!/bin/bash
if [ "$NODE_NAME" = "node1" ]
then
    echo ">>> CREATE DATA DIRECTORY ON MASTER NODE"
    /usr/lib/postgresql/9.5/bin/initdb -D /home/postgres/data
    echo ">>> COPY CONFIGURATION FILES"
    cp /usr/local/bin/cluster/postgresql/config/postgresql.conf /home/postgres/data
    cp /usr/local/bin/cluster/postgresql/config/pg_hba.conf /home/postgres/data
else
    echo ">>> $NODE_NAME IS WAITING MASTER IS UP AND RUNNING"
    while ! nc -z node1 5432; do sleep 1; done;
    sleep 10
    echo ">>> REPLICATE DATA DIRECTORY ON SLAVE $NODE_NAME"
    /usr/lib/postgresql/9.5/bin/pg_basebackup -h 10.0.2.31 -p 5432 -U postgres -D /home/postgres/data -X stream -P
    echo ">>> COPY recovery.conf ON SLAVE $NODE_NAME"
    cp /usr/local/bin/cluster/postgresql/config/recovery.conf /home/postgres/data
    sed "s/NODE_NAME/$NODE_NAME/g"
fi
echo ">>> START POSTGRESQL ON NODE $NODE_NAME"
/usr/lib/postgresql/9.5/bin/postgres -D /home/postgres/data > /home/postgres/logs/postgres.log 2>&1
