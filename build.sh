#!/bin/sh
set -e
cd "$(dirname "$0")"
for dir in dmenu dwm slstatus; do
    ( cd "$dir" && make && sudo make install && make clean )
done
