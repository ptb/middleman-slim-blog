#!/bin/sh

DOMAIN='example.com'

google=`/usr/bin/osascript - <<EOM
do shell script "/usr/bin/curl -L http://www.google.com/webmasters/tools/ping?sitemap=http%3A%2F%2F$DOMAIN%2Fsitemap.xml"
EOM`

yahoo=`/usr/bin/osascript - <<EOM
do shell script "/usr/bin/curl -L http://search.yahooapis.com/SiteExplorerService/V1/ping?sitemap=http%3A%2F%2F$DOMAIN%2Fsitemap.xml"
EOM`

bing=`/usr/bin/osascript - <<EOM
do shell script "/usr/bin/curl -L http://www.bing.com/ping?sitemap=http%3A%2F%2F$DOMAIN%2Fsitemap.xml"
EOM`

echo "\n From Google: "
echo $google

echo "\n From Yahoo: "
echo $yahoo

echo "\n From Bing: "
echo $bing

read -p 'Press any key to continue... ' -n1 -s
