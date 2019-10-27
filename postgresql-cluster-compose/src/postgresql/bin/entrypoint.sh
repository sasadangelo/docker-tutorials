#!/bin/bash
if [ "$NODE_NAME" = "node1" ]
then
    echo ">>> CREATE DATA DIRECTORY ON THE MASTER NODE"
    /usr/lib/postgresql/9.5/bin/initdb -D /home/postgres/data/postgres
    echo ">>> COPY CONFIGURATION FILES"
    cp /usr/local/bin/cluster/postgresql/config/postgresql.conf /home/postgres/data/postgres
    cp /usr/local/bin/cluster/postgresql/config/pg_hba.conf /home/postgres/data/postgres
else
    echo ">>> $NODE_NAME IS WAITING MASTER IS UP AND RUNNING"
    while ! nc -z node1 5432; do sleep 1; done;
    sleep 10
    echo ">>> REPLICATE DATA DIRECTORY ON THE SLAVE $NODE_NAME"
    /usr/lib/postgresql/9.5/bin/pg_basebackup -h 10.0.2.31 -p 5432 -U postgres -D /home/postgres/data/postgres -X stream -P
    echo ">>> COPY recovery.conf ON SLAVE $NODE_NAME"
    cp /usr/local/bin/cluster/postgresql/config/recovery.conf /home/postgres/data/postgres
    sed "s/NODE_NAME/$NODE_NAME/g"
fi
echo ">>> START POSTGRESQL ON NODE $NODE_NAME"
/usr/lib/postgresql/9.5/bin/postgres -D /home/postgres/data/postgres > /home/postgres/data/logs/postgres.log 2>&1
