#!/bin/sh

cd `dirname $0`
set -e

uname | grep 'Darwin' >/dev/null 2>&1 || { echo >&2 "The script doesn't support your OS yet, aborting"; exit 1; }

for VER in 2 3; do
  FOLDER=~/Library/Application\ Support/Sublime\ Text\ $VER/Packages/Lua
  if [ -d "$FOLDER" ]; then 
    echo "Installing to $FOLDER..."
    rsync -a --exclude 'install.sh' ./* "$FOLDER/"
  fi
done
 
echo "Installation successful"
