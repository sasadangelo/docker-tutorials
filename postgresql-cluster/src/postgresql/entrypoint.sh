#!/bin/bash
set -e
echo "$NODE_NAME" > /home/postgres/out2.log
echo '>>> CONFIGURE POSTGRESQL ...'
/usr/local/bin/cluster/postgresql/bin/entrypoint.sh $NODE_NAME & wait ${!}

EXIT_CODE=$?

while [ -f /var/run/recovery.lock ]; do
    sleep 1;
done;
echo ">>> POSTGRESQL TERMINATED WITH EXIT CODE: $EXIT_CODE"

exit $EXIT_CODE
