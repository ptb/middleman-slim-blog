#!/bin/sh

PROGNAME=`type $0 | /usr/bin/awk '{print $3}'`
PROGDIR=`dirname $PROGNAME`

/usr/bin/find "$PROGDIR/../build" -name '.DS_Store' -type f -delete
/usr/bin/find "$PROGDIR/../build" -name '*.gz' -type f -exec /bin/bash -c 'for f; do base=${f##*/}; mv -- "$f" "${f%/*}/${base//.gz/}"; done' _ {} +
