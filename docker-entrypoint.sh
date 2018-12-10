#!/bin/bash
set -e

trap 'kill -2 1; wait 1' SIGTERM

# if [ "$1" = 'mongod' ]; then
#     #exec /sbin/tini -- -g /usr/bin/mongod
#     exec /usr/bin/mongod "$@"
# fi

if [ -e /data/db/mongod.lock ]; then
	rm /data/db/mongod.lock
	mongod --repair
fi

exec "$@"
