#!/bin/sh

cd "$(/usr/bin/dirname "$0")/../"
bundle exec middleman build --clean --verbose

read -p 'Press any key to continue... ' -n1 -s
