#!/bin/sh

title=`/usr/bin/osascript - <<EOM
if "SystemUIServer" is not in every paragraph of (do shell script "ps -Ac -o comm=") then return

tell application "SystemUIServer"
	display dialog "Type a title for the new article." with title "Create New Article" default answer ""
	set result to text returned of result
end tell
EOM`

cd "$(/usr/bin/dirname "$0")/../"
path=$(bundle exec middleman article "$title" | /usr/bin/grep 'source' | /usr/bin/awk '{ print $(NF) }')

# edit=$(/usr/bin/find '/Applications/TextWrangler.app/Contents/Helpers' -name '*edit*' -type f)
edit=$(/usr/bin/find '/Applications/BBEdit.app/Contents/Helpers' -name '*edit*' -type f)

$($edit $path)
