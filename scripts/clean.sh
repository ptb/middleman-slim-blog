#!/bin/sh

PROGNAME=`type $0 | /usr/bin/awk '{print $3}'`
PROGDIR=`dirname $PROGNAME`

/bin/rm -rf $PROGDIR/../build/*

/usr/bin/find "$PROGDIR/../build" -name '.DS_Store' -type f -delete
/usr/bin/xattr -d com.apple.FinderInfo $PROGDIR/../**/*
/usr/bin/xattr -d com.macromates.caret $PROGDIR/../**/*
