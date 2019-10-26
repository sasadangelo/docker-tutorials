#!/bin/bash
echo ">>> CREATE DATA DIRECTORY ON MASTER NODE"
/usr/lib/postgresql/9.5/bin/initdb -D /home/postgres/data

echo ">>> START POSTGRESQL ON NODE $NODE_NAME"
/usr/lib/postgresql/9.5/bin/postgres -D /home/postgres/data > /home/postgres/logs/postgres.log 2>&1
