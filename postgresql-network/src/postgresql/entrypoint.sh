#!/bin/bash
set -e
echo '>>> STARTUP POSTGRESQL ...'
/usr/local/bin/cluster/postgresql/bin/entrypoint.sh & wait ${!}

EXIT_CODE=$?

echo ">>> POSTGRESQL TERMINATED WITH EXIT CODE: $EXIT_CODE"

exit $EXIT_CODE
