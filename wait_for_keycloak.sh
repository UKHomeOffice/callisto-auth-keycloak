#!/bin/sh
# docker logs -f $1 2> /dev/null | grep -m 1 "Admin console listening on"
# kill -s INT $$
(sleep 120 && kill -s INT $$ && exit 1) &
mysleep=$!
docker logs -f $1 2> /dev/null | grep -m 1 "Admin console listening on"
trap "kill $(jobs -p)" INT TERM HUP QUIT EXIT
