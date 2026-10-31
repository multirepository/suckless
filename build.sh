#!/bin/sh
cd "$(dirname "$0")"
cd dmenu && sudo make clean install && make clean
cd ../dwm && sudo make clean install && make clean
cd ../slstatus && sudo make clean install && make clean
