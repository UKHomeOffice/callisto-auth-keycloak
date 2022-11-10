#!/bin/sh
# docker logs -f $1 2> /dev/null | grep -m 1 "Admin console listening on"
# kill -s INT $$
# set -m
# (sleep 3 && echo Timed out waiting for Keycloak && kill -s INT $$ && exit 1) &
# mysleep=$!
# docker logs -f $1 2> /dev/null | grep -m 1 "Admin console listening on2"
# trap "echo killing ;kill $(jobs -p)" INT TERM HUP QUIT EXIT

sleep 60 && docker logs -f $1 2> /dev/null | grep -m 1 "Admin console listening on" &
loggrep=$!
(sleep 3 && echo Timed out waiting for Keycloak && kill -9 $loggrep) &
wait $loggrep
