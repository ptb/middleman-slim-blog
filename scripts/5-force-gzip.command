#!/bin/sh

BUILDDIR="$(/usr/bin/dirname "$0")/../build"

/usr/bin/find $BUILDDIR -name '.DS_Store' -type f -delete
/usr/bin/find $BUILDDIR -name '*.gz' -type f -exec /bin/bash -c 'for f; do base=${f##*/}; mv -- "$f" "${f%/*}/${base//.gz/}"; done' _ {} +
