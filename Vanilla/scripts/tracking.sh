#!/bin/sh
export DISPLAY=:0

if  [[ "$(xdo id -a Tracking)" == "" ]];
then
    emacs --config tracking;
fi

