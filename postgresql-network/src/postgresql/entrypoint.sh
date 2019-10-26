#!/bin/bash
set -e
echo '>>> CONFIGURE POSTGRESQL ...'
/usr/local/bin/cluster/postgresql/bin/entrypoint.sh & wait ${!}

EXIT_CODE=$?

echo ">>> POSTGRESQL TERMINATED WITH EXIT CODE: $EXIT_CODE"

exit $EXIT_CODE
