#!/bin/sh

PROGNAME=`type $0 | /usr/bin/awk '{print $3}'`
PROGDIR=`dirname $PROGNAME`

bundle exec middleman build --clean --verbose
