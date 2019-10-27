#!/bin/bash
echo ">>> CREATE DATA DIRECTORY"
/usr/lib/postgresql/9.5/bin/initdb -D /home/postgres/data/postgres
echo ">>> COPY CONFIGURATION FILES"
cp /usr/local/bin/cluster/postgresql/config/postgresql.conf /home/postgres/data/postgres
cp /usr/local/bin/cluster/postgresql/config/pg_hba.conf /home/postgres/data/postgres
echo ">>> START POSTGRESQL ON NODE $NODE_NAME"
/usr/lib/postgresql/9.5/bin/postgres -D /home/postgres/data/postgres > /home/postgres/data/logs/postgres.log 2>&1
