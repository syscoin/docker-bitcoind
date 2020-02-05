#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
if [ "${1#-}" != "$1" ] || [ "${1%.conf}" != "$1" ]; then
	set -- sys_oneshot "$@"
fi

# allow the container to be started with `--user`
if [ "$1" = 'sys_oneshot' -a "$(id -u)" = '0' ]; then
	chown -R syscoin .
	exec gosu syscoin "$0" "$@"
fi

exec "$@"

