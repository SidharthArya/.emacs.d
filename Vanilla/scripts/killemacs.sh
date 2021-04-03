#!/bin/sh
killall emacs

while pgrep emacs;
do
    sleep 5;
done
