#!/bin/bash

# Quit Vivaldi
osascript -e 'quit app "Vivaldi.app"'

# Find path to Framework folder of current version and save it as variable
findPath="`find /Applications/Vivaldi.app -name Vivaldi\ Framework.framework`"
workPath=$(cd `dirname $0`; pwd)

# Copy custom files to Vivaldi.app
cp "$workPath"/custom.js "$findPath"/Resources/vivaldi/

# Save path to browser.html as variable
browserHtml="$findPath"/Resources/vivaldi/browser.html

# Insert references, if not present, and save to temporary file
sed 's|  </body>|    <script src="custom.js"></script></body>|' "$browserHtml" > "$browserHtml".temp

# Backup original file
cp "$browserHtml" "$browserHtml".bak

# Overwrite
mv "$browserHtml".temp "$browserHtml"

# Pause script
read -rsp $'Press [Enter] to restart Vivaldi...\n'

# Open Vivaldi
open /Applications/Vivaldi.app --args --debug-packed-apps --silent-debugger-extension-api
