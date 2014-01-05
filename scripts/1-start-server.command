#!/bin/sh

/usr/bin/killall middleman

cd "$(/usr/bin/dirname "$0")/../"
bundle exec middleman server -p 5001 --verbose

read -p 'Press any key to continue... ' -n1 -s
